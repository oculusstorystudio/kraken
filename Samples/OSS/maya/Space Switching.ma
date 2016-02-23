//Maya ASCII 2016 scene
//Name: Space Switching.ma
//Last modified: Sat, Feb 20, 2016 07:57:34 PM
//Codeset: 1252
requires maya "2016";
requires -nodeType "decomposeMatrix" "matrixNodes" "1.0";
requires -nodeType "ilrOptionsNode" -nodeType "ilrUIOptionsNode" -nodeType "ilrBakeLayerManager"
		 -nodeType "ilrBakeLayer" "Turtle" "2016.0.0";
requires "stereoCamera" "10.0";
requires -nodeType "canvasNode" -dataType "FabricSpliceMayaData" "FabricMaya" "2.0.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2016";
fileInfo "version" "2016";
fileInfo "cutIdentifier" "201508242200-969261";
fileInfo "osv" "Microsoft Windows 7 Enterprise Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
createNode transform -s -n "persp";
	rename -uid "14BB4320-4BCA-ED6E-49D5-96A4F85BEA1F";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 85.494819177937813 37.134861109691336 14.278750930597418 ;
	setAttr ".r" -type "double3" -14.7383527294198 -284.20000000004421 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "2D1C738C-43E1-E035-DDC0-07ACA991E593";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 91.610500480702825;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.91873364214773989 5.5375904722209652 -1.3498701890771467 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "9DBBDA6A-4F14-FF44-9C19-FA93785F5FB4";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "0EBE6F08-4080-C04B-5FE1-5CB8F29D420D";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "5287E9C2-456B-7EF0-9415-D38358634E2A";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "1B01405E-480A-180E-67C5-C9BFCAEA5E75";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "D5E27BA5-40ED-B661-A17F-B3A1E6B226C3";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 9.5012615678473242 -3.0290436995356909 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "9E6C4A2B-4E80-F9AC-4F09-DA95568744F6";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 26.200859232881232;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "body";
	rename -uid "8F7C9531-4AF8-A679-B55C-73B20632705D";
	setAttr ".t" -type "double3" 2.9877730387333798 -3.6029456524660688 -10.256638410273663 ;
	setAttr ".r" -type "double3" -259.90701215708202 -18.424893296907161 167.99422924405647 ;
	setAttr ".s" -type "double3" 3.4757678277260435 3.4757678277260435 3.4757678277260435 ;
createNode mesh -n "bodyShape" -p "body";
	rename -uid "B6B756FB-4823-DE81-C3A6-23AADC2A6B9D";
	setAttr -k off ".v";
	setAttr -s 8 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "chest";
	rename -uid "E09B752B-4BE7-4CE7-482E-F495FDB607CA";
	setAttr ".t" -type "double3" -3.0054240894707647 7.9974955475410958 10.094636953063411 ;
	setAttr ".r" -type "double3" 58.927324363020126 18.174895714257048 359.03529220945785 ;
	setAttr ".s" -type "double3" 0.3564035435003241 0.3564035435003241 0.3564035435003241 ;
createNode mesh -n "chestShape" -p "chest";
	rename -uid "577AF22F-4F74-5E94-2D7C-DA9502E5121A";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[2:3]" "f[5]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[0]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 1 "f[1]";
	setAttr ".iog[0].og[3].gcl" -type "componentList" 1 "f[4]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "head";
	rename -uid "734CACB5-4FC4-C2FC-2ED0-C792EDF57D3E";
	setAttr ".t" -type "double3" -9.3302307611606263 25.214096900538021 1.1568384903362703 ;
	setAttr ".r" -type "double3" -48.568242227425067 -72.590338251330238 79.850011222030844 ;
	setAttr ".s" -type "double3" 1.3379838827417641 1.3379838827417641 1.3379838827417641 ;
createNode mesh -n "headShape" -p "head";
	rename -uid "DC3AA8A1-4602-3C3C-BD89-AD9767B3F00B";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[2:3]" "f[5]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[0]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 1 "f[1]";
	setAttr ".iog[0].og[3].gcl" -type "componentList" 1 "f[4]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "locator1";
	rename -uid "42332D52-4C93-0A9B-0743-EDA7008F483F";
	setAttr ".t" -type "double3" 0.035289476350802929 3.0198066269804258e-014 -0.014401368538500492 ;
	setAttr ".s" -type "double3" 3.3766107407870014 3.3766107407870014 3.3766107407870014 ;
createNode locator -n "locatorShape1" -p "locator1";
	rename -uid "38B88832-4D34-55A6-5451-30B689FF41A0";
	setAttr -k off ".v";
createNode transform -n "REF";
	rename -uid "707657EF-465A-968B-02F0-02AE8C3F561B";
	setAttr ".t" -type "double3" 2.9177082004563539 17.073797147803468 -12.929036966220549 ;
	setAttr ".r" -type "double3" -81.835030199612575 -27.230864937012775 -58.977570304315137 ;
	setAttr ".s" -type "double3" 2.7469330514101125 2.7469330514101125 2.7469330514101125 ;
createNode mesh -n "REFShape" -p "REF";
	rename -uid "78DE5E1F-4502-7365-73FB-728F0590EC41";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[2:3]" "f[5]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[0]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 1 "f[1]";
	setAttr ".iog[0].og[3].gcl" -type "componentList" 1 "f[4]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "group1";
	rename -uid "C05743E8-4E95-B7BC-33F4-ABA635A75573";
createNode transform -n "target" -p "group1";
	rename -uid "9FE242A8-4B3C-35E6-0D0F-5880F0397BFD";
	addAttr -ci true -sn "w0" -ln "w0" -dv 1 -min 0 -max 1 -at "double";
	addAttr -ci true -sn "w1" -ln "w1" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "w2" -ln "w2" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "w3" -ln "w3" -min 0 -max 1 -at "double";
	addAttr -ci true -sn "w4" -ln "w4" -min 0 -max 1 -at "double";
	setAttr -k on ".w0";
	setAttr -k on ".w1" 1;
	setAttr -k on ".w2";
	setAttr -k on ".w3";
	setAttr -k on ".w4";
createNode mesh -n "targetShape" -p "target";
	rename -uid "1CB86AEE-4C56-3F0E-A247-569B91921324";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 2 "f[2:3]" "f[5]";
	setAttr ".iog[0].og[1].gcl" -type "componentList" 1 "f[0]";
	setAttr ".iog[0].og[2].gcl" -type "componentList" 1 "f[1]";
	setAttr ".iog[0].og[3].gcl" -type "componentList" 1 "f[4]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere1";
	rename -uid "3094FD8D-42CC-BC66-2412-30BC52CD5A4E";
	addAttr -ci true -sn "weight0" -ln "weight0" -at "double";
	addAttr -ci true -sn "weight1" -ln "weight1" -at "double";
	addAttr -ci true -sn "weight2" -ln "weight2" -at "double";
	addAttr -ci true -sn "weight3" -ln "weight3" -at "double";
	setAttr ".t" -type "double3" 7.0008157799291899 3.6662527254380564 -1.891125143229921 ;
	setAttr -k on ".weight0";
	setAttr -k on ".weight1";
	setAttr -k on ".weight2";
	setAttr -k on ".weight3";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "D8EF47F2-4FED-E906-5913-5C9811C534EE";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "AC092CF2-4255-65EF-10EC-1495BF13194E";
createNode displayLayer -n "defaultLayer";
	rename -uid "6F55FF07-4839-D06C-E1A3-EABC05AFE1BD";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "482A94D9-405C-419A-363E-FDB941A21B45";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "A9C402ED-4F7A-6132-10AF-689587FDA0D1";
	setAttr ".g" yes;
createNode ilrOptionsNode -s -n "TurtleRenderOptions";
	rename -uid "45AA9BBC-4294-EBF2-45BD-2FAAFD1D8A97";
lockNode -l 1 ;
createNode ilrUIOptionsNode -s -n "TurtleUIOptions";
	rename -uid "7714083C-44CA-BD70-7044-4A87E514CC06";
lockNode -l 1 ;
createNode ilrBakeLayerManager -s -n "TurtleBakeLayerManager";
	rename -uid "6DB9A555-4804-B342-DA4E-F88099E621DC";
lockNode -l 1 ;
createNode ilrBakeLayer -s -n "TurtleDefaultBakeLayer";
	rename -uid "6BE7A39B-4B77-D455-22E3-5088846BAC5E";
lockNode -l 1 ;
createNode polyCube -n "polyCube1";
	rename -uid "BAA64143-48A1-609D-FDEB-D79E2B893F2D";
	setAttr ".cuv" 4;
