
PImage map;
PImage mapCopy;
//measured in 1,000 cwt

myState[] allStates = new myState[50];
String[] stateList = {
  "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "NewHampshire", "NewJersey", "NewMexico", "NewYork", "NorthCarolina", "NorthDakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "RhodeIsland", "SouthCarolina", "South", "DakotaTennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "WestVirginia", "Wisconsin", "Wyoming"
};
color[] stateColors = {
  color(243, 143, 255), color(255, 0, 0), color(255, 174, 220), color(255, 230, 148), color(255, 150, 205), color(181, 196, 255), color(255, 226, 184), color(191, 255, 160), color(130, 220, 255), color(255, 170, 192), color(0, 255, 0), color(255, 154, 175), color(255, 251, 177), color(255, 143, 163), color(255, 175, 196), color(159, 255, 247), color(234, 147, 255), color(255, 238, 134), color(130, 255, 197), color(255, 156, 207), color(238, 183, 255), color(255, 182, 200), color(175, 180, 255), color(255, 163, 138), color(255, 175, 248), color(255, 139, 185), color(182, 176, 255), color(199, 132, 255), color(209, 169, 255), color(179, 255, 206), color(175, 181, 255), color(253, 255, 152), color(183, 161, 255), color(255, 186, 169), color(178, 255, 138), color(255, 182, 154), color(255, 214, 156), color(248, 133, 255), color(187, 173, 255), color(154, 255, 143), color(255, 143, 177), color(255, 185, 167), color(155, 255, 219), color(187, 255, 207), color(228, 188, 255), color(233, 158, 255), color(242, 255, 142), color(132, 255, 248), color(183, 255, 232), color(155, 167, 255)
};

float maxValue;
int year=0;

HScrollbar scroll;

