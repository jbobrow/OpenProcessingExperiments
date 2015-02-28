
/*
 * Projection Mapping Template
 * 
 * Using list of points to draw the faces 
 * and edges of an abstracted cityscape.
 *
 * Introduction to Digital Media
 * Carnegie Mellon University SoArch
 *
 * Edited by Rehan Butt
 * Updated 03.07.2013
 */

import ddf.minim.*;

Minim minim;
AudioPlayer song;

// create arrays to store our face locations
ArrayList<PVector> topFacePts   = new ArrayList<PVector>();
ArrayList<PVector> leftFacePts  = new ArrayList<PVector>();
ArrayList<PVector> rightFacePts = new ArrayList<PVector>();

ArrayList<PVector> topFaceIrrPts   = new ArrayList<PVector>();
ArrayList<PVector> leftFaceIrrPts  = new ArrayList<PVector>();
ArrayList<PVector> rightFaceIrrPts = new ArrayList<PVector>();

ArrayList<PVector> leftWallPts   = new ArrayList<PVector>();
ArrayList<PVector> rightWallPts  = new ArrayList<PVector>();
ArrayList<PVector> floorPts = new ArrayList<PVector>();

void setup() 
{
  size(1024, 768);  //Resolution of Casio XJ-A145 Projector

  // load in our faces from our text files
  String[] topFaces   = loadStrings("topFaces.txt");
  String[] leftFaces  = loadStrings("leftFaces.txt");
  String[] rightFaces = loadStrings("rightFaces.txt");
  String[] topFacesIrr   = loadStrings("topFacesIrregular.txt");
  String[] leftFacesIrr  = loadStrings("leftFacesIrregular.txt");
  String[] rightFacesIrr = loadStrings("rightFacesIrregular.txt");
  String[] leftWall  = loadStrings("leftWall.txt");
  String[] rightWall  = loadStrings("rightWall.txt");
  String[] floorPlane = loadStrings("floor.txt");

  // convert our text to points and store values
  float scalar = 1.0;
  topFacePts   = processTxtFile(topFaces, scalar);
  leftFacePts  = processTxtFile(leftFaces, scalar);
  rightFacePts = processTxtFile(rightFaces, scalar);
  topFaceIrrPts   = processTxtFile(topFacesIrr, scalar);
  leftFaceIrrPts  = processTxtFile(leftFacesIrr, scalar);
  rightFaceIrrPts = processTxtFile(rightFacesIrr, scalar);
  leftWallPts   = processTxtFile(leftWall, scalar);
  rightWallPts  = processTxtFile(rightWall, scalar);
  floorPts = processTxtFile(floorPlane, scalar);

  minim = new Minim(this);

  // this loads mysong.mp3 from the data folder
  song = minim.loadFile("MellowBrickRoad2.mp3");
  song.play();

  // default stroke settings that look ok

    smooth();
  strokeWeight(3);
  strokeCap(ROUND);
  strokeJoin(ROUND);
}

