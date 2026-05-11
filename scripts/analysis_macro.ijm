// ImageJ.JS Macro: Automated Processing with Manual Capture Pause
// Get list of all open IJ-Ready files
ids = getList("image.titles");

for (i = 0; i < ids.length; i++) {
    selectWindow(ids[i]);
    title = getTitle();
    
    // STEP 1: Calibrate and Measure
    // We measure the raw 8-bit Mean before applying any visual filters
    run("Set Measurements...", "area mean area_fraction display redirect=None decimal=3");
    run("Measure");
    
    // STEP 2: Create the Heatmap (Visual Output 1)
    run("Fire");
    run("Calibration Bar...", "location=[Upper Right] fill=White label=Black number=5 decimal=2");
    
    // PAUSE for you to Save
    waitForUser("HEATMAP GENERATED for " + title + ".\n\n1. Right-click the image.\n2. Select 'Save Image As'.\n3. Click OK here to continue to the Mask.");

    // STEP 3: Create the Forest Mask (Visual Output 2)
    // Using 153 as the 8-bit equivalent of 0.2 NDVI
    setThreshold(153, 255);
    run("Convert to Mask");
    
    // PAUSE for you to Save
    waitForUser("FOREST MASK GENERATED for " + title + ".\n\n1. Right-click the image.\n2. Select 'Save Image As'.\n3. Click OK here to process the next season.");
}

print("All seasons processed. Check the Results table for Mean values.");
