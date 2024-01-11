function run(input, parameters) {
    var app = Application.currentApplication();
    app.includeStandardAdditions = true;

    var { folderName, folderPath } = showOpenFolder(app);
    if (folderName) {
        showOpenInList(app, folderName, folderPath);
    }
}

function showOpenFolder(app) {
    var repoPath = "/Users/ernest.surys/Repos/Homa";

    // use finder to select folder
    var defaultLocation = Path("/Users/ernest.surys/Repos/Homa");
    var folderPath = app.chooseFolder({withPrompt: "Please select a folder:", defaultLocation: defaultLocation}).toString();
    console.log(typeof folderPath);
    var pathArray = folderPath.split("/");
    var folderName = pathArray[pathArray.length - 1];


    /* use list to select folder    
    var folderListString = app.doShellScript("ls " + repoPath);
    folderListString = folderListString.replace(/\s/g, "\n");
    var folderList = folderListString.split("\n");
    var folderName = app.chooseFromList(folderList, {
        withPrompt: "Please select a folder:",
    }); 
    var folderPath = repoPath + "/" + folderName;
    */

    console.log(`folderName: ${folderName}`);
    console.log(`folderPath: ${folderPath}`);
    return { folderName, folderPath };
}

function showOpenInList(app, folderName, folderPath) {
    var actionList = [
        "🍴 Fork",
        "📁 Finder",
        "🟦 VS Code",
        "⬛️ Terminal",
        "🐙 GitHub",
        "🐙 GitHub Action",
        "🐙 GitHub PRs",
    ];
    var chosenAction = app.chooseFromList(actionList, {
        withPrompt: `Open ${folderName} in:`,
        multipleSelectionsAllowed: true,
    });
    var selectedIndex = actionList.indexOf(chosenAction[0]);
    switch (selectedIndex) {
        case 0:
            openInApp(app, folderPath, "Fork");
            break;
        case 1:
            openInApp(app, folderPath, "Finder");
            break;
        case 2:
            openInApp(app, folderPath, "Warp");
            break;
        case 3:
            openInApp(app, folderPath, "code");
            break;
        case 4:
            openGithubPage(app, folderPath);
            break;
    }
}

function openInApp(app, folderPath, appName) {
    app.doShellScript(`open -a ${appName} "${folderPath}"`);
}

function openGithubPage(app, folderPath) {
    var gitConfigPath = folderPath + "/.git/config";
    var gitConfigContents = app.read(Path(gitConfigPath));
    var webAddress = extractWebAddress(gitConfigContents);

    if (webAddress) {
        app.doShellScript("open " + webAddress);
    }
}

function extractWebAddress(text) {
    var lines = text.split("\n");
    var originUrl = "";
    var inOriginSection = false;

    for (var i = 0; i < lines.length; i++) {
        var line = lines[i].trim();

        if (line === '[remote "origin"]') {
            inOriginSection = true;
        } else if (line.startsWith("[")) {
            inOriginSection = false;
        } else if (inOriginSection && line.startsWith("url =")) {
            originUrl = line.substring(6); // Remove 'url = ' from the start of the line
        }
    }

    if (originUrl.startsWith("git@github.com:")) {
        // Convert SSH URL to HTTPS URL
        originUrl =
            "https://github.com/" +
            originUrl.substring(15).replace(/\.git$/, "");
    }

    return originUrl;
}