void draw() 
{
  if (millis() > 600000) stop();
  strokeWeight(4);
  stroke(0);
  background(0);

  
  
  //where true is written is a question if you want outlines or not (true and false can be put here)
  //the numbers after that are as follows (stroke weight, stroke colors in RGB format)
//  drawPlane(leftWallPts, 255,177,31,true,2,0,0,0);
//  drawPlane(rightWallPts, 232,33,35,true,2,0,0,0);
//  drawPlane(floorPts, 127,17,153,true,2,0,0,0);
  drawFaces(leftFacePts,leftFaceIrrPts, 0, 0, 0,0,40,0,12,false,4,255,255,255);
  drawFaces(rightFacePts,rightFaceIrrPts, 0, 0, 0,0,44,0,12,false,4,255,255,255); 
  drawFaces(topFacePts,topFaceIrrPts, 0, 0, 0,0,36,0,18,false,4,255,255,255);




//  if (millis() > 2000 && millis() < 24000) 
//  {
////    strokeWeight(0);
//    //Last four parameters are start and end for reg shapes and start and end points for irr
//    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 2000, 2000,0,4,0,8);
//            //min0-max36is all face regular face points, min0-max18 is all face IRREGULAR face points  (FOR TOP FACE)
//  }
//    if (millis() > 1500 && millis() < 2000) 
//  {
////    strokeWeight(0);
//    //Last four parameters are start and end for reg shapes and start and end points for irr
//    drawFade(topFacePts, topFaceIrrPts, 155, 155, 0, 1000, 1000,0,4,0,8);
//            //min0-max36is all face regular face points, min0-max18 is all face IRREGULAR face points  (FOR TOP FACE)
//  }

  
      if (millis() > 16000 && millis() < 52000) 
  {
//    strokeWeight(0);
    //Last four parameters are start and end for reg shapes and start and end points for irr
    drawFade(leftFacePts, leftFaceIrrPts, 0, 200, 0, 500, 16000,0,10,0,12);
            //min0-max40is all face regular face points, min0-max12 is all face IRREGULAR face points  (FOR LEFT FACE)
  }

    if (millis() > 52000 && millis() < 54000) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 2000, 52000,0,36,0,18);
  }

    if (millis() > 54000 && millis() < 56000) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 0, 2000, 54000,0,36,0,18);
  }
 
    if (millis() > 56000 && millis() < 58000) 
  {
//    strokeWeight(0);
    //Last four parameters are start and end for reg shapes and start and end points for irr
    drawFade(topFacePts, topFaceIrrPts, 45, 45, 0, 2000, 56000,0,36,0,18);
            //min0-max36is all face regular face points, min0-max18 is all face IRREGULAR face points  (FOR TOP FACE)
  }
      if (millis() > 58000 && millis() < 60000) 
  {
    drawFade(topFacePts, topFaceIrrPts, 20, 20, 0, 2000, 58000,0,36,0,18);
  }
    if (millis() > 60000 && millis() < 62000) 
  {
    drawFade(topFacePts, topFaceIrrPts, 5, 5, 0, 2000, 60000,0,36,0,18);
  }





////
////white stringpluck
////
      if (millis() > 28250 && millis() < 30500) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 28250,0,36,0,18);
  }
      if (millis() > 28275 && millis() < 29875) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 28275,0,32,0,12);
  }
      if (millis() > 30000 && millis() < 30150) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 30000,0,12,0,12);
  }  
///
      if (millis() > 30000 && millis() < 32250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 30000,0,36,0,18);
  }
      if (millis() > 30125 && millis() < 31625) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 30125,0,32,0,12);
  }
        if (millis() > 31800 && millis() < 31950) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 31800,0,12,0,12);
  } 
///
///
      if (millis() > 36250 && millis() < 38500) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 36250,0,36,0,18);
  }
      if (millis() > 36375 && millis() < 37875) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 36375,0,32,0,12);
  }
      if (millis() > 38000 && millis() < 38150) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 38000,0,12,0,12);
  } 
///
      if (millis() > 38200 && millis() < 40450) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 38200,0,36,0,18);
  }
      if (millis() > 38375 && millis() < 39825) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 38375,0,32,0,12);
  }
      if (millis() > 40000 && millis() < 40150) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 40000,0,12,0,12);
  } 
///
///
      if (millis() > 44000 && millis() < 46250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 44000,0,36,0,18);
  }
      if (millis() > 44125 && millis() < 45625) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 44125,0,32,0,12);
  }
      if (millis() > 45750 && millis() < 45900) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 45750,0,12,0,12);
  } 
///
      if (millis() > 46000 && millis() < 48250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 46000,0,36,0,18);
  }
      if (millis() > 46125 && millis() < 47625) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 46125,0,32,0,12);
  }
      if (millis() > 47750 && millis() < 47900) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 47750,0,12,0,12);
  } 
