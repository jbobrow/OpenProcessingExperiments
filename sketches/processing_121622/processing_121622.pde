
// Project 1, 04-15-13
// Xinran Lu, xinranl@andrew.cmu.edu
// Copyright Xinran Lu April 2013 Pittsburgh PA 15232

/*Visualizing the data of which spots in the grad studio at the School of Design are occupied through out the day. The data came 
from one semester of observation and documenting occupied spots every two hours a day. I imported the data from the xml file. 
For finding out the fixed coordinates of the spots on the map I used the "program that can write a program" example to generate it.
Each dot represent one or more people occupying the spots. How frequent a dot glows and the hue of its color is determined by 
how many dots are there in the studio that time in total to create a sense of busyness.*/

ArrayList<Orb> orbs = new ArrayList<Orb>();
import processing.opengl.*;
import javax.media.opengl.*;

PGraphicsOpenGL pgl;
GL gl;
PImage img;
int Total;
PImage bg;
XML xml;
 
int lastMillis = 0;
//int interval = 800;
int[] colors = { 0, 90, 180, 270 };
int count = 0;

void setup()
{
  size(1000, 600, OPENGL);
  img = loadImage("glow_orb_solid copy.png");
  bg = loadImage("floorplan copy.png");
  xml = loadXML("studio new.xml");
  
  pgl = (PGraphicsOpenGL)g;
  gl = pgl.beginPGL().gl.getGL2();
  
  int pickColor = colors[int(random(colors.length))];

  XML[] children = xml.getChildren("row");
  for(int i = 0; i < children.length; i++ )
  {
    String Date = children[i].getString("Date");
    String Day = children[i].getString("Day");
    String Time = children[i].getString("Time");
    int Total = Integer.parseInt(children[i].getString("Total")); 
    //print(Total);
    String[] DotsA = new String [21];
    DotsA[0] = children[i].getString("A0");
    DotsA[1] = children[i].getString("A1");
    DotsA[2] = children[i].getString("A2");
    DotsA[3] = children[i].getString("A3");
    DotsA[4] = children[i].getString("A4");
    DotsA[5] = children[i].getString("A5");
    DotsA[6] = children[i].getString("A6");
    DotsA[7] = children[i].getString("A7");
    DotsA[8] = children[i].getString("A8");
    DotsA[9] = children[i].getString("A9");
    DotsA[10] = children[i].getString("A10");
    DotsA[11] = children[i].getString("A11");
    DotsA[12] = children[i].getString("A12");
    DotsA[13] = children[i].getString("A13");
    DotsA[14] = children[i].getString("A14");
    DotsA[15] = children[i].getString("A15");
    DotsA[16] = children[i].getString("A16");
    DotsA[17] = children[i].getString("A17");
    DotsA[18] = children[i].getString("A18");
    DotsA[19] = children[i].getString("A19");
    DotsA[20] = children[i].getString("A20");
    
    String[] DotsB = new String [21];
    DotsB[0] = children[i].getString("B0");
    DotsB[1] = children[i].getString("B1");
    DotsB[2] = children[i].getString("B2");
    DotsB[3] = children[i].getString("B3");
    DotsB[4] = children[i].getString("B4");
    DotsB[5] = children[i].getString("B5");
    DotsB[6] = children[i].getString("B6");
    DotsB[7] = children[i].getString("B7");
    DotsB[8] = children[i].getString("B8");
    DotsB[9] = children[i].getString("B9");
    DotsB[10] = children[i].getString("B10");
    DotsB[11] = children[i].getString("B11");
    DotsB[12] = children[i].getString("B12");
    DotsB[13] = children[i].getString("B13");
    DotsB[14] = children[i].getString("B14");
    DotsB[15] = children[i].getString("B15");
    DotsB[16] = children[i].getString("B16");
    DotsB[17] = children[i].getString("B17");
    DotsB[18] = children[i].getString("B18");
    DotsB[19] = children[i].getString("B19");
    DotsB[20] = children[i].getString("B20");
  
    String[] DotsC = new String[7];
    DotsC[0] = children[i].getString("C0");
    DotsC[1] = children[i].getString("C1");
    DotsC[2] = children[i].getString("C2");
    DotsC[3] = children[i].getString("C3");
    DotsC[4] = children[i].getString("C4");
    DotsC[5] = children[i].getString("C5");
    DotsC[6] = children[i].getString("C6");
  
    String[] DotsD = new String[6];
    DotsD[0] = children[i].getString("D0");
    DotsD[1] = children[i].getString("D1");
    DotsD[2] = children[i].getString("D2");
    DotsD[3] = children[i].getString("D3");
    DotsD[4] = children[i].getString("D4");
    DotsD[5] = children[i].getString("D5");
  
    String[] DotsE = new String[3];
    DotsE[0] = children[i].getString("E0");
    DotsE[1] = children[i].getString("E1");
    DotsE[2] = children[i].getString("E2");
  
    String[] DotsF = new String[9];
    DotsF[0] = children[i].getString("F0");
    DotsF[1] = children[i].getString("F1");
    DotsF[2] = children[i].getString("F2");
    DotsF[3] = children[i].getString("F3");
    DotsF[4] = children[i].getString("F4");
    DotsF[5] = children[i].getString("F5");
    DotsF[6] = children[i].getString("F6");
    DotsF[7] = children[i].getString("F7"); 
    DotsF[8] = children[i].getString("F8");
  
    String[] DotsG = new String[16];
    DotsG[0] = children[i].getString("G0");
    DotsG[1] = children[i].getString("G1");
    DotsG[2] = children[i].getString("G2");
    DotsG[3] = children[i].getString("G3");
    DotsG[4] = children[i].getString("G4");
    DotsG[5] = children[i].getString("G5");
    DotsG[6] = children[i].getString("G6");
    DotsG[7] = children[i].getString("G7");
    DotsG[8] = children[i].getString("G8");
    DotsG[9] = children[i].getString("G9");
    DotsG[10] = children[i].getString("G10");
    DotsG[11] = children[i].getString("G11");
    DotsG[12] = children[i].getString("G12");
    DotsG[13] = children[i].getString("G13");
    DotsG[14] = children[i].getString("G14");
    DotsG[15] = children[i].getString("G15");
  
    String[] DotsH = new String[1];
    DotsH[0] = children[i].getString("H");
    String[] DotsI = new String[1];
    DotsI[0] = children[i].getString("I");
    String[] DotsJ = new String[1];
    DotsJ[0] = children[i].getString("J");
    String[] DotsP = new String[1];
    DotsP[0] = children[i].getString("P");
    
    String[] DotsW = new String[10];
    DotsW[0] = children[i].getString("W0");
    DotsW[1] = children[i].getString("W1");
    DotsW[2] = children[i].getString("W2");
    DotsW[3] = children[i].getString("W3");
    DotsW[4] = children[i].getString("W4");
    DotsW[5] = children[i].getString("W5");
    DotsW[6] = children[i].getString("W6");
    DotsW[7] = children[i].getString("W7");
    DotsW[8] = children[i].getString("W8");
    DotsW[9] = children[i].getString("W9");
      
      orbs.add(new Orb(Date, Day, Time, DotsA, DotsB, DotsC,  DotsD,  DotsE,  DotsF,  DotsG,  DotsH,  DotsI,  DotsJ,  DotsP,  DotsW, img, Total)); 
}
  
  frameRate(30);
  smooth();
}

