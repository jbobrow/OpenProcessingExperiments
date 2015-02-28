
/**
 * 
 *  Spring
 *  By Prita Priscilla Hasjim
 *  Project for ICAM 101 at UCSD
 *
 **/
 
PImage tree;    // Tree Outline Image
PImage leaf;    // Leaf Image
PImage vblue;
PImage vcoral;
PImage vgreen;
PImage vorange;
PImage vpink;
PImage vpurple;
PImage vyellow;

int r;          // Random int generated in setup() to determine what color leaf is going to be
int[] xCoords = new int[82];       // Array of ints containing the leaves' various x-coordinates
int[] yCoords = new int[82];       // Array of ints containing the leaves' various y-coordinates
int[] angles = new int[82];        // Array of ints containing how to turn
PImage[] leaves = new PImage[82];  // Array containing all of the leaves
 
// Variables used to define the different types of leaves
public static final int BLUE_LEAF = 1;
public static final int CORAL_LEAF = 2;
public static final int GREEN_LEAF = 3;
public static final int ORANGE_LEAF = 4;
public static final int PINK_LEAF = 5;
public static final int PURPLE_LEAF = 6;
public static final int YELLOW_LEAF = 7;
 
void setup() {
  size(838,800);
  noStroke();
  smooth();
  background(#ffffff);
 
   // Draws the tree image to the screen at coordinate (0,0)
   tree = loadImage("tree.gif");
   image(tree,0,0);
   
   //Load leaf images into variables
   vblue = loadImage("blue.gif");
   vcoral = loadImage("coral.gif");
   vgreen = loadImage("green.gif");
   vorange = loadImage("orange.gif");
   vpink = loadImage("pink.gif");
   vpurple = loadImage("purple.gif");
   vyellow = loadImage("yellow.gif");

   
  setCoords();
  setAngles();
   
  // If you would like to start with leaves on the tree, decomment the
  // section below
   
  // Draws all of the different leaves in the appropriate coordinates
  /*for(int i = 0; i < 82; i++){
    r = (int) random(1,8);
     
    if(r == 1) leaf = loadImage("imgs/blue.gif");
    else if(r == 2) leaf = loadImage("imgs/coral.gif");
    else if(r == 3) leaf = loadImage("imgs/green.gif");
    else if(r == 4) leaf = loadImage("imgs/orange.gif");
    else if(r == 5) leaf = loadImage("imgs/pink.gif");
    else if(r == 6) leaf = loadImage("imgs/purple.gif");
    else if(r == 7) leaf = loadImage("imgs/yellow.gif");
     
    translate(xCoords[i], yCoords[i]);
    rotate(radians(-angles[i]));
    image(leaf, 0, 0);
    rotate(radians(angles[i]));
    translate(-xCoords[i], -yCoords[i]);
     
  }*/
}
 
void draw() {
    
  // Draws all of the different leaves in the appropriate coordinates
  for(int i = 0; i < 82; i++){
    r = (int) random(1,8);
     
    if(r == 1) leaf = vblue;
    else if(r == 2) leaf = vcoral;
    else if(r == 3) leaf = vgreen;
    else if(r == 4) leaf = vorange;
    else if(r == 5) leaf = vpink;
    else if(r == 6) leaf = vpurple;
    else if(r == 7) leaf = vyellow;
     
    if ( ((mouseX - xCoords[i]) * (mouseX - xCoords[i]) +        // Good values:
      (mouseY - yCoords[i]) * (mouseY - yCoords[i])) < 8096) {  // 32354, 65536, 8096
         
      translate(xCoords[i], yCoords[i]);
      rotate(radians(-angles[i]));
      image(leaf, 0, 0);
      rotate(radians(angles[i]));
      translate(-xCoords[i], -yCoords[i]);
    }
 
  }
 
}
 
 
/**
 * setAngles() sets the angles for the different leaves in the int array.
 **/
void setAngles(){
   
  angles[0] = 110;
  angles[1] = 90;
  angles[2] = 95;
  angles[3] = 110;
  angles[4] = 50;
  angles[5] = 30;
  angles[6] = 110;
  angles[7] = 35;
  angles[8] = 30;
  angles[9] = 30;
  angles[10] = 110;
  angles[11] = 10;
  angles[12] = 50;
  angles[13] = 50;
  angles[14] = 5;
  angles[15] = 15;
  angles[16] = 30;
  angles[17] = 40;
  angles[18] = -10;
  angles[19] = -5;
  angles[20] = -5;
  angles[21] = 0;
  angles[22] = 30;
  angles[23] = 0;
  angles[24] = -5;
  angles[25] = 70;
  angles[26] = 75;
  angles[27] = 30;
  angles[28] = 5;
  angles[29] = 0;
  angles[30] = 5;
  angles[31] = 10;
  angles[32] = 10;
  angles[33] = -50;
  angles[34] = -50;
  angles[35] = 25;
  angles[36] = -50;
  angles[37] = 0;
  angles[39] = 20;
  angles[40] = 10;
  angles[41] = 0;
  angles[42] = -5;
  angles[43] = -30;
  angles[44] = -45;
  angles[45] = -50;
  angles[46] = -90;
  angles[47] = -10;
  angles[48] = 10;
  angles[49] = 5;
  angles[50] = 10;
  angles[51] = 0;
  angles[52] = 0;
  angles[53] = -50;
  angles[54] = -60;
  angles[55] = -50;
  angles[56] = -60;
  angles[57] = -90;
  angles[58] = -50;
  angles[59] = -50;
  angles[60] = -80;
  angles[61] = 90;
  angles[62] = -75;
  angles[63] = 5;
  angles[64] = -45;
  angles[65] = -60;
  angles[66] = -55;
  angles[67] = -40;
  angles[68] = -50;
  angles[69] = 220;
  angles[70] = -40;
  angles[71] = -70;
  angles[72] = -20;
  angles[73] = -80;
  angles[74] = 220;
  angles[75] = 250;
  angles[76] = -170;
  angles[77] = -80;
  angles[78] = -50;
  angles[79] = -175;
  angles[80] = -170;
  angles[81] = -90;
   
}
 
 
/**
 * setCoords() sets the x and y coordinates in their appropriate int arrays.
 **/
void setCoords(){
 
  xCoords[0] = 40; yCoords[0] = 440;
  xCoords[1] = 50; yCoords[1] = 390;
  xCoords[2] = 5; yCoords[2] = 360;
  xCoords[3] = 80; yCoords[3] = 475;
  xCoords[4] = 100; yCoords[4] = 400;
  xCoords[5] = 26; yCoords[5] = 288;
  xCoords[6] = 147; yCoords[6] = 480;
  xCoords[7] = 155; yCoords[7] = 390;
  xCoords[8] = 80; yCoords[8] = 290;
  xCoords[9] = 35; yCoords[9] = 230;
  xCoords[10] = 205; yCoords[10] = 475;
  xCoords[11] = 160; yCoords[11] = 290;
  xCoords[12] = 125; yCoords[12] = 260;
  xCoords[13] = 83; yCoords[13] = 220;
  xCoords[14] = 200; yCoords[14] = 290;
  xCoords[15] = 80; yCoords[15] = 155;
  xCoords[16] = 300; yCoords[16] = 415;
  xCoords[17] = 270; yCoords[17] = 380;
  xCoords[18] = 280; yCoords[18] = 295;
  xCoords[19] = 240; yCoords[19] = 250;
  xCoords[20] = 200; yCoords[20] = 176;
  xCoords[21] = 155; yCoords[21] = 155;
  xCoords[22] = 370; yCoords[22] = 395;
  xCoords[23] = 335; yCoords[23] = 315;
  xCoords[24] = 315; yCoords[24] = 270;
  xCoords[25] = 255; yCoords[25] = 255;
  xCoords[26] = 230; yCoords[26] = 220;
  xCoords[27] = 155; yCoords[27] = 130;
  xCoords[28] = 390; yCoords[28] = 320;
  xCoords[29] = 280; yCoords[29] = 125;
  xCoords[30] = 235; yCoords[30] = 100;
  xCoords[31] = 170; yCoords[31] = 70;
  xCoords[32] = 360; yCoords[32] = 230;
  xCoords[33] = 385; yCoords[33] = 160;
  xCoords[34] = 370; yCoords[34] = 105;
  xCoords[35] = 230; yCoords[35] = 60;
  xCoords[36] = 355; yCoords[36] = 50;
  xCoords[37] = 285; yCoords[37] = 10;
  xCoords[38] = 400; yCoords[38] = 180;
  xCoords[39] = 390; yCoords[39] = 125;
  xCoords[40] = 370; yCoords[40] = 70;
  xCoords[41] = 395; yCoords[41] = 15;
  xCoords[42] = 460; yCoords[42] = 60;
  xCoords[43] = 460; yCoords[43] = 0;
  xCoords[44] = 465; yCoords[44] = 260;
  xCoords[45] = 475; yCoords[45] = 195;
  xCoords[46] = 540; yCoords[46] = 120;
  xCoords[47] = 520; yCoords[47] = 20;
  xCoords[48] = 445; yCoords[48] = 325;
  xCoords[49] = 470; yCoords[49] = 280;
  xCoords[50] = 485; yCoords[50] = 225;
  xCoords[51] = 480; yCoords[51] = 160;
  xCoords[52] = 550; yCoords[52] = 50;
  xCoords[53] = 565; yCoords[53] = 155;
  xCoords[54] = 625; yCoords[54] = 115;
  xCoords[55] = 630; yCoords[55] = 40;
  xCoords[56] = 580; yCoords[56] = 275;
  xCoords[57] = 625; yCoords[57] = 235;
  xCoords[58] = 620; yCoords[58] = 150;
  xCoords[59] = 675; yCoords[59] = 95;
  xCoords[60] = 535; yCoords[60] = 425;
  xCoords[61] = 505; yCoords[61] = 430;
  xCoords[62] = 600; yCoords[62] = 330;
  xCoords[63] = 610; yCoords[63] = 270;
  xCoords[64] = 680; yCoords[64] = 170;
  xCoords[65] = 630; yCoords[65] = 395;
  xCoords[66] = 700; yCoords[66] = 300;
  xCoords[67] = 700; yCoords[67] = 240;
  xCoords[68] = 740; yCoords[68] = 150;
  xCoords[69] = 630; yCoords[69] = 500;
  xCoords[70] = 680; yCoords[70] = 390;
  xCoords[71] = 760; yCoords[71] = 330;
  xCoords[72] = 745; yCoords[72] = 240;
  xCoords[73] = 785; yCoords[73] = 210;
  xCoords[74] = 680; yCoords[74] = 500;
  xCoords[75] = 730; yCoords[75] = 470;
  xCoords[76] = 730; yCoords[76] = 450;
  xCoords[77] = 815; yCoords[77] = 320;
  xCoords[78] = 815; yCoords[78] = 260;
  xCoords[79] = 780; yCoords[79] = 470;
  xCoords[80] = 835; yCoords[80] = 475;
  xCoords[81] = 835; yCoords[81] = 370;
 
}