///
///
//      if (millis() > 52000 && millis() < 54250) 
//  {
//    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 52000,0,36,0,18);
//  }
//      if (millis() > 52125 && millis() < 53625) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 52125,0,32,0,12);
//  }
//      if (millis() > 53750 && millis() < 53900) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 53750,0,12,0,12);
//  } 
/////
//      if (millis() > 54000 && millis() < 56250) 
//  {
//    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 750, 54000,0,36,0,18);
//  }
//      if (millis() > 54125 && millis() < 55625) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 750, 54125,0,32,0,12);
//  }
//      if (millis() > 55750 && millis() < 55900) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 0, 150, 55750,0,12,0,12);
//  } 
///
///

////
//// yellow counterpoint
////
   if (millis() > 250 && millis() < 750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 250, 0,0,1,0,10);
  }
    if (millis() > 750 && millis() < 1250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 750,0,4,0,8);
  }
   if (millis() > 1550 && millis() < 2050) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 155, 155, 155, 250, 1550,0,9,0,6);
  }

//
   if (millis() > 2250 && millis() < 2750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 100, 100, 100, 250, 1750,0,1,0,10);
  }
    if (millis() > 2750 && millis() < 3250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 2750,0,4,0,8);
  }
   if (millis() > 3550 && millis() < 4050) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 75, 75, 75, 250, 3550,0,18,0,10);
  }

//
   if (millis() > 4250 && millis() < 4750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 110, 110, 100, 250, 4000,0,1,0,10);
  }
    if (millis() > 4750 && millis() < 5250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 4750,0,4,0,8);
  }
   if (millis() > 5350 && millis() < 6050) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 350, 5350,0,4,0,1);
  }
   if (millis() > 5500 && millis() < 6200) 
  {
    drawFade(leftFacePts, leftFaceIrrPts, 75, 75, 75, 350, 5500,0,4,0,1);
  }
  
//
   if (millis() > 6250 && millis() < 6750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 120, 120, 100, 250, 6000,0,1,0,10);
  }
    if (millis() > 6750 && millis() < 7250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 6750,0,4,0,8);
  }
   if (millis() > 7500 && millis() < 8000) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 255, 255, 255, 250, 7500,0,30,0,12);
  }
//
   if (millis() > 8250 && millis() < 8750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 130, 130, 100, 250, 8250,0,1,0,10);
  }
    if (millis() > 8750 && millis() < 9250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 8750,0,4,0,8);
  }
//
   if (millis() > 10250 && millis() < 10750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 140, 140, 100, 250, 10000,0,1,0,10);
  }
    if (millis() > 10750 && millis() < 11250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 10750,0,4,0,8);
  }
//
   if (millis() > 12250 && millis() < 12750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 150, 150, 90, 250, 12250,0,1,0,10);
  }
    if (millis() > 12750 && millis() < 13250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 12750,0,4,0,8);
  }
//
   if (millis() > 14250 && millis() < 14750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 170, 170, 80, 250, 14250,0,1,0,10);
  }
    if (millis() > 14750 && millis() < 15250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 14750,0,4,0,8);
  }
//
   if (millis() > 16250 && millis() < 16750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 190, 190, 70, 250, 16250,0,1,0,10);
  }
    if (millis() > 16750 && millis() < 17250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 16750,0,4,0,8);
  }
//
   if (millis() > 18250 && millis() < 18750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 210, 210, 70, 250, 18250,0,1,0,10);
  }
    if (millis() > 18750 && millis() < 19250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 18750,0,4,0,8);
  }
//
   if (millis() > 20250 && millis() < 20750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 225, 225, 50, 250, 20250,0,1,0,10);
  }
    if (millis() > 20750 && millis() < 21250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 20750,0,4,0,8);
  }
//
   if (millis() > 22250 && millis() < 22750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 22250,0,1,0,10);
  }
    if (millis() > 22750 && millis() < 23250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 22750,0,4,0,8);
  }
//
   if (millis() > 24250 && millis() < 24750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 225, 225, 50, 250, 24250,0,1,0,10);
  }
    if (millis() > 24750 && millis() < 25250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 24750,0,4,0,8);
  }