createNode lambert -n "lambert2";
	rename -uid "FA35000B-4838-D37B-7CDD-07BF5F3B6665";
	setAttr ".c" -type "float3" 1 0 0 ;
createNode shadingEngine -n "lambert2SG";
	rename -uid "411C82C4-4AF6-2C9C-4995-36986BF0B3AD";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 5 ".gn";
createNode materialInfo -n "materialInfo1";
	rename -uid "88F70C86-47B9-B188-55C8-5CAAC57A063F";
createNode lambert -n "lambert3";
	rename -uid "B3D82BCD-4AF1-5588-3260-EDAC3E97708D";
	setAttr ".c" -type "float3" 0 1 0 ;
createNode shadingEngine -n "lambert3SG";
	rename -uid "F4B95F79-4FDD-1B09-663D-86BFC84A886C";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 5 ".gn";
createNode materialInfo -n "materialInfo2";
	rename -uid "6A611C00-4488-3897-01A0-ECBB7BD424DA";
createNode groupId -n "groupId1";
	rename -uid "56609DA9-4F32-91D7-B001-53B4688D8F0F";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	rename -uid "FFADE4B8-416F-A21F-800C-F893117C8587";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 2 "f[2:3]" "f[5]";
	setAttr ".irc" -type "componentList" 2 "f[0:1]" "f[4]";
createNode groupId -n "groupId2";
	rename -uid "3BD591E7-468D-99EF-B594-5993F1AE62DE";
	setAttr ".ihi" 0;
createNode groupId -n "groupId3";
	rename -uid "38EA9E90-4B5E-0333-7E35-EBAAC47E0322";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	rename -uid "46324332-42C5-75C2-032B-2BAAD0498049";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0]";
createNode groupId -n "groupId4";
	rename -uid "D5576ECB-4D0D-F1FF-7CFC-F69411160BC7";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	rename -uid "64376E45-4BCB-4211-F4CD-1B96D5F6F96F";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[1]";
createNode lambert -n "lambert4";
	rename -uid "67C22596-42F1-5FAF-6B53-5F93C3412D33";
	setAttr ".c" -type "float3" 0 1 1 ;
createNode shadingEngine -n "lambert4SG";
	rename -uid "E7348602-4AEF-10C9-E07E-4EB7D8EC4EEA";
	setAttr ".ihi" 0;
	setAttr -s 5 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 5 ".gn";
createNode materialInfo -n "materialInfo3";
	rename -uid "B4099C2D-48CB-A65C-24EE-239301232DE6";
createNode groupId -n "groupId5";
	rename -uid "781D6A6F-4C2D-9DFF-E5A1-BB998504B53C";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts4";
	rename -uid "46C3A260-40C5-E3F2-A7FC-F2A9E8DF0968";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[4]";
createNode nodeGraphEditorInfo -n "hyperShadePrimaryNodeEditorSavedTabsInfo";
	rename -uid "0349175F-4227-105D-98EA-59B05B17398E";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -485.71426641373489 -171.42856461661233 ;
	setAttr ".tgi[0].vh" -type "double2" 464.28569583665836 177.38094533246689 ;
	setAttr -s 6 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" 1.4285714626312256;
	setAttr ".tgi[0].ni[0].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[0].nvs" 1923;
	setAttr ".tgi[0].ni[1].x" 262.85714721679687;
	setAttr ".tgi[0].ni[1].y" -70;
	setAttr ".tgi[0].ni[1].nvs" 1923;
	setAttr ".tgi[0].ni[2].x" 1.4285714626312256;
	setAttr ".tgi[0].ni[2].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[2].nvs" 1923;
	setAttr ".tgi[0].ni[3].x" 262.85714721679687;
	setAttr ".tgi[0].ni[3].y" -70;
	setAttr ".tgi[0].ni[3].nvs" 1923;
	setAttr ".tgi[0].ni[4].x" 1.4285714626312256;
	setAttr ".tgi[0].ni[4].y" -1.4285714626312256;
	setAttr ".tgi[0].ni[4].nvs" 1923;
	setAttr ".tgi[0].ni[5].x" 262.85714721679687;
	setAttr ".tgi[0].ni[5].y" -70;
	setAttr ".tgi[0].ni[5].nvs" 1923;
createNode groupId -n "groupId6";
	rename -uid "85EB46E9-4294-0CF9-1079-F1919D8F4540";
	setAttr ".ihi" 0;
createNode groupId -n "groupId7";
	rename -uid "E98EB478-446A-CE3B-9FAC-C2A677F30882";
	setAttr ".ihi" 0;
createNode groupId -n "groupId8";
	rename -uid "D3893902-4959-B815-582C-42891BA0137D";
	setAttr ".ihi" 0;
createNode groupId -n "groupId9";
	rename -uid "4BE52F62-47DD-8056-D9BB-2499C86F402A";
	setAttr ".ihi" 0;
createNode groupId -n "groupId10";
	rename -uid "7C8640FD-4A9A-6A1B-AF35-1E91CAD75D40";
	setAttr ".ihi" 0;
createNode groupId -n "groupId11";
	rename -uid "E8376FCD-41B7-E979-FFFE-BBBE14FC5F11";
	setAttr ".ihi" 0;
createNode groupId -n "groupId12";
	rename -uid "EE4C3D22-4504-3875-B429-F1A71A02FA4D";
	setAttr ".ihi" 0;
createNode groupId -n "groupId13";
	rename -uid "066568AA-4C69-D286-EFC0-5FA7D13E83E3";
	setAttr ".ihi" 0;
createNode groupId -n "groupId14";
	rename -uid "693263AA-4A21-6192-1117-299C71772451";
	setAttr ".ihi" 0;
createNode groupId -n "groupId15";
	rename -uid "70A99642-4F96-55C9-51EF-BBBE53EF0F8B";
	setAttr ".ihi" 0;
createNode groupId -n "groupId16";
	rename -uid "7945EB86-4B0F-6BA5-DE51-C48150F5B2A8";
	setAttr ".ihi" 0;
createNode groupId -n "groupId17";
	rename -uid "E6F8F6F3-4DA7-F4E9-FC2E-DF9BFD83D685";
	setAttr ".ihi" 0;
createNode groupId -n "groupId18";
	rename -uid "4247EDC1-4231-0BBD-DE49-DBB7A5130EC9";
	setAttr ".ihi" 0;
createNode groupId -n "groupId19";
	rename -uid "DE9A24DA-4716-2533-9C50-7DA0C31DD27C";
	setAttr ".ihi" 0;
createNode groupId -n "groupId20";
	rename -uid "EFBF1DDF-461B-6ED3-F513-B0875F259E5C";
	setAttr ".ihi" 0;