void setup() {
  map=loadImage("usamap_3.png");
  mapCopy=loadImage("usamap_3.png");
  size(479, 374);
  float[] alabama= {
    152, 152, 156, 119, 107, 108, 125, 125, 144, 165, 196, 150, 246, 293, 259, 263, 300, 152, 228, 234, 106, 171, 181, 134, 250, 240, 300, 413, 175, 165, 202, 192, 180, 154, 174, 92, 150, 130, 61, 130, 90, 136, 156, 125, 78, 52, 23, 31, 38, 74
  }; 
  float[] arkansas= {
    50, 50, 36, 36, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] arizona= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64, 46, 75, 126, 168, 142, 178, 69, 40, 43, 0, 0, 0, 0, 0, 0, 0
  };
  float[] california= {
    1318, 1412, 1359, 1271, 1191, 1175, 1072, 861, 912, 829, 1063, 835, 1336, 1065, 1222, 1352, 1562, 1589, 1464, 1384, 1400, 1501, 1406, 1576, 1521, 1544, 1500, 1520, 1620, 2013, 1900, 1956, 2405, 2800, 3024, 3345, 3736, 3915, 5600, 4290, 3960, 3740, 4550, 5415, 4655, 4681, 4573, 4480, 3984, 4482
  };
  float[] colorado= {
    168, 195, 175, 195, 188, 168, 192, 192, 228, 217, 208, 208, 208, 217, 257, 316, 306, 314, 320, 320, 304, 310, 310, 345, 408, 527, 561, 473, 504, 435, 545, 496, 741, 688, 672, 675, 924, 1040, 1104, 1072, 1001, 1106, 900, 1292, 1395, 1455, 1350, 1050, 1241, 1088
  };
  float[] connecticut= {
    343, 343, 325, 325, 300, 325, 306, 306, 306, 325, 332, 324, 288, 364, 316, 405, 293, 277, 357, 342, 440, 270, 265, 331, 261, 314, 359, 312, 308, 299, 368, 301, 281, 294, 332, 282, 312, 282, 293, 190, 258, 253, 308, 246, 344, 300, 247, 360, 332, 273
  };
  float[] delaware= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 114, 149, 187, 161, 141, 149, 195, 222, 256, 230, 348, 320, 372, 330, 245, 385, 350, 270, 380, 323, 189, 363, 330, 256, 320, 383, 420
  };
  float[] florida= {
    2903, 2851, 3365, 3967, 3169, 3666, 4035, 4698, 3766, 4493, 4284, 4200, 4901, 5266, 5107, 4864, 5881, 5061, 5032, 4951, 4810, 4627, 4512, 4898, 4621, 4590, 4408, 4680, 5151, 5219, 6240, 4630, 4781, 4980, 5369, 4862, 5616, 5978, 5844, 5292, 5610, 5306, 5712, 5612, 5999, 5376, 4866, 6630, 6720, 6681
  };
  float[] georgia= {
    67, 84, 62, 70, 60, 58, 38, 45, 48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1170, 780, 1920, 2660, 2040, 2340, 2700, 3780, 3360, 3250, 3125, 2800, 3645, 3625, 3410, 3125, 3910, 3250
  };
  float[] hawaii= {
    11, 10, 4, 8, 8, 5, 13, 12, 12, 0, 0, 0, 0, 9.85, 13.91, 7.13, 7.9, 16.2, 15.9, 15.1, 9.5, 10.5, 5.6, 8.8, 13, 10.6, 10.4, 14.8, 6.6, 10.2, 24, 25, 15, 12, 10, 13, 14, 13, 11, 17, 24, 19, 24, 25, 18, 17, 18, 24, 22, 0
  };
  float[] illinois= {
    432, 468, 495, 511, 483, 448, 416, 448, 450, 378, 392, 378, 408, 375, 329, 385, 350, 344, 328, 348, 277, 300, 304, 315, 331, 312, 323, 344, 336, 439, 651, 746, 698, 491, 736, 559, 745, 705, 530, 531, 532, 559, 560, 414, 509, 484, 462, 726, 694, 582
  };
  float[] indiana= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 483, 524, 469, 442, 462, 460, 414, 415, 420, 468, 337, 372, 486, 328, 322, 459, 378, 421
  };
  float[] kansas= {
    133, 112, 78, 66, 66, 84, 66, 60, 72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] kentucky= {
    66, 55, 55, 60, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] massachusetts= {
    602, 616, 609, 559, 540, 533, 567, 546, 546, 563, 585, 640, 533, 624, 508, 697, 590, 468, 634, 647, 722, 748, 678, 800, 713, 743, 790, 639, 648, 646, 533, 544, 480, 432, 525, 429, 490, 497, 416, 420, 354, 377, 399, 420, 522, 456, 357, 416, 416, 306
  };
  float[] maryland= {
    94, 110, 66, 70, 57, 95, 40, 74, 68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 511, 365, 342, 533, 594, 470, 423, 300, 527, 584, 572, 497, 560, 749, 728, 666, 633, 648, 739, 556, 916, 525, 269, 315, 353, 260, 216, 328, 261
  };
  float[] maine= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 150, 150, 138, 138, 156, 132, 127, 138, 116, 110, 110, 120, 120, 130, 124, 152, 108, 90
  };
  float[] michigan= {
    781, 988, 878, 750, 767, 784, 749, 750, 893, 902, 1016, 876, 854, 781, 617, 728, 701, 775, 702, 667, 771, 732, 858, 896, 800, 780, 702, 713, 630, 885, 875, 934, 920, 863, 1020, 920, 893, 978, 750, 742, 742, 540, 800, 855, 713, 800, 913, 740, 723, 1001
  };
  float[] missouri= {
    99, 104, 99, 124, 117, 165, 137, 180, 189, 272, 281, 330, 264, 24, 115, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] northcarolina= {
    299, 275, 250, 229, 214, 299, 200, 308, 376, 338, 297, 364, 367, 380, 365, 286, 351, 306, 276, 255, 258, 312, 343, 288, 306, 358, 275, 427, 378, 397, 390, 354, 348, 319, 342, 314, 630, 715, 594, 560, 810, 861, 729, 820, 675, 644, 760, 620, 650, 693
  };
  float[] newhampshire= {
    112, 128, 135, 144, 128, 136, 136, 128, 153, 135, 144, 143, 124, 147, 137, 154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 137, 126, 143, 137, 158, 114, 108, 108, 108, 99, 85, 133, 126, 128, 90, 102, 128, 77
  };
  float[] newjersey= {
    945, 1012, 1050, 1015, 910, 1120, 800, 855, 848, 863, 896, 777, 715, 756, 774, 763, 777, 777, 798, 770, 767, 897, 925, 840, 1000, 1088, 976, 904, 620, 533, 741, 756, 810, 836, 765, 680, 714, 633, 689, 440, 945, 890, 791, 507, 525, 568, 770, 675, 533, 781
  };
  float[] newyork= {
    1200, 1100, 975, 1018, 1056, 1128, 990, 1128, 1128, 1140, 1188, 1170, 1040, 1427, 1716, 1443, 1372, 1517, 1323, 1411, 1763, 1740, 1872, 1923, 2037, 1903, 1754, 2094, 1736, 1984, 2120, 1988, 1651, 1955, 2570, 2593, 2033, 1993, 2628, 3202, 2613, 3841, 3278, 4094, 2800, 2679, 3216, 2700, 2863, 2150
  };
  float[] ohio= {
    1112, 1168, 1120, 1028, 1040, 1148, 813, 864, 1000, 975, 878, 897, 725, 975, 910, 1148, 910, 1088, 1036, 1125, 1085, 975, 975, 1050, 1125, 1186, 1263, 1280, 578, 1131, 1232, 1073, 1005, 1350, 1324, 1185, 1205, 1051, 1078, 1133, 1302, 1309, 1253, 1474, 1285, 1385, 1504, 1680, 1125, 1357
  };
  float[] oklahoma= {
    84, 135, 96, 132, 110, 110, 42, 64, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] oregon= {
    84, 98, 91, 91, 105, 104, 119, 99, 100, 114, 117, 133, 135, 118, 119, 142, 145, 171, 145, 198, 170, 153, 209, 170, 247, 242, 276, 276, 276, 276, 253, 286, 276, 253, 264, 294, 360, 390, 665, 1088, 941, 867, 918, 974, 423, 528, 549, 515, 495, 343
  };
  float[] pennsylvania= {
    825, 800, 775, 690, 675, 675, 560, 688, 660, 693, 678, 654, 545, 655, 660, 907, 918, 888, 784, 750, 773, 869, 869, 673, 1161, 1051, 797, 853, 864, 1454, 892, 659, 1106, 955, 1122, 808, 1105, 880, 1026, 695, 964, 701, 696, 1166, 1392, 1080, 1122, 924, 1237, 979
  };
  float[] rhodeisland= {
    60, 58, 66, 70, 70, 70, 70, 70, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 94, 77, 63, 75, 77, 76, 41, 50, 70, 64, 89, 99, 70, 48, 54, 68, 45
  };
  float[] southcarolina= {
    70, 58, 65, 60, 65, 68, 70, 84, 98, 0, 0, 0, 0, 56, 62, 70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] texas= {
    376, 470, 456, 407, 352, 334, 292, 270, 180, 193, 176, 196, 235, 160, 126, 111, 132, 202, 180, 138, 195, 224, 208, 225, 192, 198, 190, 200, 150, 125, 144, 150, 175, 175, 144, 170, 112, 250, 432, 450, 387, 390, 240, 261, 152, 119, 97, 185, 161, 156
  };
  float[] virginia= {
    160, 210, 188, 148, 176, 208, 156, 202, 205, 180, 187, 183, 156, 175, 162, 129, 148, 162, 230, 250, 216, 249, 288, 189, 340, 315, 192, 120, 184, 242, 138, 162, 149, 125, 102, 75, 84, 84, 111, 71, 102, 281, 104, 198, 375, 205, 322, 299, 125, 102
  };
  float[] vermont= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 91, 84, 77, 65, 91, 98, 72, 55, 41, 50, 48, 88, 55, 77, 50, 72, 50, 45
  };
  float[] washington= {
    150, 142, 160, 184, 168, 184, 200, 162, 180, 221, 184, 196, 204, 150, 148, 145, 185, 252, 224, 243, 224, 210, 232, 221, 294, 363, 384, 416, 416, 300, 231, 300, 364, 420, 392, 435, 390, 336, 286, 240, 300, 276, 338, 420, 392, 570, 640, 1403, 1665, 2162
  };
  float[] wisconsin= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 420, 569, 646, 563, 703, 679, 548, 600, 491, 629, 442, 600, 630, 570, 544, 602
  };
  float[] alaska= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] idaho= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] iowa= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] louisiana= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] minnesota= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] nebraska= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] nevada= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] newmexico= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] northdakota= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] southdakota= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] tennessee= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] utah= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] westvirginia= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] wyoming= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] montana= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };
  float[] mississippi= {
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
  };

  allStates[0]=new myState(alabama, "Alabama");
  allStates[1]=new myState(alaska, "Alaska");
  allStates[2]=new myState(arizona, "Arizona");
  allStates[3]=new myState(arkansas, "Arkansas");
  allStates[4]=new myState(california, "California");
  allStates[5]=new myState(colorado, "Colorado");
  allStates[6]=new myState(connecticut, "Connecticut");
  allStates[7]=new myState(delaware, "Delaware");
  allStates[8]=new myState(florida, "Florida");
  allStates[9]=new myState(georgia, "Georgia");
  allStates[10]=new myState(hawaii, "Hawaii");
  allStates[11]=new myState(idaho, "Idaho");
  allStates[12]=new myState(illinois, "Illinois");
  allStates[13]=new myState(indiana, "Indiana");
  allStates[14]=new myState(iowa, "Iowa");
  allStates[15]=new myState(kansas, "Kansas");
  allStates[16]=new myState(kentucky, "Kentucky");
  allStates[17]=new myState(louisiana, "Louisiana");
  allStates[18]=new myState(maine, "Maine");
  allStates[19]=new myState(maryland, "Maryland");
  allStates[20]=new myState(massachusetts, "Massachusetts");
  allStates[21]=new myState(michigan, "Michigan");
  allStates[22]=new myState(minnesota, "Minnesota");
  allStates[23]=new myState(mississippi, "Mississippi");
  allStates[24]=new myState(missouri, "Missouri");
  allStates[25]=new myState(montana, "Montana");
  allStates[26]=new myState(nebraska, "Nebraska");
  allStates[27]=new myState(nevada, "Nevada");
  allStates[28]=new myState(newhampshire, "NewHampshire");
  allStates[29]=new myState(newjersey, "NewJersey");
  allStates[30]=new myState(newmexico, "NewMexico");
  allStates[31]=new myState(newyork, "NewYork");
  allStates[32]=new myState(northcarolina, "NorthCarolina");
  allStates[33]=new myState(northdakota, "NorthDakota");
  allStates[34]=new myState(ohio, "Ohio");
  allStates[35]=new myState(oklahoma, "Oklahoma");
  allStates[36]=new myState(oregon, "Oregon");
  allStates[37]=new myState(pennsylvania, "Pennsylvania");
  allStates[38]=new myState(rhodeisland, "RhodeIsland");
  allStates[39]=new myState(southcarolina, "SouthCarolina");
  allStates[40]=new myState(southdakota, "SouthDakota");
  allStates[41]=new myState(tennessee, "Tennessee");
  allStates[42]=new myState(texas, "Texas");
  allStates[43]=new myState(utah, "Utah");
  allStates[44]=new myState(vermont, "Vermont");
  allStates[45]=new myState(virginia, "Virginia");
  allStates[46]=new myState(washington, "Washington");
  allStates[47]=new myState(westvirginia, "WestVirginia");
  allStates[48]=new myState(wisconsin, "Wisconsin");
  allStates[49]=new myState(wyoming, "Wyoming");

  for (int i=0;i<allStates.length;i++) {
    float value=allStates[i].getData()[year];
    if (value>maxValue) {
      maxValue=value;
    }
  }

  maxValue+=100;

  map.loadPixels();
  mapCopy.loadPixels();
  colorMode(HSB, 100, maxValue, 100);
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      int loc = x + y*map.width;
      color c=map.pixels[loc];
      boolean foundColor=false;
      for (int i=0;i<stateColors.length;i++) {
        if (c==(stateColors[i])) {
          foundColor=true;
        }
      }
      if (!foundColor) {
        if (c!=color(0, 0, 0) && c!=color(255, 255, 255)) {
          mapCopy.pixels[loc]=color(255);
        }
      }
    }
  }
  map.updatePixels();
  mapCopy.updatePixels();

  scroll = new HScrollbar(width/4, height/15, width/2, 20, 1);
}