//
   if (millis() > 26250 && millis() < 26750) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 26250,0,1,0,10);
  }
    if (millis() > 26750 && millis() < 27250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 500, 26750,0,4,0,8);
  }

////
////
   
////
//// brass; blue
////
//
//     if (millis() > 1250 && millis() < 1750) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 5, 9, 50, 250, 1250,0,1,0,1);
//  }
//   if (millis() > 1750 && millis() < 2300) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 5, 9, 50, 600, 1750,0,12,0,12);
//  }
////
//   if (millis() > 3200 && millis() < 3850) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 15, 25, 127, 250, 3200,0,1,0,1);
//  }
//   if (millis() > 3850 && millis() < 4100) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 15, 25, 127, 250, 3850,0,26,0,12);
//  }
////
////
//   if (millis() > 5250 && millis() < 5750) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 25, 40, 200, 250, 5250,0,1,0,1);
//  }
//   if (millis() > 5750 && millis() < 6300) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 25, 40, 200, 550, 5750,0,26,0,12);
//  }
////
//   if (millis() > 7150 && millis() < 7800) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 25, 40, 200, 250, 7150,0,1,0,1);
//  }
//   if (millis() > 7800 && millis() < 8050) 
//  {
//    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 250, 7800,0,26,0,12);
//  }
///
///
   if (millis() > 9250 && millis() < 9750) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 9250,0,1,0,1);
  }
   if (millis() > 9750 && millis() < 10300) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 9750,0,26,0,12);
  }
//
   if (millis() > 11300 && millis() < 11850) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 11300,0,14,0,8);
  }
   if (millis() > 11850 && millis() < 12100) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 11850,0,30,0,12);
  }
//
//
   if (millis() > 13250 && millis() < 13750) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 13250,0,1,0,1);
  }
   if (millis() > 13750 && millis() < 14300) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 13750,0,26,0,12);
  }
//
   if (millis() > 15100 && millis() < 15850) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 15100,0,14,0,8);
  }
   if (millis() > 15850 && millis() < 16100) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 250, 15850,0,32,0,12);
  }
///
///
   if (millis() > 17250 && millis() < 17750) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 17250,0,1,0,1);
  }
   if (millis() > 17750 && millis() < 18300) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 17750,0,26,0,12);
  }
//
   if (millis() > 19200 && millis() < 19750) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 19200,0,14,0,8);
  }
   if (millis() > 19750 && millis() < 20000) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 19750,0,30,0,12);
  }
//
//
   if (millis() > 21250 && millis() < 21750) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 21250,0,1,0,1);
  }
   if (millis() > 21750 && millis() < 22300) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 21750,0,26,0,12);
  }
//
   if (millis() > 23200 && millis() < 23950) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 23200,0,14,0,8);
  }
   if (millis() > 23950 && millis() < 24200) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 250, 23950,0,32,0,12);
  }
//
//
   if (millis() > 25200 && millis() < 25700) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 25200,0,1,0,1);
  }
   if (millis() > 25700 && millis() < 26250) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 25700,0,26,0,12);
  }
//
   if (millis() > 27250 && millis() < 28000) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 27250,0,14,0,8);
  }
   if (millis() > 28000 && millis() < 28250) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 250, 28000,0,32,0,12);
  }

///
///

   if (millis() > 32500 && millis() < 33250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 32500,0,4,0,8);
  }
    if (millis() > 34250 && millis() < 34500) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 34250,0,4,0,8);
  }
    if (millis() > 34750 && millis() < 35250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 34750,0,4,0,8);
  }

///
///
   if (millis() > 33450 && millis() < 33950) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 33450,0,1,0,1);
  }
   if (millis() > 33950 && millis() < 34500) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 33950,0,26,0,12);
  }
//
   if (millis() > 35400 && millis() < 35950) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 35200,0,14,0,8);
  }
   if (millis() > 35950 && millis() < 36200) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 35750,0,30,0,12);
  }