createNode canvasNode -n "canvasNode1";
	rename -uid "2A9C45E0-48D3-B21B-9275-AD8CC61CE163";
	addAttr -r false -ci true -k true -m -sn "spaces" -ln "spaces" -at "matrix";
	addAttr -w false -s false -ci true -sn "result" -ln "result" -at "matrix";
	addAttr -r false -ci true -k true -sn "rotationAmt" -ln "rotationAmt" -min 0 -max 
		1 -at "double";
	addAttr -r false -ci true -k true -sn "scaleAmt" -ln "scaleAmt" -min 0 -max 1 -at "double";
	addAttr -r false -ci true -k true -sn "translationAmt" -ln "translationAmt" -min 
		0 -max 1 -at "double";
	addAttr -r false -ci true -k true -sn "mat44Rest" -ln "mat44Rest" -at "matrix";
	addAttr -r false -ci true -k true -sn "atAxis" -ln "atAxis" -at "long";
	addAttr -r false -ci true -k true -sn "upAxis" -ln "upAxis" -at "long";
	addAttr -r false -ci true -k true -m -sn "spaceWeights" -ln "spaceWeights" -min 
		0 -max 1 -at "double";
	setAttr ".cch" no;
	setAttr ".ihi" 2;
	setAttr ".nds" 0;
	setAttr ".fzn" no;
	setAttr ".svd" -type "string" (
		"{\n  \"objectType\" : \"Graph\",\n  \"metadata\" : {\n    \"maya_id\" : \"2\",\n    \"uiGraphZoom\" : \"{\\n  \\\"value\\\" : 1.606870532035828\\n  }\",\n    \"uiGraphPan\" : \"{\\n  \\\"x\\\" : -503.6622619628906,\\n  \\\"y\\\" : -1390.747314453125\\n  }\"\n    },\n  \"title\" : \"\",\n  \"ports\" : [\n    {\n      \"objectType\" : \"Port\",\n      \"nodePortType\" : \"In\",\n      \"name\" : \"result\",\n      \"execPortType\" : \"Out\",\n      \"typeSpec\" : \"Mat44\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"metadata\" : {\n        \"uiPersistValue\" : \"true\"\n        },\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"spaceWeights\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"Scalar[]\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"spaces\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"Mat44[]\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"metadata\" : {\n        \"uiPersistValue\" : \"true\",\n        \"uiRange\" : \"(0, 1)\"\n        },\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"rotationAmt\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"Scalar\"\n"
		+ "      },\n    {\n      \"objectType\" : \"Port\",\n      \"metadata\" : {\n        \"uiRange\" : \"(0, 1)\"\n        },\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"scaleAmt\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"Scalar\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"metadata\" : {\n        \"uiRange\" : \"(0, 1)\"\n        },\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"translationAmt\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"Scalar\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"mat44Rest\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"Mat44\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"atAxis\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"UInt32\"\n      },\n    {\n      \"objectType\" : \"Port\",\n      \"nodePortType\" : \"Out\",\n      \"name\" : \"upAxis\",\n      \"execPortType\" : \"In\",\n      \"typeSpec\" : \"UInt32\"\n      }\n    ],\n  \"extDeps\" : {},\n  \"nodes\" : [\n    {\n      \"objectType\" : \"Inst\",\n      \"metadata\" : {\n        \"uiGraphPos\" : \"{\\\"x\\\":504.627,\\\"y\\\":1001.88}\"\n"
		+ "        },\n      \"name\" : \"graph\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"result\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"xfoRest\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"xfos\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"xfoWeights\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"translationAmt\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"rotationAmt\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"scaleAmt\"\n          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"atAxis\"\n"
		+ "          },\n        {\n          \"objectType\" : \"InstPort\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"upAxis\"\n          }\n        ],\n      \"executable\" : \"OSS.WeightedMat44BlendSolver\",\n      \"presetGUID\" : \"34915B39E8F2472BAC523F94D60E7CB3\"\n      }\n    ],\n  \"connections\" : {\n    \"spaceWeights\" : [\n      \"graph.xfoWeights\"\n      ],\n    \"spaces\" : [\n      \"graph.xfos\"\n      ],\n    \"rotationAmt\" : [\n      \"graph.rotationAmt\"\n      ],\n    \"scaleAmt\" : [\n      \"graph.scaleAmt\"\n      ],\n    \"translationAmt\" : [\n      \"graph.translationAmt\"\n      ],\n    \"mat44Rest\" : [\n      \"graph.xfoRest\"\n      ],\n    \"atAxis\" : [\n      \"graph.atAxis\"\n      ],\n    \"upAxis\" : [\n      \"graph.upAxis\"\n      ],\n    \"graph.result\" : [\n      \"result\"\n      ]\n    },\n  \"metadata\" : {\n    \"maya_id\" : \"2\"\n    },\n  \"requiredPresets\" : {\n    \"OSS.WeightedMat44BlendSolver\" : {\n      \"objectType\" : \"Graph\",\n      \"metadata\" : {\n        \"uiGraphZoom\" : \"{\\n  \\\"value\\\" : 0.4446912407875061\\n  }\",\n        \"uiGraphPan\" : \"{\\n  \\\"x\\\" : 164.5220325883051,\\n  \\\"y\\\" : -63.83108724705744\\n  }\"\n"
		+ "        },\n      \"title\" : \"WeightedMat44BlendSolver\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"result\",\n          \"execPortType\" : \"Out\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"xfoRest\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"xfos\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"xfoWeights\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"translationAmt\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"rotationAmt\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n"
		+ "          \"nodePortType\" : \"Out\",\n          \"name\" : \"scaleAmt\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"atAxis\",\n          \"execPortType\" : \"In\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"upAxis\",\n          \"execPortType\" : \"In\"\n          }\n        ],\n      \"extDeps\" : {},\n      \"presetGUID\" : \"34915B39E8F2472BAC523F94D60E7CB3\",\n      \"nodes\" : [\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":1423.57,\\\"y\\\":986.0650000000001}\"\n            },\n          \"name\" : \"ToMat44_1\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"this\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Xfo.ToMat44\",\n"
		+ "          \"presetGUID\" : \"3EB232DB6FF4BEE162E1D62ABFBE8C3A\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":84.7903,\\\"y\\\":677.234}\"\n            },\n          \"name\" : \"DecomposeXfo_1\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"value\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"ori\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"tr\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"sc\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Xfo.DecomposeXfo\",\n          \"presetGUID\" : \"F1CE36998E153872EE926747BEB0E7A6\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n"
		+ "            \"uiGraphPos\" : \"{\\\"x\\\":729.404,\\\"y\\\":1218.03}\"\n            },\n          \"name\" : \"LinearInterpolate_Translation\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"this\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"other\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"t\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Func.LinearInterpolate\",\n          \"presetGUID\" : \"12CF7203114B81451A5EEC920610EDA9\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":721.883,\\\"y\\\":1059.43}\"\n            },\n          \"name\" : \"LinearInterpolate_2\",\n"
		+ "          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"this\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"other\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"t\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Func.LinearInterpolate\",\n          \"presetGUID\" : \"12CF7203114B81451A5EEC920610EDA9\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":1061.46,\\\"y\\\":885.646}\"\n            },\n          \"name\" : \"ComposeXfo_1\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n"
		+ "              \"name\" : \"ori\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"tr\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"sc\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Xfo.ComposeXfo\",\n          \"presetGUID\" : \"C61287D19D84D9733903DDC14FABD4AF\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":-155.495,\\\"y\\\":713.287}\"\n            },\n          \"name\" : \"SetFromMat44_2\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"IO\",\n              \"name\" : \"this\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n"
		+ "              \"name\" : \"m\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Xfo.SetFromMat44\",\n          \"presetGUID\" : \"59B1B738E9402F3006B2516B14A43848\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":1326.49,\\\"y\\\":1181.21}\"\n            },\n          \"name\" : \"orientXfo_2\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"atAxis\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"upAxis\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"IO\",\n              \"name\" : \"this\"\n              }\n            ],\n          \"definition\" : {\n            \"objectType\" : \"Func\",\n            \"title\" : \"orientXfo\",\n            \"ports\" : [\n              {\n                \"objectType\" : \"Port\",\n                \"nodePortType\" : \"Out\",\n"
		+ "                \"defaultValues\" : {\n                  \"UInt32\" : 1\n                  },\n                \"name\" : \"atAxis\",\n                \"execPortType\" : \"In\",\n                \"typeSpec\" : \"UInt32\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"nodePortType\" : \"Out\",\n                \"defaultValues\" : {\n                  \"UInt32\" : 2\n                  },\n                \"name\" : \"upAxis\",\n                \"execPortType\" : \"In\",\n                \"typeSpec\" : \"UInt32\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"nodePortType\" : \"IO\",\n                \"name\" : \"this\",\n                \"execPortType\" : \"IO\",\n                \"typeSpec\" : \"Xfo\"\n                }\n              ],\n            \"extDeps\" : {},\n            \"code\" : \"// Gotta be a better way\nfunction Vec3 getAxisAsVector(in UInt32 axisIndex)\n{\n  Vec3 vec;\n  switch (axisIndex)\n  {\n    case 0:\n      return Vec3(1.0, 0.0, 0.0);\n    case 1:\n      return Vec3(0.0, 1.0, 0.0);\n"
		+ "    case 2:\n      return Vec3(0.0, 0.0, 1.0);\n    case 3:\n      return Vec3(-1.0, 0.0, 0.0);\n    case 4:\n      return Vec3(0.0, -1.0, 0.0);\n    case 5:\n      return Vec3(0.0, 0.0, -1.0);\n  }\n  report(\\\"OSS_TwoBoneIKSolver:getAxisAsVector() invalid axisIndex\\\");\n  return Vec3(1.0, 0.0, 0.0);\n}\n\nfunction Vec3 getAxis(in Quat ori, in UInt32 axisIndex)\n{\n  switch (axisIndex)\n  {\n    case 0:\n      return ori.getXaxis();\n    case 1:\n      return ori.getYaxis();\n    case 2:\n      return ori.getZaxis();\n    case 3:\n      return ori.getXaxis().negate();\n    case 4:\n      return ori.getYaxis().negate();\n    case 5:\n      return ori.getZaxis().negate();\n  }\n  report(\\\"OSS_TwoBoneIKSolver:getAxis() invalid axisIndex\\\");\n  return ori.getXaxis();\n}\n\n\n// Make this take in a specific aim and upvector later\n// Hard-coded to aim pos +X and use +Z as normal\ndfgEntry {\n  Vec3 atAxisVec = getAxis(this.ori, atAxis).unit();\n  Vec3 upAxisVec = getAxis(this.ori, upAxis).unit();\n  Vec3 normalAxisVec = upAxisVec.cross(atAxisVec).unit();\n"
		+ "  Mat33 mat(atAxisVec, normalAxisVec, upAxisVec);\n  this.ori.setFromMat33(mat.transpose());\n}\n\"\n            }\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":319.845,\\\"y\\\":963.12}\"\n            },\n          \"name\" : \"test\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"IO\",\n              \"name\" : \"quats\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"weights\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"definition\" : {\n            \"objectType\" : \"Func\",\n            \"title\" : \"weightedAverageQuaterions\",\n            \"ports\" : [\n              {\n                \"objectType\" : \"Port\",\n                \"nodePortType\" : \"IO\",\n                \"name\" : \"quats\",\n                \"execPortType\" : \"IO\",\n"
		+ "                \"typeSpec\" : \"Quat[]\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"nodePortType\" : \"Out\",\n                \"name\" : \"weights\",\n                \"execPortType\" : \"In\",\n                \"typeSpec\" : \"Scalar[]\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"nodePortType\" : \"In\",\n                \"name\" : \"result\",\n                \"execPortType\" : \"Out\",\n                \"typeSpec\" : \"Quat\"\n                }\n              ],\n            \"extDeps\" : {},\n            \"code\" : \"//NOTE: weights need to be normalized\n\n \ndfgEntry {\n\n  UInt32 numQuats = weights.size();\n  Quat cumQuat = Quat()*0;\n  quats.resize(numQuats);\n \n  for (UInt32 i=0; i<numQuats; i++)\n  { \n    Quat wQuat = quats[i]*weights[i];\n    \n    //Before we add the new rotation to the average (mean), we have to check whether the quaternion has to be inverted. Because\n    //q and -q are the same rotation, but cannot be averaged, we have to make sure they are all the same.\n"
		+ "    if (wQuat.almostEqual(cumQuat)){\n        wQuat *= -1;  \n    }\n    \n    cumQuat += wQuat;\n  }\n  result = cumQuat.unit_safe();\n}\"\n            }\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":-157.687,\\\"y\\\":1398.09}\"\n            },\n          \"name\" : \"SetFromMat44_3\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"m\"\n              }\n            ],\n          \"definition\" : {\n            \"objectType\" : \"Func\",\n            \"metadata\" : {\n              \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n              \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Xfo.html\",\n              \"uiTooltip\" : \"Sets this transform from a given Mat44\\n\\n Supported by Xfo\"\n"
		+ "              },\n            \"title\" : \"SetFromMat44\",\n            \"ports\" : [\n              {\n                \"objectType\" : \"Port\",\n                \"metadata\" : {\n                  \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n                  },\n                \"nodePortType\" : \"In\",\n                \"name\" : \"result\",\n                \"execPortType\" : \"Out\",\n                \"typeSpec\" : \"Xfo[]\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"metadata\" : {\n                  \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n                  },\n                \"nodePortType\" : \"Out\",\n                \"name\" : \"m\",\n                \"execPortType\" : \"In\",\n                \"typeSpec\" : \"Mat44[]\"\n                }\n              ],\n            \"extDeps\" : {\n              \"Math\" : \"*\"\n              },\n            \"code\" : \"require Math;\n\ndfgEntry {\n  result.resize(m.size());\n  for (UInt32 i = 0; i<result.size(); i++){\n    result[i].setFromMat44(m[i]);\n"
		+ "  }\n}\n\"\n            }\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":52.5559,\\\"y\\\":1372.3}\"\n            },\n          \"name\" : \"DecomposeXfo_3\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"values\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"ori\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"tr\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"sc\"\n              }\n            ],\n          \"definition\" : {\n            \"objectType\" : \"Func\",\n            \"metadata\" : {\n              \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n              \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Xfo.html\"\n"
		+ "              },\n            \"title\" : \"Xfo ->\",\n            \"ports\" : [\n              {\n                \"objectType\" : \"Port\",\n                \"metadata\" : {\n                  \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n                  },\n                \"nodePortType\" : \"Out\",\n                \"defaultValues\" : {\n                  \"Xfo\" : {\n                    \"ori\" : {\n                      \"v\" : {\n                        \"x\" : 0,\n                        \"y\" : 0,\n                        \"z\" : 0\n                        },\n                      \"w\" : 1\n                      },\n                    \"tr\" : {\n                      \"x\" : 0,\n                      \"y\" : 0,\n                      \"z\" : 0\n                      },\n                    \"sc\" : {\n                      \"x\" : 1,\n                      \"y\" : 1,\n                      \"z\" : 1\n                      }\n                    }\n                  },\n                \"name\" : \"values\",\n                \"execPortType\" : \"In\",\n                \"typeSpec\" : \"Xfo[]\"\n"
		+ "                },\n              {\n                \"objectType\" : \"Port\",\n                \"metadata\" : {\n                  \"uiColor\" : \"{\\n  \\\"r\\\" : 0,\\n  \\\"g\\\" : 191,\\n  \\\"b\\\" : 232\\n  }\"\n                  },\n                \"nodePortType\" : \"In\",\n                \"name\" : \"ori\",\n                \"execPortType\" : \"Out\",\n                \"typeSpec\" : \"Quat[]\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"metadata\" : {\n                  \"uiColor\" : \"{\\n  \\\"r\\\" : 255,\\n  \\\"g\\\" : 242,\\n  \\\"b\\\" : 0\\n  }\"\n                  },\n                \"nodePortType\" : \"In\",\n                \"name\" : \"tr\",\n                \"execPortType\" : \"Out\",\n                \"typeSpec\" : \"Vec3[]\"\n                },\n              {\n                \"objectType\" : \"Port\",\n                \"metadata\" : {\n                  \"uiColor\" : \"{\\n  \\\"r\\\" : 255,\\n  \\\"g\\\" : 242,\\n  \\\"b\\\" : 0\\n  }\"\n                  },\n                \"nodePortType\" : \"In\",\n                \"name\" : \"sc\",\n                \"execPortType\" : \"Out\",\n"
		+ "                \"typeSpec\" : \"Vec3[]\"\n                }\n              ],\n            \"extDeps\" : {\n              \"Math\" : \"*\"\n              },\n            \"code\" : \"require Math;\n\ndfgEntry {\n  UInt32 s = values.size();\n  ori.resize(s);\n  tr.resize(s);\n  sc.resize(s);\n  for (UInt32 i =0; i<values.size(); i++)\n  {\n    ori[i]= values[i].ori;\n    tr[i] = values[i].tr;\n    sc[i] = values[i].sc;\n  }\n}\n\"\n            }\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":39.1578,\\\"y\\\":1025.83}\"\n            },\n          \"name\" : \"normalizeScalarArray\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"IO\",\n              \"name\" : \"this\"\n              }\n            ],\n          \"executable\" : \"OSS.Math.normalizeScalarArray\",\n          \"presetGUID\" : \"B060177C592CAB2F7D72B32527F6D9D3\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":354.73,\\\"y\\\":1269.22}\"\n"
		+ "            },\n          \"name\" : \"weightedAverageVec3_1\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"IO\",\n              \"name\" : \"vectors\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"weights\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"OSS.Math.weightedAverageVec3\",\n          \"presetGUID\" : \"8FEF4604E2CB59EC14EEF05EB6B2DDD6\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":690.979,\\\"y\\\":889.837}\"\n            },\n          \"name\" : \"SphericalLinearInterpolate_1\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"this\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n"
		+ "              \"nodePortType\" : \"In\",\n              \"name\" : \"q2\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"t\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"Fabric.Exts.Math.Quat.SphericalLinearInterpolate\",\n          \"presetGUID\" : \"8F8A88A5073927972931DF1FB8D01172\"\n          },\n        {\n          \"objectType\" : \"Inst\",\n          \"metadata\" : {\n            \"uiGraphPos\" : \"{\\\"x\\\":344.322,\\\"y\\\":1133.58}\"\n            },\n          \"name\" : \"weightedAverageVec3_2\",\n          \"ports\" : [\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"IO\",\n              \"name\" : \"vectors\"\n              },\n            {\n              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"In\",\n              \"name\" : \"weights\"\n              },\n            {\n"
		+ "              \"objectType\" : \"InstPort\",\n              \"nodePortType\" : \"Out\",\n              \"name\" : \"result\"\n              }\n            ],\n          \"executable\" : \"OSS.Math.weightedAverageVec3\",\n          \"presetGUID\" : \"8FEF4604E2CB59EC14EEF05EB6B2DDD6\"\n          }\n        ],\n      \"connections\" : {\n        \"xfoRest\" : [\n          \"SetFromMat44_2.m\"\n          ],\n        \"xfos\" : [\n          \"SetFromMat44_3.m\"\n          ],\n        \"xfoWeights\" : [\n          \"normalizeScalarArray.this\"\n          ],\n        \"translationAmt\" : [\n          \"LinearInterpolate_2.t\"\n          ],\n        \"rotationAmt\" : [\n          \"SphericalLinearInterpolate_1.t\"\n          ],\n        \"scaleAmt\" : [\n          \"LinearInterpolate_Translation.t\"\n          ],\n        \"atAxis\" : [\n          \"orientXfo_2.atAxis\"\n          ],\n        \"upAxis\" : [\n          \"orientXfo_2.upAxis\"\n          ],\n        \"ToMat44_1.result\" : [\n          \"result\"\n          ],\n        \"DecomposeXfo_1.ori\" : [\n          \"SphericalLinearInterpolate_1.this\"\n          ],\n"
		+ "        \"DecomposeXfo_1.tr\" : [\n          \"LinearInterpolate_2.this\"\n          ],\n        \"DecomposeXfo_1.sc\" : [\n          \"LinearInterpolate_Translation.this\"\n          ],\n        \"LinearInterpolate_Translation.result\" : [\n          \"ComposeXfo_1.sc\"\n          ],\n        \"LinearInterpolate_2.result\" : [\n          \"ComposeXfo_1.tr\"\n          ],\n        \"ComposeXfo_1.result\" : [\n          \"ToMat44_1.this\",\n          \"orientXfo_2.this\"\n          ],\n        \"SetFromMat44_2.this\" : [\n          \"DecomposeXfo_1.value\"\n          ],\n        \"test.result\" : [\n          \"SphericalLinearInterpolate_1.q2\"\n          ],\n        \"SetFromMat44_3.result\" : [\n          \"DecomposeXfo_3.values\"\n          ],\n        \"DecomposeXfo_3.ori\" : [\n          \"test.quats\"\n          ],\n        \"DecomposeXfo_3.tr\" : [\n          \"weightedAverageVec3_2.vectors\"\n          ],\n        \"DecomposeXfo_3.sc\" : [\n          \"weightedAverageVec3_1.vectors\"\n          ],\n        \"normalizeScalarArray.this\" : [\n          \"test.weights\",\n          \"weightedAverageVec3_1.weights\",\n"
		+ "          \"weightedAverageVec3_2.weights\"\n          ],\n        \"weightedAverageVec3_1.result\" : [\n          \"LinearInterpolate_Translation.other\"\n          ],\n        \"SphericalLinearInterpolate_1.result\" : [\n          \"ComposeXfo_1.ori\"\n          ],\n        \"weightedAverageVec3_2.result\" : [\n          \"LinearInterpolate_2.other\"\n          ]\n        }\n      },\n    \"Fabric.Exts.Math.Xfo.ToMat44\" : {\n      \"objectType\" : \"Func\",\n      \"metadata\" : {\n        \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n        \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Xfo.html\",\n        \"uiTooltip\" : \"Returns this xfo as a Mat44\\n\\n Supported by Xfo\"\n        },\n      \"title\" : \"ToMat44\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n            },\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"this\",\n          \"execPortType\" : \"In\",\n"
		+ "          \"typeSpec\" : \"Xfo\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n            },\n          \"nodePortType\" : \"In\",\n          \"name\" : \"result\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Mat44\"\n          }\n        ],\n      \"extDeps\" : {\n        \"Math\" : \"*\"\n        },\n      \"presetGUID\" : \"3EB232DB6FF4BEE162E1D62ABFBE8C3A\",\n      \"code\" : \"require Math;\n\ndfgEntry {\n  result = this.toMat44();\n}\n\"\n      },\n    \"Fabric.Exts.Math.Xfo.DecomposeXfo\" : {\n      \"objectType\" : \"Func\",\n      \"metadata\" : {\n        \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n        \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Xfo.html\"\n        },\n      \"title\" : \"Xfo ->\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n"
		+ "            },\n          \"nodePortType\" : \"Out\",\n          \"defaultValues\" : {\n            \"Xfo\" : {\n              \"ori\" : {\n                \"v\" : {\n                  \"x\" : 0,\n                  \"y\" : 0,\n                  \"z\" : 0\n                  },\n                \"w\" : 1\n                },\n              \"tr\" : {\n                \"x\" : 0,\n                \"y\" : 0,\n                \"z\" : 0\n                },\n              \"sc\" : {\n                \"x\" : 1,\n                \"y\" : 1,\n                \"z\" : 1\n                }\n              }\n            },\n          \"name\" : \"value\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Xfo\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 0,\\n  \\\"g\\\" : 191,\\n  \\\"b\\\" : 232\\n  }\"\n            },\n          \"nodePortType\" : \"In\",\n          \"name\" : \"ori\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Quat\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 255,\\n  \\\"g\\\" : 242,\\n  \\\"b\\\" : 0\\n  }\"\n"
		+ "            },\n          \"nodePortType\" : \"In\",\n          \"name\" : \"tr\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Vec3\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 255,\\n  \\\"g\\\" : 242,\\n  \\\"b\\\" : 0\\n  }\"\n            },\n          \"nodePortType\" : \"In\",\n          \"name\" : \"sc\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Vec3\"\n          }\n        ],\n      \"extDeps\" : {\n        \"Math\" : \"*\"\n        },\n      \"presetGUID\" : \"F1CE36998E153872EE926747BEB0E7A6\",\n      \"code\" : \"require Math;\n\ndfgEntry {\n  ori = value.ori;\n  tr = value.tr;\n  sc = value.sc;\n}\n\"\n      },\n    \"Fabric.Exts.Math.Func.LinearInterpolate\" : {\n      \"objectType\" : \"Func\",\n      \"metadata\" : {\n        \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n        \"uiTooltip\" : \"Linearly interpolates a scalar value with another based on a blend (0.0 to 1.0)\\n\\n Supported by Float32,Float64,RGB,RGBA,ARGB,Color,Vec2,Vec3,Vec4,Quat,Xfo\"\n"
		+ "        },\n      \"title\" : \"LinearInterpolate\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"this\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"$TYPE$\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"other\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"$TYPE$\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"t\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Scalar\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"result\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"$TYPE$\"\n          }\n        ],\n      \"extDeps\" : {\n        \"Math\" : \"*\"\n        },\n      \"presetGUID\" : \"12CF7203114B81451A5EEC920610EDA9\",\n      \"code\" : \"require Math;\n\ndfgEntry {\n  result = this.linearInterpolate(other, t);\n}\n\"\n      },\n    \"Fabric.Exts.Math.Xfo.ComposeXfo\" : {\n"
		+ "      \"objectType\" : \"Func\",\n      \"metadata\" : {\n        \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n        \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Xfo.html\"\n        },\n      \"title\" : \"-> Xfo\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 0,\\n  \\\"g\\\" : 191,\\n  \\\"b\\\" : 232\\n  }\"\n            },\n          \"nodePortType\" : \"Out\",\n          \"defaultValues\" : {\n            \"Quat\" : {\n              \"v\" : {\n                \"x\" : 0,\n                \"y\" : 0,\n                \"z\" : 0\n                },\n              \"w\" : 1\n              }\n            },\n          \"name\" : \"ori\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Quat\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 255,\\n  \\\"g\\\" : 242,\\n  \\\"b\\\" : 0\\n  }\"\n            },\n          \"nodePortType\" : \"Out\",\n          \"defaultValues\" : {\n"
		+ "            \"Vec3\" : {\n              \"x\" : 0,\n              \"y\" : 0,\n              \"z\" : 0\n              }\n            },\n          \"name\" : \"tr\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Vec3\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 255,\\n  \\\"g\\\" : 242,\\n  \\\"b\\\" : 0\\n  }\"\n            },\n          \"nodePortType\" : \"Out\",\n          \"defaultValues\" : {\n            \"Vec3\" : {\n              \"x\" : 1,\n              \"y\" : 1,\n              \"z\" : 1\n              }\n            },\n          \"name\" : \"sc\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Vec3\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n            },\n          \"nodePortType\" : \"In\",\n          \"name\" : \"result\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Xfo\"\n          }\n        ],\n      \"extDeps\" : {\n        \"Math\" : \"*\"\n        },\n"
		+ "      \"presetGUID\" : \"C61287D19D84D9733903DDC14FABD4AF\",\n      \"code\" : \"require Math;\n\ndfgEntry {\n  result.ori = ori;\n  result.tr = tr;\n  result.sc = sc;\n}\n\"\n      },\n    \"Fabric.Exts.Math.Xfo.SetFromMat44\" : {\n      \"objectType\" : \"Func\",\n      \"metadata\" : {\n        \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n        \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Xfo.html\",\n        \"uiTooltip\" : \"Sets this transform from a given Mat44\\n\\n Supported by Xfo\"\n        },\n      \"title\" : \"SetFromMat44\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n            },\n          \"nodePortType\" : \"IO\",\n          \"name\" : \"this\",\n          \"execPortType\" : \"IO\",\n          \"typeSpec\" : \"Xfo\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 249,\\n  \\\"g\\\" : 157,\\n  \\\"b\\\" : 28\\n  }\"\n"
		+ "            },\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"m\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Mat44\"\n          }\n        ],\n      \"extDeps\" : {\n        \"Math\" : \"*\"\n        },\n      \"presetGUID\" : \"59B1B738E9402F3006B2516B14A43848\",\n      \"code\" : \"require Math;\n\ndfgEntry {\n  this.setFromMat44(m);\n}\n\"\n      },\n    \"OSS.Math.normalizeScalarArray\" : {\n      \"objectType\" : \"Func\",\n      \"title\" : \"normalizeScalarArray\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"IO\",\n          \"name\" : \"this\",\n          \"execPortType\" : \"IO\",\n          \"typeSpec\" : \"Scalar[]\"\n          }\n        ],\n      \"extDeps\" : {},\n      \"presetGUID\" : \"B060177C592CAB2F7D72B32527F6D9D3\",\n      \"code\" : \"\ndfgEntry  {\n  Boolean takeFirstIfInvalid = true;\n  UInt32 count = this.size();\n  Scalar sum;\n  \n  for( Size i = 0; i < this.size(); ++i )\n    sum += this[i];\n    \n  if( sum > 0.0001 ) {\n    for( Size i = 0; i < count; ++i )\n      this[i] = this[i]/sum;\n  \n  } else if(count) {\n"
		+ "    //Just put equal weights; ensures sum is 1.0\n    for( Size i = 0; i < count; ++i )\n      if (!takeFirstIfInvalid) {\n        this[i] = 1/Scalar(count);\n      } else {\n        if (i==0) this[i]=1;\n        else this[i]=0;\n      }\n  }\n}\n\"\n      },\n    \"OSS.Math.weightedAverageVec3\" : {\n      \"objectType\" : \"Func\",\n      \"title\" : \"weightedAverageVec3\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"IO\",\n          \"name\" : \"vectors\",\n          \"execPortType\" : \"IO\",\n          \"typeSpec\" : \"Vec3[]\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"weights\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Scalar[]\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"In\",\n          \"name\" : \"result\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Vec3\"\n          }\n        ],\n      \"extDeps\" : {},\n      \"presetGUID\" : \"8FEF4604E2CB59EC14EEF05EB6B2DDD6\",\n      \"code\" : \"//NOTE: weights need to be normalized\n"
		+ "dfgEntry {\n  UInt32 numVecs = weights.size();\n  Vec3 cumVec = Vec3()*0;\n  vectors.resize(numVecs);\n \n  for (UInt32 i=0; i<numVecs; i++)\n  { \n    Vec3 wVec = vectors[i]*weights[i];\n    \n    result += wVec;\n  }\n}\"\n      },\n    \"Fabric.Exts.Math.Quat.SphericalLinearInterpolate\" : {\n      \"objectType\" : \"Func\",\n      \"metadata\" : {\n        \"uiNodeColor\" : \"{\\n  \\\"r\\\" : 99,\\n  \\\"g\\\" : 129,\\n  \\\"b\\\" : 92\\n  }\",\n        \"uiDocUrl\" : \"http://docs.fabric-engine.com/FabricEngine/2.0.1/HTML/KLExtensionsGuide/Math/Quat.html\",\n        \"uiTooltip\" : \"interpolates two quaternions spherically (slerp)\\ngiven a scalar blend value (0.0 to 1.0).\\n\\n Supported by Quat\"\n        },\n      \"title\" : \"SphericalLinearInterpolate\",\n      \"ports\" : [\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 0,\\n  \\\"g\\\" : 191,\\n  \\\"b\\\" : 232\\n  }\"\n            },\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"this\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Quat\"\n          },\n"
		+ "        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 0,\\n  \\\"g\\\" : 191,\\n  \\\"b\\\" : 232\\n  }\"\n            },\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"q2\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Quat\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"nodePortType\" : \"Out\",\n          \"name\" : \"t\",\n          \"execPortType\" : \"In\",\n          \"typeSpec\" : \"Scalar\"\n          },\n        {\n          \"objectType\" : \"Port\",\n          \"metadata\" : {\n            \"uiColor\" : \"{\\n  \\\"r\\\" : 0,\\n  \\\"g\\\" : 191,\\n  \\\"b\\\" : 232\\n  }\"\n            },\n          \"nodePortType\" : \"In\",\n          \"name\" : \"result\",\n          \"execPortType\" : \"Out\",\n          \"typeSpec\" : \"Quat\"\n          }\n        ],\n      \"extDeps\" : {\n        \"Math\" : \"*\"\n        },\n      \"presetGUID\" : \"8F8A88A5073927972931DF1FB8D01172\",\n      \"code\" : \"require Math;\n\ndfgEntry {\n  result = this.sphericalLinearInterpolate(q2, t);\n}\n\"\n      }\n    },\n  \"args\" : [\n    {\n"
		+ "      \"type\" : \"Mat44\",\n      \"value\" : null,\n      \"ext\" : \"Math\"\n      },\n    {\n      \"type\" : \"Scalar[]\",\n      \"value\" : null\n      },\n    {\n      \"type\" : \"Mat44[]\",\n      \"value\" : null,\n      \"ext\" : \"Math\"\n      },\n    {\n      \"type\" : \"Float32\",\n      \"value\" : 0\n      },\n    {\n      \"type\" : \"Float32\",\n      \"value\" : null\n      },\n    {\n      \"type\" : \"Float32\",\n      \"value\" : null\n      },\n    {\n      \"type\" : \"Mat44\",\n      \"value\" : null,\n      \"ext\" : \"Math\"\n      },\n    {\n      \"type\" : \"SInt32\",\n      \"value\" : null\n      },\n    {\n      \"type\" : \"SInt32\",\n      \"value\" : null\n      }\n    ]\n  }");
	setAttr ".evalID" 26;
	setAttr -s 4 ".spaces";
	setAttr -k on ".spaces[0]" -type "matrix" 1.2587950949296607 -2.0931303518456081 1.2569333427405687 0
		 0.97555156515967467 -0.86516727879837696 -2.4177315633337777 0 2.2381633634801568 1.5543268957360818 0.3468916956283325 0
		 2.9177082004563539 17.073797147803468 -12.929036966220549 1;
	setAttr -k on ".spaces[1]" -type "matrix" -3.225466286985669 0.68593357324262338 1.0985555775075315 0
		 1.1845999880528975 0.37081735604154215 3.2465642376239621 0 0.52349984916843573 3.3871745768135995 -0.57789124094734146 0
		 2.9877730387333798 -3.6029456524660688 -10.256638410273663 1;
	setAttr -k on ".spaces[2]" -type "matrix" 0.3385741490147488 -0.0057012225176235297 -0.11116891427161933 0
		 0.098301218442852986 0.18231954025202746 0.29003437988370834 0 0.052229320225105402 -0.30618714395559016 0.17477132718134719 0
		 -3.0054240894707647 7.9974955475410958 10.094636953063411 1;
	setAttr -k on ".spaces[3]" -type "matrix" 0.070547878206713321 0.39406185637070124 1.2766906910880702 0
		 -0.70284270231552948 1.0982382277798592 -0.30014296813599417 0 -1.1363256589371999 -0.65481976060085223 0.26490743372791176 0
		 -9.3302307611606263 25.214096900538021 1.1568384903362703 1;
	setAttr -k on ".spaces";
	setAttr -k on ".rotationAmt" 0;
	setAttr -k on ".scaleAmt" 1;
	setAttr -k on ".translationAmt" 1;
	setAttr -k on ".mat44Rest" -type "matrix" 1.2587950949296607 -2.0931303518456081 1.2569333427405687 0
		 0.97555156515967467 -0.86516727879837696 -2.4177315633337777 0 2.2381633634801568 1.5543268957360818 0.3468916956283325 0
		 2.9177082004563539 17.073797147803468 -12.929036966220549 1;
	setAttr -k on ".atAxis" 1;
	setAttr -k on ".upAxis" 2;
	setAttr -s 4 -k on ".spaceWeights[0:3]"  1 1 0 0;
	setAttr -s 4 -k on ".spaceWeights";
	setAttr -k on ".spaceWeights[0]";
	setAttr -k on ".spaceWeights[1]";
	setAttr -k on ".spaceWeights[2]";
	setAttr -k on ".spaceWeights[3]";