void draw()
{
  background(bg);
  pgl.beginPGL();
//  gl.glDisable(GL.GL_DEPTH_TEST);
//  gl.glEnable(GL.GL_BLEND);
//  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
  pgl.endPGL();
  
  if (millis() > lastMillis + 2000) 
  {
    lastMillis = millis();
    count++;
  }
  
  for (int n = 3; n < 118; n++)
  {
    if(count == n)
    {
      orbs.get(n-3).display();
    }
  }
}
class Orb
{
  String date;
  String day;
  String time;
  String [] dotsA;
  String [] dotsB; 
  String [] dotsC;
  String [] dotsD;
  String [] dotsE;
  String [] dotsF;
  String [] dotsG;
  String [] dotsH;
  String [] dotsI;
  String [] dotsJ;
  String [] dotsP;
  String [] dotsW;
  
  int [] positionxA = {248, 302, 302, 302, 268, 268, 268, 228, 228, 228, 228, 193, 193, 193, 193, 205, 244, 280, 280, 242, 206};
  int [] positionxB = {245, 193, 193, 193, 228, 228, 228, 267, 267, 267, 267, 302, 302, 302, 302, 207, 244, 280, 280, 241, 204}; 
  int [] positionxC = {391, 393, 409, 389, 401, 429, 403};
  int [] positionxD = {458, 477, 479, 479, 490, 460};
  int [] positionxE = {582, 551, 551};
  int [] positionxF = {716, 656, 679, 659, 677, 777, 756, 774, 752};
  int [] positionxG = {490, 469, 451, 434, 432, 432, 434, 434, 460, 533, 552, 509, 615, 611, 597, 595};
  int [] positionxH = {562};
  int [] positionxI = {356};
  int [] positionxJ = {427};
  int [] positionxP = {381};
  int [] positionxW = {349, 351, 471, 668, 771, 813, 811, 701, 633, 632};
  