///
///

   if (millis() > 40500 && millis() < 41250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 40500,0,4,0,8);
  }
    if (millis() > 42250 && millis() < 42500) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 42250,0,4,0,8);
  }
    if (millis() > 42750 && millis() < 43250) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 42750,0,4,0,8);
  }

///
///
   if (millis() > 41450 && millis() < 41950) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 41450,0,1,0,1);
  }
   if (millis() > 41950 && millis() < 42400)
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 41950,0,26,0,12);
  }
//
   if (millis() > 43300 && millis() < 43850) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 43300,0,14,0,8);
  }
   if (millis() > 43850 && millis() < 44100) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 250, 43850,0,32,0,12);
  }

///
///

   if (millis() > 48700 && millis() < 49450) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 48700,0,4,0,8);
  }
    if (millis() > 50200 && millis() < 50450) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 50200,0,4,0,8);
  }
    if (millis() > 50700 && millis() < 51450) 
  {
    drawFade(topFacePts, topFaceIrrPts, 255, 255, 0, 250, 50700,0,4,0,8);
  }

///
///
   if (millis() > 49400 && millis() < 49900) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 49400,0,1,0,1);
  }
   if (millis() > 49900 && millis() < 50350) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 30, 80, 255, 550, 49900,0,26,0,12);
  }
//
   if (millis() > 51250 && millis() < 52000) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 51250,0,14,0,8);
  }
   if (millis() > 52000 && millis() < 52250) 
  {
    drawFade(rightFacePts, rightFaceIrrPts, 50, 65, 255, 250, 52000,0,30,0,12);
  }
///
///


////
////  

}





void drawPlane(ArrayList<PVector> facePts, int r, int g, int b,
              boolean isStroke,int strokeWeight,int StrokeG,int StrokeR,int StrokeB)
{
  if(isStroke == false) noStroke();
  else
  { 
  strokeWeight(strokeWeight);
  stroke(StrokeR,StrokeG,StrokeB);
  }
  
  fill(r,g,b);
  beginShape();//Create shape object
  for (int i=0; i<facePts.size(); i++) 
  {
    vertex(facePts.get(i).x, facePts.get(i).y);
  }
  endShape(CLOSE);//End shape object
  
}

void drawFade(ArrayList<PVector> facePts, ArrayList<PVector> facePtsIrr, int r, int g, int b,
              int period, int startTime, int FacePointsStartReg, int FacePointsEndReg,
              int FacePointsStartIrr, int FacePointsEndIrr) 
{
  noStroke();
  float tempTime = ((millis()-startTime)%period);//Create a timer
  int fadeValTemp;

  
  if (tempTime < period*0.5) //For the first half of the period
  {
    fadeValTemp = int(255*((tempTime/period)*2));
    fill(fadeValTemp*r/255, fadeValTemp*g/255, fadeValTemp*b/255);
  }

  else //For the second half of the period
  {
    fadeValTemp = 255 - int(255*((tempTime/period)-0.5)*2);
    fill(fadeValTemp*r/255, fadeValTemp*g/255, fadeValTemp*b/255);
  }

  for (int i=FacePointsStartReg; i<FacePointsEndReg; i+=4) 
  {
    beginShape();//Create shape object
    vertex(facePts.get(i).x, facePts.get(i).y);
    vertex(facePts.get(i+1).x, facePts.get(i+1).y);
    vertex(facePts.get(i+2).x, facePts.get(i+2).y);
    vertex(facePts.get(i+3).x, facePts.get(i+3).y);
    endShape(CLOSE);//End shape object
  }

  for (int i=FacePointsStartIrr; i<FacePointsEndIrr; i+=6) 
  {
    beginShape();//Create shape object
    vertex(facePtsIrr.get(i).x, facePtsIrr.get(i).y);
    vertex(facePtsIrr.get(i+1).x, facePtsIrr.get(i+1).y);
    vertex(facePtsIrr.get(i+2).x, facePtsIrr.get(i+2).y);
    vertex(facePtsIrr.get(i+3).x, facePtsIrr.get(i+3).y);
    vertex(facePtsIrr.get(i+4).x, facePtsIrr.get(i+4).y);
    vertex(facePtsIrr.get(i+5).x, facePtsIrr.get(i+5).y);
    endShape(CLOSE);//End shape object
  }
  
}