createNode decomposeMatrix -n "decomposeMatrix1";
	rename -uid "50A0ECF2-4C81-FC6B-E707-3BA5A743F22D";
	setAttr ".ot" -type "double3" 2.9527406692504883 6.7354259490966797 -11.592838287353516 ;
	setAttr ".or" -type "double3" -81.835025111262439 -27.230860742966883 -58.97757471012725 ;
	setAttr ".os" -type "double3" 3.1113503166508996 3.1113505011981948 3.111350461418747 ;
	setAttr ".osh" -type "double3" 4.0819708083273791e-008 1.1356805955853174e-008 -5.3989788683156743e-008 ;
	setAttr ".oqx" -0.64166362042101099;
	setAttr ".oqy" 0.15851220904227417;
	setAttr ".oqz" -0.49572828200983998;
	setAttr ".oqw" 0.56337833489433342;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "CCDB74CA-4B30-998B-46A4-33B0240393A8";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n"
		+ "                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n"
		+ "            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n"
		+ "        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n"
		+ "                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n"
		+ "                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n"
		+ "                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n"
		+ "            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n"
		+ "            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n"
		+ "            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n"
		+ "                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n"
		+ "                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n"
		+ "                -width 1\n                -height 1\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n"
		+ "            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n"
		+ "            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n"
		+ "            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 1\n                -headsUpDisplay 1\n"
		+ "                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n"
		+ "                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n"
		+ "                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 764\n                -height 1257\n                -sceneRenderFilter 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n"
		+ "\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n"
		+ "            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n"
		+ "            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 764\n            -height 1257\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n"
		+ "            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n"
		+ "                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 0\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n"
		+ "            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n"
		+ "            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n"
		+ "                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n"
		+ "                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n"
		+ "                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n"
		+ "                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n"
		+ "                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n"
		+ "                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n"
		+ "                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n"
		+ "                -ignoreOutlinerColor 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n"
		+ "                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"profilerPanel\" -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"Stereo\" -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels `;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n"
		+ "                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\nstring $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n"
		+ "                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n"
		+ "                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n"
		+ "                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n"
		+ "                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab 0\n                -editorMode \"default\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -additiveGraphingMode 1\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab 0\n                -editorMode \"default\" \n"
		+ "                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 20 100 -ps 2 80 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 0\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    -ignoreHiddenAttribute 0\\n    -ignoreOutlinerColor 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -docTag \\\"isolOutln_fromSeln\\\" \\n    -showShapes 0\\n    -showReferenceNodes 1\\n    -showReferenceMembers 1\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 0\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    -ignoreHiddenAttribute 0\\n    -ignoreOutlinerColor 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 764\\n    -height 1257\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"wireframe\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 764\\n    -height 1257\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "6886AB33-49A9-F929-635B-778E16CAD9EA";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode groupId -n "groupId21";
	rename -uid "8B598B96-4750-8887-BBAE-CDA58E63F380";
	setAttr ".ihi" 0;