void draw() {
  maxValue=0;
  boolean change=false;
  for (int i=0;i<allStates.length;i++) {
    float value=allStates[i].getData()[year];
    if (value>maxValue) {
      maxValue=value;
      change=true;
    }
  }

  background(0, 0, 255);

  map.loadPixels();
  mapCopy.loadPixels();
  colorMode(HSB, 100, maxValue, 100);
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      int loc = x + y*map.width;
      color c=map.pixels[loc];
      for (int i=0;i<stateColors.length;i++) {
        if (c==(stateColors[i])) {
          float amount=allStates[i].getData()[year];
          color newColor = color(33, amount, 80);
          mapCopy.pixels[loc]=newColor;
        }
      }
    }
  }

  map.updatePixels();
  mapCopy.updatePixels();
  image(mapCopy, 0, 50);

  colorMode(RGB, 255, 255, 255);
  scroll.update();
  //129 to 368
  year=(int)(((int)(scroll.getPos())-129)*(49.0/239));
  scroll.display();

  textFont (createFont ((PFont.list())[12], 24));
  //  println(PFont.list());
  fill(0);
  textAlign(CENTER);
  text("Year: "+(1960+year), width/2, height/6, 0);
  textFont (createFont ((PFont.list())[13], 32));
  text("Corn Production",2*width/3,19*height/20,0);
}

class myState {
  float[] amount;
  //1960-2009
  String name;

  public myState(float[] data, String n) {
    amount=data;
    name=n;
  }

  float[] getData() {
    return amount;
  }

  String toString() {
    return name;
  }
}

class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() {
    if (overEvent()) {
      over = true;
    } 
    else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
      mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0);
    } 
    else {
      fill(0);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}