void drawAnts(ArrayList<PVector> facePts, ArrayList<PVector> facePtsIrr,int r, int g, int b,
              int period, int startTime,int FacePointsStartReg, int FacePointsEndReg,
              int FacePointsStartIrr, int FacePointsEndIrr,int strokeWeight) 
{
  strokeWeight(strokeWeight);
  noFill();
  float tempTime = ((millis()-startTime)%period);
  float tempTimeNorm = tempTime/period;
  //println(tempTimeNorm);
  stroke(r,g,b);
  for (int i=FacePointsStartReg; i<FacePointsEndReg; i+=4) 
  {
    line(facePts.get(i).x, facePts.get(i).y, facePts.get(i).x +((facePts.get(i+1).x-facePts.get(i).x)*tempTimeNorm), facePts.get(i).y +((facePts.get(i+1).y-facePts.get(i).y)*tempTimeNorm));
    line(facePts.get(i+1).x, facePts.get(i+1).y, facePts.get(i+1).x +((facePts.get(i+2).x-facePts.get(i+1).x)*tempTimeNorm), facePts.get(i+1).y +((facePts.get(i+2).y-facePts.get(i+1).y)*tempTimeNorm));
    line(facePts.get(i+2).x, facePts.get(i+2).y, facePts.get(i+2).x +((facePts.get(i+3).x-facePts.get(i+2).x)*tempTimeNorm), facePts.get(i+2).y +((facePts.get(i+3).y-facePts.get(i+2).y)*tempTimeNorm));
    line(facePts.get(i+3).x, facePts.get(i+3).y, facePts.get(i+3).x +((facePts.get(i).x-facePts.get(i+3).x)*tempTimeNorm), facePts.get(i+3).y +((facePts.get(i).y-facePts.get(i+3).y)*tempTimeNorm));
  }

  for (int i=FacePointsStartIrr; i<FacePointsEndIrr; i+=6) 
  {
    line(facePtsIrr.get(i).x, facePtsIrr.get(i).y, facePtsIrr.get(i).x +((facePtsIrr.get(i+1).x-facePtsIrr.get(i).x)*tempTimeNorm), facePtsIrr.get(i).y +((facePtsIrr.get(i+1).y-facePtsIrr.get(i).y)*tempTimeNorm));
    line(facePtsIrr.get(i+1).x, facePtsIrr.get(i+1).y, facePtsIrr.get(i+1).x +((facePtsIrr.get(i+2).x-facePtsIrr.get(i+1).x)*tempTimeNorm), facePtsIrr.get(i+1).y +((facePtsIrr.get(i+2).y-facePtsIrr.get(i+1).y)*tempTimeNorm));
    line(facePtsIrr.get(i+2).x, facePtsIrr.get(i+2).y, facePtsIrr.get(i+2).x +((facePtsIrr.get(i+3).x-facePtsIrr.get(i+2).x)*tempTimeNorm), facePtsIrr.get(i+2).y +((facePtsIrr.get(i+3).y-facePtsIrr.get(i+2).y)*tempTimeNorm));
    line(facePtsIrr.get(i+3).x, facePtsIrr.get(i+3).y, facePtsIrr.get(i+3).x +((facePtsIrr.get(i+4).x-facePtsIrr.get(i+3).x)*tempTimeNorm), facePtsIrr.get(i+3).y +((facePtsIrr.get(i+4).y-facePtsIrr.get(i+3).y)*tempTimeNorm));
    line(facePtsIrr.get(i+4).x, facePtsIrr.get(i+4).y, facePtsIrr.get(i+4).x +((facePtsIrr.get(i+5).x-facePtsIrr.get(i+4).x)*tempTimeNorm), facePtsIrr.get(i+4).y +((facePtsIrr.get(i+5).y-facePtsIrr.get(i+4).y)*tempTimeNorm));
    line(facePtsIrr.get(i+5).x, facePtsIrr.get(i+5).y, facePtsIrr.get(i+5).x +((facePtsIrr.get(i).x-facePtsIrr.get(i+5).x)*tempTimeNorm), facePtsIrr.get(i+5).y +((facePtsIrr.get(i).y-facePtsIrr.get(i+5).y)*tempTimeNorm));
  }
}