createNode groupId -n "groupId22";
	rename -uid "07FF1ED8-4DE0-7083-CDC7-4C90D8C28F07";
	setAttr ".ihi" 0;
createNode groupId -n "groupId23";
	rename -uid "D06A81B1-480C-C7CD-6438-EEBB4A8719A7";
	setAttr ".ihi" 0;
createNode groupId -n "groupId24";
	rename -uid "AB834082-4984-4E8B-5181-46B4289CB714";
	setAttr ".ihi" 0;
createNode groupId -n "groupId25";
	rename -uid "824E3168-4F72-3638-EC86-15A66334CA6C";
	setAttr ".ihi" 0;
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "D5B29BED-44B6-03F3-38C1-2292BC12A3AE";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" -605.62483353317316 -617.07675834582938 ;
	setAttr ".tgi[0].vh" -type "double2" 200.3446035678428 478.16129337141598 ;
	setAttr -s 14 ".tgi[0].ni";
	setAttr ".tgi[0].ni[0].x" -252.95416259765625;
	setAttr ".tgi[0].ni[0].y" -276.76824951171875;
	setAttr ".tgi[0].ni[0].nvs" 18304;
	setAttr ".tgi[0].ni[1].x" -250.56074523925781;
	setAttr ".tgi[0].ni[1].y" -147.96430969238281;
	setAttr ".tgi[0].ni[1].nvs" 18304;
	setAttr ".tgi[0].ni[2].x" 698.9720458984375;
	setAttr ".tgi[0].ni[2].y" -490.45489501953125;
	setAttr ".tgi[0].ni[2].nvs" 18304;
	setAttr ".tgi[0].ni[3].x" 1505.7142333984375;
	setAttr ".tgi[0].ni[3].y" -211.42857360839844;
	setAttr ".tgi[0].ni[3].nvs" 18304;
	setAttr ".tgi[0].ni[4].x" -140.86683654785156;
	setAttr ".tgi[0].ni[4].y" -658.1129150390625;
	setAttr ".tgi[0].ni[4].nvs" 18304;
	setAttr ".tgi[0].ni[5].x" 1479.7479248046875;
	setAttr ".tgi[0].ni[5].y" -140.50419616699219;
	setAttr ".tgi[0].ni[5].nvs" 18306;
	setAttr ".tgi[0].ni[6].x" -562.66851806640625;
	setAttr ".tgi[0].ni[6].y" 15.806761741638184;
	setAttr ".tgi[0].ni[6].nvs" 18306;
	setAttr ".tgi[0].ni[7].x" 762.99542236328125;
	setAttr ".tgi[0].ni[7].y" 128.11189270019531;
	setAttr ".tgi[0].ni[7].nvs" 18306;
	setAttr ".tgi[0].ni[8].x" 1758.5714111328125;
	setAttr ".tgi[0].ni[8].y" -211.42857360839844;
	setAttr ".tgi[0].ni[8].nvs" 18304;
	setAttr ".tgi[0].ni[9].x" -404.37612915039062;
	setAttr ".tgi[0].ni[9].y" 447.45062255859375;
	setAttr ".tgi[0].ni[9].nvs" 18306;
	setAttr ".tgi[0].ni[10].x" 1758.5714111328125;
	setAttr ".tgi[0].ni[10].y" -211.42857360839844;
	setAttr ".tgi[0].ni[10].nvs" 18304;
	setAttr ".tgi[0].ni[11].x" -132.94610595703125;
	setAttr ".tgi[0].ni[11].y" 255.6600341796875;
	setAttr ".tgi[0].ni[11].nvs" 18304;
	setAttr ".tgi[0].ni[12].x" -281.97540283203125;
	setAttr ".tgi[0].ni[12].y" -230.489990234375;
	setAttr ".tgi[0].ni[12].nvs" 18304;
	setAttr ".tgi[0].ni[13].x" 64.254486083984375;
	setAttr ".tgi[0].ni[13].y" 54.487136840820312;
	setAttr ".tgi[0].ni[13].nvs" 22114;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 7 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr -s 10 ".dsm";
	setAttr ".ro" yes;
	setAttr -s 10 ".gn";
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "groupId1.id" "bodyShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "bodyShape.iog.og[0].gco";
connectAttr "groupId3.id" "bodyShape.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "bodyShape.iog.og[1].gco";
connectAttr "groupId4.id" "bodyShape.iog.og[2].gid";
connectAttr "lambert3SG.mwc" "bodyShape.iog.og[2].gco";
connectAttr "groupId5.id" "bodyShape.iog.og[3].gid";
connectAttr "lambert4SG.mwc" "bodyShape.iog.og[3].gco";
connectAttr "groupParts4.og" "bodyShape.i";
connectAttr "groupId2.id" "bodyShape.ciog.cog[0].cgid";
connectAttr "groupId6.id" "chestShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "chestShape.iog.og[0].gco";
connectAttr "groupId7.id" "chestShape.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "chestShape.iog.og[1].gco";
connectAttr "groupId8.id" "chestShape.iog.og[2].gid";
connectAttr "lambert3SG.mwc" "chestShape.iog.og[2].gco";
connectAttr "groupId9.id" "chestShape.iog.og[3].gid";
connectAttr "lambert4SG.mwc" "chestShape.iog.og[3].gco";
connectAttr "groupId10.id" "chestShape.ciog.cog[1].cgid";
connectAttr "groupId11.id" "headShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "headShape.iog.og[0].gco";
connectAttr "groupId12.id" "headShape.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "headShape.iog.og[1].gco";
connectAttr "groupId13.id" "headShape.iog.og[2].gid";
connectAttr "lambert3SG.mwc" "headShape.iog.og[2].gco";
connectAttr "groupId14.id" "headShape.iog.og[3].gid";
connectAttr "lambert4SG.mwc" "headShape.iog.og[3].gco";
connectAttr "groupId15.id" "headShape.ciog.cog[2].cgid";
connectAttr "groupId21.id" "REFShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "REFShape.iog.og[0].gco";
connectAttr "groupId22.id" "REFShape.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "REFShape.iog.og[1].gco";
connectAttr "groupId23.id" "REFShape.iog.og[2].gid";
connectAttr "lambert3SG.mwc" "REFShape.iog.og[2].gco";
connectAttr "groupId24.id" "REFShape.iog.og[3].gid";
connectAttr "lambert4SG.mwc" "REFShape.iog.og[3].gco";
connectAttr "groupId25.id" "REFShape.ciog.cog[1].cgid";
connectAttr "decomposeMatrix1.or" "target.r";
connectAttr "decomposeMatrix1.ot" "target.t";
connectAttr "decomposeMatrix1.os" "target.s";
connectAttr "groupId16.id" "targetShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "targetShape.iog.og[0].gco";
connectAttr "groupId17.id" "targetShape.iog.og[1].gid";
connectAttr "lambert2SG.mwc" "targetShape.iog.og[1].gco";
connectAttr "groupId18.id" "targetShape.iog.og[2].gid";
connectAttr "lambert3SG.mwc" "targetShape.iog.og[2].gco";
connectAttr "groupId19.id" "targetShape.iog.og[3].gid";
connectAttr "lambert4SG.mwc" "targetShape.iog.og[3].gco";
connectAttr "groupId20.id" "targetShape.ciog.cog[1].cgid";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert4SG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr ":TurtleDefaultBakeLayer.idx" ":TurtleBakeLayerManager.bli[0]";
connectAttr ":TurtleRenderOptions.msg" ":TurtleDefaultBakeLayer.rset";
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "bodyShape.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "chestShape.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "headShape.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "targetShape.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "REFShape.iog.og[1]" "lambert2SG.dsm" -na;
connectAttr "groupId3.msg" "lambert2SG.gn" -na;
connectAttr "groupId7.msg" "lambert2SG.gn" -na;
connectAttr "groupId12.msg" "lambert2SG.gn" -na;
connectAttr "groupId17.msg" "lambert2SG.gn" -na;
connectAttr "groupId22.msg" "lambert2SG.gn" -na;
connectAttr "lambert2SG.msg" "materialInfo1.sg";
connectAttr "lambert2.msg" "materialInfo1.m";
connectAttr "lambert3.oc" "lambert3SG.ss";
connectAttr "bodyShape.iog.og[2]" "lambert3SG.dsm" -na;
connectAttr "chestShape.iog.og[2]" "lambert3SG.dsm" -na;
connectAttr "headShape.iog.og[2]" "lambert3SG.dsm" -na;
connectAttr "targetShape.iog.og[2]" "lambert3SG.dsm" -na;
connectAttr "REFShape.iog.og[2]" "lambert3SG.dsm" -na;
connectAttr "groupId4.msg" "lambert3SG.gn" -na;
connectAttr "groupId8.msg" "lambert3SG.gn" -na;
connectAttr "groupId13.msg" "lambert3SG.gn" -na;
connectAttr "groupId18.msg" "lambert3SG.gn" -na;
connectAttr "groupId23.msg" "lambert3SG.gn" -na;
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "lambert3.msg" "materialInfo2.m";
connectAttr "polyCube1.out" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "groupParts1.og" "groupParts2.ig";
connectAttr "groupId3.id" "groupParts2.gi";
connectAttr "groupParts2.og" "groupParts3.ig";
connectAttr "groupId4.id" "groupParts3.gi";
connectAttr "lambert4.oc" "lambert4SG.ss";
connectAttr "bodyShape.iog.og[3]" "lambert4SG.dsm" -na;
connectAttr "chestShape.iog.og[3]" "lambert4SG.dsm" -na;
connectAttr "headShape.iog.og[3]" "lambert4SG.dsm" -na;
connectAttr "targetShape.iog.og[3]" "lambert4SG.dsm" -na;
connectAttr "REFShape.iog.og[3]" "lambert4SG.dsm" -na;
connectAttr "groupId5.msg" "lambert4SG.gn" -na;
connectAttr "groupId9.msg" "lambert4SG.gn" -na;
connectAttr "groupId14.msg" "lambert4SG.gn" -na;
connectAttr "groupId19.msg" "lambert4SG.gn" -na;
connectAttr "groupId24.msg" "lambert4SG.gn" -na;
connectAttr "lambert4SG.msg" "materialInfo3.sg";
connectAttr "lambert4.msg" "materialInfo3.m";
connectAttr "groupParts3.og" "groupParts4.ig";
connectAttr "groupId5.id" "groupParts4.gi";
connectAttr "lambert2.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[0].dn"
		;
