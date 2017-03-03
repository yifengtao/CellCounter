// Turn raw images into 8-bit gray images.

for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		open("G:\\LMCB\\LMCBraw\\20170302_T"+t+"_10X_C"+c+"_DA.tif");
		run("8-bit");
		saveAs("Tiff", "G:\\LMCB\\LMCB8bit\\20170302_T"+t+"_10X_C"+c+"_DA.tif");
		run("Close");
	}
}
for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		open("G:\\LMCB\\LMCBraw\\20170302_T"+t+"_10X_C"+c+"_RF.tif");
		run("8-bit");
		saveAs("Tiff", "G:\\LMCB\\LMCB8bit\\20170302_T"+t+"_10X_C"+c+"_RF.tif");
		run("Close");
	}
}

// Turn 8-bit gray images into binary images.
//TODO: threshold for binarize the iamge.
thredDAPI = 35
thredGRF = 16

for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		open("G:\\LMCB\\LMCB8bit\\20170302_T"+t+"_10X_C"+c+"_DA.tif");
		setAutoThreshold("Default");
		setThreshold(thredDAPI, 255);
		setOption("BlackBackground", false);
		run("Convert to Mask");
		saveAs("Tiff", "G:\\LMCB\\LMCBbinary\\20170302_T"+t+"_10X_C"+c+"_DA.tif");
		run("Close");
	}
}

for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		open("G:\\LMCB\\LMCB8bit\\20170302_T"+t+"_10X_C"+c+"_RF.tif");
		setAutoThreshold("Default");
		setThreshold(thredGRF, 255);
		setOption("BlackBackground", false);
		run("Convert to Mask");
		saveAs("Tiff", "G:\\LMCB\\LMCBbinary\\20170302_T"+t+"_10X_C"+c+"_RF.tif");
		run("Close");
	}
}


// Count cells and save results to summary file.

for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		open("G:\\LMCB\\LMCBbinary\\20170302_T"+t+"_10X_C"+c+"_DA.tif");
		//TODO: You may want to adjust the size here.
		run("Analyze Particles...", "size=50-1000 show=[Bare Outlines] clear include summarize");
		saveAs("Tiff", "G:\\LMCB\\LMCBoutline\\20170302_T"+t+"_10X_C"+c+"_DA.tif");
		run("Close");
		//run("Close");
	}
}
for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		open("G:\\LMCB\\LMCBbinary\\20170302_T"+t+"_10X_C"+c+"_RF.tif");
		//TODO: You may want to adjust the size here.
		run("Analyze Particles...", "size=50-1000 show=[Bare Outlines] clear include summarize");
		saveAs("Tiff", "G:\\LMCB\\LMCBoutline\\20170302_T"+t+"_10X_C"+c+"_RF.tif");
		run("Close");
		//run("Close");
	}
}

selectWindow("Summary"); 
run("Text...", "save=G:\\LMCB\\record\\20170302_Summary.xls");
run("Close");

for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		run("Close");
	}
}
for (t=0; t<=0; t++) {
	for (c=1; c<=1; c++) {
		run("Close");
	}
}