  int [] positionyA = {389, 484, 448, 410, 409, 447, 485, 523, 484, 446, 410, 410, 448, 485, 521, 361, 361, 361, 326, 326, 326};
  int [] positionyB = {208, 100, 135, 174, 174, 136, 98, 81, 117, 153, 192, 191, 155, 116, 81, 240, 240, 240, 274, 276, 274}; 
  int [] positionyC = {454, 346, 373, 405, 419, 376, 329};
  int [] positionyD = {350, 325, 408, 444, 473, 477};
  int [] positionyE = {394, 359, 431};
  int [] positionyF = {384, 324, 346, 445, 422, 323, 346, 448, 422};
  int [] positionyG = {186, 91, 71, 50, 77, 115, 154, 181, 158, 155, 69, 103, 65, 97, 141, 173};
  int [] positionyH = {246};
  int [] positionyI = {185};
  int [] positionyJ = {250};
  int [] positionyP = {254};
  int [] positionyW = {330, 393, 485, 286, 288, 346, 442, 482, 74,153};
  
  PImage img;
  int Total;
  color c = color(0, 0, 0);
  boolean grow = true;
  float angle = 0.0;
  float speed = 0.01;
  int opacity = 0;
  int scalar;
   //int[] colors = { 0, 90, 180, 270 };
   //int pickColor = colors[int(random(colors.length))];
  
  Orb(String Date, String Day, String Time, String[]  DotsA, String[]  DotsB, String [] DotsC, 
  String [] DotsD,String [] DotsE, String [] DotsF, String [] DotsG, String [] DotsH, String [] DotsI, 
  String [] DotsJ, String [] DotsP, String [] DotsW, PImage i, int total)
  {
    date = Date;
    day = Day;
    time = Time;
    dotsA = DotsA;
    dotsB = DotsB;
    dotsC = DotsC;
    dotsD = DotsD;
    dotsE = DotsE;
    dotsF = DotsF;
    dotsG = DotsG;
    dotsH = DotsH;
    dotsI = DotsI;
    dotsJ = DotsJ;
    dotsP = DotsP;
    dotsW = DotsW;
    imageMode(CENTER);
    img = i;
    Total = total;
    scalar = int(random(40, img.width));
    //c = color(pickColor + random(210), random(190) + 30, random(190) + 30);
    //int t = Integer.parseInt(total);
    colorMode(HSB);
    c = color((300-Total*10), random(100, 150), random(200, 300));
    println(Total);
  }

  
  void display()
  { 
    Dots_display(dotsA, positionxA, positionyA);
    Dots_display(dotsB, positionxB, positionyB);
    Dots_display(dotsC, positionxC, positionyC);
    Dots_display(dotsD, positionxD, positionyD);
    Dots_display(dotsE, positionxE, positionyE);
    Dots_display(dotsF, positionxF, positionyF);
    Dots_display(dotsG, positionxG, positionyG);
    Dots_display(dotsH, positionxH, positionyH);
    Dots_display(dotsI, positionxI, positionyI);
    Dots_display(dotsJ, positionxJ, positionyJ);
    Dots_display(dotsP, positionxP, positionyP);
    Dots_display(dotsW, positionxW, positionyW);
    
    textSize(12);
    text(date, width-140, 20);
    text(day, width-80, 20);
    text(time, width-80, 40);
    fill(150);
  }
  
  void Dots_display( String[] dots_i, int[] positionx_i, int[] positiony_i)
  {
    for(int i = 0; i < dots_i.length; i ++)
    {
      if(dots_i[i] != "")
      {
        glowingDots(positionx_i[i], positiony_i[i]);
      }
    }
  }
  
  void glowingDots(float ex, float ey)
  {
    scalar += 0.9;//int(random(70, img.width));
    angle += speed;
    float sinval = sin(angle) * 5;
  
    while (opacity < 1000) 
    {
      opacity += 50;      
    }
    
    tint(c, opacity);
    image(img, ex, ey, sinval + scalar, sinval + scalar);
  }


}