void drawPulseSimple(ArrayList<PVector> facePts, int r, int g, int b,
                     int period, int startTime, int FacePointsStartReg, int FacePointsEndReg) 
{  
  noStroke();
  if ((millis()-startTime)%period > period*0.5) fill(r, g, b);
  else fill(0);

  for (int i=FacePointsStartReg; i<FacePointsEndReg; i+=4) 
  {
    beginShape();  //Create shape object
    vertex(facePts.get(i).x, facePts.get(i).y);
    vertex(facePts.get(i+1).x, facePts.get(i+1).y);
    vertex(facePts.get(i+2).x, facePts.get(i+2).y);
    vertex(facePts.get(i+3).x, facePts.get(i+3).y);
    endShape(CLOSE); //End shape object
  }
}

void drawFaces(ArrayList<PVector> facePts,ArrayList<PVector> facePtsIrr, int r, int g, int b,
              int FacePointsStart, int FacePointsEnd,int FacePointsStartIrr,int FacePointsEndIrr,
              boolean isStroke,int strokeWeight,int StrokeG,int StrokeR,int StrokeB) 
{
  if(isStroke == false) noStroke();
  else
  { 
  strokeWeight(strokeWeight);
  stroke(StrokeR,StrokeG,StrokeB);
  }
  
  fill(r, g, b);
  for (int i=FacePointsStart; i<FacePointsEnd; i+=4) 
  {
    beginShape();  //Create shape object
    vertex(facePts.get(i).x, facePts.get(i).y);
    vertex(facePts.get(i+1).x, facePts.get(i+1).y);
    vertex(facePts.get(i+2).x, facePts.get(i+2).y);
    vertex(facePts.get(i+3).x, facePts.get(i+3).y);
    endShape(CLOSE); //End shape object
  }
  for (int i=FacePointsStartIrr; i<FacePointsEndIrr; i+=6) 
  {
    beginShape();  //Create shape object
    vertex(facePtsIrr.get(i).x, facePtsIrr.get(i).y);
    vertex(facePtsIrr.get(i+1).x, facePtsIrr.get(i+1).y);
    vertex(facePtsIrr.get(i+2).x, facePtsIrr.get(i+2).y);
    vertex(facePtsIrr.get(i+3).x, facePtsIrr.get(i+3).y);
    vertex(facePtsIrr.get(i+4).x, facePtsIrr.get(i+4).y);
    vertex(facePtsIrr.get(i+5).x, facePtsIrr.get(i+5).y);
    endShape(CLOSE); //End shape object
  }
}
/**
 * Takes a .txt file from grasshopper and translates
 * the strings to an ArrayList of PVectors
 */
ArrayList<PVector> processTxtFile(String[] points, float scalar) 
{

  ArrayList<PVector> facePts = new ArrayList<PVector>();

  // for each line of the text file
  for (int i=0; i<points.length; i++) 
  {   
    // create an array that holds 3 values,
    // the X, Y, and Z coordinate of our PVector
    String[] coord = split(points[i], ",");

    // increase the scale
    float x = Float.parseFloat(coord[0])*scalar;
    float y = Float.parseFloat(coord[1])*scalar;
    float z = Float.parseFloat(coord[2])*scalar;

    // add new PVector to our ArrayList
    facePts.add(new PVector(x, y, z));
  }

  // reassign our modified ArrayList to the variable
  // that called processTxtFile(..)
  return facePts;
}

void stop()
{
  //song.close();
  //minim.stop();
  super.stop();
  exit();
}