connectAttr "lambert2SG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[1].dn"
		;
connectAttr "lambert3.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "lambert3SG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[3].dn"
		;
connectAttr "lambert4.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[4].dn"
		;
connectAttr "lambert4SG.msg" "hyperShadePrimaryNodeEditorSavedTabsInfo.tgi[0].ni[5].dn"
		;
connectAttr "REF.wm" "canvasNode1.spaces[0]";
connectAttr "body.wm" "canvasNode1.spaces[1]";
connectAttr "chest.wm" "canvasNode1.spaces[2]";
connectAttr "head.wm" "canvasNode1.spaces[3]";
connectAttr "REF.wm" "canvasNode1.mat44Rest";
connectAttr "target.w0" "canvasNode1.spaceWeights[0]";
connectAttr "target.w1" "canvasNode1.spaceWeights[1]";
connectAttr "target.w2" "canvasNode1.spaceWeights[2]";
connectAttr "target.w3" "canvasNode1.spaceWeights[3]";
connectAttr "canvasNode1.result" "decomposeMatrix1.imat";
connectAttr "head.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[0].dn";
connectAttr "body.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[1].dn";
connectAttr ":TurtleDefaultBakeLayer.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[2].dn"
		;
connectAttr "locatorShape1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[3].dn";
connectAttr "targetShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[4].dn";
connectAttr "pSphere1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[5].dn";
connectAttr "target.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[6].dn";
connectAttr "decomposeMatrix1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[7].dn"
		;
connectAttr "group1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[8].dn";
connectAttr "REF.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[9].dn";
connectAttr "REFShape.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[10].dn";
connectAttr "locator1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[11].dn";
connectAttr "chest.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[12].dn";
connectAttr "canvasNode1.msg" "MayaNodeEditorSavedTabsInfo.tgi[0].ni[13].dn";
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "lambert4SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "decomposeMatrix1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "bodyShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "bodyShape.ciog.cog[0]" ":initialShadingGroup.dsm" -na;
connectAttr "chestShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "chestShape.ciog.cog[1]" ":initialShadingGroup.dsm" -na;
connectAttr "headShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "headShape.ciog.cog[2]" ":initialShadingGroup.dsm" -na;
connectAttr "targetShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "targetShape.ciog.cog[1]" ":initialShadingGroup.dsm" -na;
connectAttr "REFShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "REFShape.ciog.cog[1]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId2.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId6.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId10.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId11.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId15.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId16.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId20.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId21.msg" ":initialShadingGroup.gn" -na;
connectAttr "groupId25.msg" ":initialShadingGroup.gn" -na;
// End of Space Switching.ma
