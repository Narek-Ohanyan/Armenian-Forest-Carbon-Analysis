**Project Title:** *Automated Assessment of Carbon Sequestration in Armenian Forest Stands: A Macro-Based ImageJ Analysis of Publicly Available Satellite Data.*  
**Author:** Narek Ohanyan

## **1\. Abstract**

Armenia's mountainous forests are vital carbon sinks, yet they face increasing pressure from regional warming and moisture stress. This project proposes a non-invasive, automated workflow using **ImageJ/Fiji** to quantify **Leaf Area Index (LAI)** and biomass from publicly available **Sentinel-2 multispectral imagery.** By focusing on two distinct ecological zones, the humid northern forests of Dilijan and the drought-vulnerable southern stands of Syunik, the study demonstrates how open-source digital tools can replace expensive fieldwork. The outcome is a validated ImageJ Macro that automates the conversion of spectral data into CO2 sequestration estimates, supporting Armenia’s national climate adaptation goals.

## **2\. Objectives**

* **Automation:** Develop an ImageJ Macro to batch-process multispectral satellite images.  
* **Quantification:** Calculate the **Normalized Difference Vegetation Index (NDVI)** as a proxy for canopy health.  
* **Carbon Modeling:** Estimate Above-Ground Biomass (AGB) and CO2 equivalents (CO2e) for Armenian broadleaf species (*Fagus orientalis* and *Quercus macranthera*).  
* **Comparative Analysis:** Evaluate the carbon-density variance between northern and southern Armenian forest clusters.

## **3\. Methodology**

### **3.1 Data Acquisition**

Publicly available 10-meter resolution imagery will be sourced from the **European Space Agency (ESA) Sentinel-2** mission via the **Sentinel-Hub EO Browser**.

* **Target Bands:** Band 4 (Red, 655 nm) and Band 8 (Near-Infrared, 842 nm).  
* **Criteria:** Less than 5% cloud cover, captured during the peak growing season (June–August).

### **3.2 ImageJ Macro Development**

To ensure reproducibility and efficiency, the methodology utilizes a custom `.ijm` script. The macro automates the mathematical transformation of raw pixel values into environmental indicators.

**Macro Logic & Pseudocode:**

1. **Batch Import:** User selects a directory containing Red and NIR band pairs.  
2. **32-bit Conversion:** Convert images to 32-bit to allow for decimal results in division.  
3. **NDVI Calculation:**

NDVI \=(Band 8 \- Band 4)(Band 8 \+ Band 4\)

4. **Thresholding:** Apply a lower-bound threshold (\>0.2) to filter out non-vegetated surfaces (soil/rocks).  
5. **Calibration:** Apply a scaling factor to convert Mean NDVI to LAI.  
6. **Results Export:** Append the Mean LAI, Area Fraction, and estimated Carbon value to a summary CSV.

### **3.3 Carbon Conversion Framework**

The conversion follows a three-step mathematical bridge:

1. **LAI to AGB:** Based on Armenian forest studies, we apply the relation AGB \= LAI, where  is a species-specific constant (e.g., 45 t/ha for mature Beech).  
2. **Biomass to Carbon:** Carbon  AGB  0.5 (Carbon constitutes roughly half of dry biomass).  
3. **Carbon to CO2:** CO2 sequestered \= Carbon  3.67 (the ratio of the molecular weight of CO2 to Carbon).  
   

## **4\. Spatiotemporal Analysis: Modeling the Seasonal Carbon Cycle**

### **4.1 Comparative Temporal Framework**

To quantify the "Carbon Breath" of Armenian forests, the methodology will analyze imagery across four distinct phenological stages:

1. **Peak Sequestration (June–August):** Maximum LAI and CO2 absorption.  
2. **Senescence (October–November):** Transition period for deciduous species (*Fagus* and *Quercus*).  
3. **Dormancy (January–February):** Baseline carbon storage with minimal active sequestration.  
4. **Rebirth (April–May):** Early leaf-out and rapid increase in photosynthetic activity.

### **4.2 Methodology for Seasonal Flux**

* **Image Differencing:** Using ImageJ’s Process \> Image Calculator (Subtract), the dormant winter NDVI map will be subtracted from the peak summer NDVI map. This identifies the **"Net Annual Productivity"** of the forest stand.  
* **Visualizing Phenology:** The **"Montage"** function in ImageJ (Image \> Stacks \> Make Montage) will be used to create a side-by-side visual timeline of a single forest plot (e.g., Dilijan) across the four seasons, providing a clear narrative of seasonal climate resilience.

### **4.3 Climate Resilience Indicators**

By comparing the seasonal flux of the **Tavush** region (North) against the **Syunik** region (South), this project will identify which forests are "waking up" earlier or "shutting down" faster due to rising temperatures.

* **Early Leaf-out:** A marker of warming springs.  
* **Early Senescence:** Often a marker of drought stress in southern Armenia, where trees drop leaves early to conserve water.

## **5\. Expected Outcomes & Impact**

* **Digital Map:** A visual "Heat Map" of carbon density across the Armenian highlands.  
* **Policy Support:** Data-driven insights that can be used to argue for the protection of specific "High Carbon Value" areas in Syunik.  
* **Scalability:** This workflow can be applied to any region in the Caucasus using only an internet connection and the developed ImageJ toolset.

