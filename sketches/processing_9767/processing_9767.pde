
//Dashiell Farewell, CMSC 117, FINAL PROJECT


import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import ddf.minim.*;

AudioPlayer song;
Minim minim;

PImage egg; 
PImage hatch; 
PImage chick; 
PImage chicken; 
PImage dinner; 

float x, y; 
float easing = .1; 
float targetX, targetY; 

void setup()
{
  size(1200, 400);

  minim = new Minim(this); //play song
  song = minim.loadFile("Robot Chicken - Ending.mp3");
  song.play(); //end play song

  //http://www.openclipart.org/detail/6695
  egg = loadImage("egg.png");
  //http://www.openclipart.org/detail/5481
  hatch = loadImage("hatch.png"); 
  //http://www.openclipart.org/detail/19606
  chick = loadImage("chick.png"); 
  //http://www.openclipart.org/detail/12457
  chicken = loadImage("chicken.png"); 
  //http://www.openclipart.org/detail/2589
  dinner = loadImage("dinner.png");
}

void draw()
{
  if (mouseX > 0 && mouseX < 800)
  {
    background(88, 176, 250); //ground and sky (day)
    smooth(); 
    noStroke();
    fill(246, 255, 8);
    ellipse(250, 100, 100, 100);
    fill(0, 250, 0);
    rect(0, 350, 1200, 50); //end ground and sky (day)


    fill(250, 0, 0); //chicken coop
    rect(35, 275, 200, 75);
    fill(0);
    rect(200, 290, 35, 30);
    triangle(235, 319, 235, 350, 270, 350);
    triangle(125, 250, 25, 275, 250, 275); //end chicken coop

    strokeWeight(2);//cow
    fill(255);
    stroke(0);
    rect(500, 295, 100, 30);
    rect(500, 325, 15, 27);
    rect(515, 325, 5, 27);
    rect(585, 325, 15, 27);
    rect(580, 325, 15, 27);
    ellipse(502, 298, 35, 35);
    noStroke();
    fill(0);
    triangle(495, 270, 490, 285, 495, 285);
    triangle(513, 270, 508, 285, 513, 285);
    ellipse(494, 293, 3, 3);
    ellipse(505, 293, 3, 3);
    fill(214, 6, 145);
    rect(496, 298, 7, 7);
    strokeWeight(2);
    stroke(0);
    line(494, 309, 506, 309);
    fill(0);
    ellipse(535, 305, 15, 15);
    ellipse(540, 308, 20, 20);
    ellipse(560, 307, 12, 12);
    ellipse(570, 305, 15, 15);//end cow


    stroke(95, 72, 7); //fence
    strokeWeight(3);
    line(385, 300, 785, 300);
    line(385, 325, 785, 325);
    line(385, 295, 385, 350);
    line(485, 295, 485, 350);
    line(585, 295, 585, 350);
    line(685, 295, 685, 350);
    line(785, 295, 785, 350); //end fence

    fill(250); //farm house
    noStroke();
    smooth();
    rect(825, 180, 365, 175); 
    fill(250, 0, 0);
    rect(825, 250, 50, 105);
    fill(0);
    ellipse(830, 300, 5, 5);
    fill(250, 0, 0);
    triangle(990, 130, 815, 180, 1200, 180);
    fill(21, 206, 87);
    stroke(0);
    smooth();
    rect(900, 235, 85, 60);
    rect(1050, 235, 85, 60);
    stroke(3); 
    strokeWeight(3);
    fill(118, 78, 27);
    line(945, 235, 945, 295);
    line(900, 265, 985, 265);
    line(1095, 235, 1095, 295);
    line(1050, 265, 1135, 265);
    fill(250, 0, 0);
    noStroke();
    smooth();
    rect(885, 235, 15, 60);
    rect(985, 235, 15, 60);
    rect(1050, 235, 15, 60);
    rect(1120, 235, 15, 60); //end farmhouse

    targetX = mouseX; 
    targetY = mouseY; 
    x = x + ((targetX - x) * easing); 
    y = y + ((targetY - y) * easing);
  }

  else if(mouseX > 800 && mouseX < 1200)
  {
    background(0); //ground and sky (night)
    smooth(); 
    noStroke();
    fill(206, 191, 191);
    ellipse(950, 100, 100, 100);
    stroke(113, 112, 110);
    ellipse(975, 75, 13, 13);
    ellipse(925, 80, 15, 15);
    ellipse(928, 95, 10, 10);
    ellipse(940, 120, 12, 12);
    fill(0, 250, 0);
    rect(0, 350, 1200, 50); //end ground and sky (night)


    fill(250, 0, 0); //chicken coop
    noStroke();
    rect(35, 275, 200, 75);
    fill(0);
    rect(200, 290, 35, 30);
    stroke(255, 0, 0);
    strokeWeight(.5);
    triangle(235, 319, 235, 350, 270, 350);
    triangle(125, 250, 25, 275, 250, 275); //end chicken coop

    strokeWeight(2);//cow
    fill(255);
    stroke(0);
    rect(500, 320, 100, 30);
    ellipse(502, 323, 35, 35);
    fill(0);
    triangle(495, 295, 490, 210, 495, 210);
    triangle(513, 295, 508, 210, 513, 210);
    stroke(0);
    strokeWeight(1);
    line(492, 316, 498, 316);
    line(501, 316, 507, 316);
    fill(214, 6, 145);
    rect(496, 323, 7, 7);
    strokeWeight(1);
    stroke(0);
    line(494, 334, 506, 334);
    fill(0);
    ellipse(535, 330, 15, 15);
    ellipse(540, 333, 20, 20);
    ellipse(560, 332, 12, 12);
    ellipse(570, 330, 15, 15);//end cow


    stroke(95, 72, 7); //fence
    strokeWeight(3);
    line(385, 300, 785, 300);
    line(385, 325, 785, 325);
    line(385, 295, 385, 350);
    line(485, 295, 485, 350);
    line(585, 295, 585, 350);
    line(685, 295, 685, 350);
    line(785, 295, 785, 350); //end fence

    fill(250); //farm house
    noStroke();
    smooth();
    rect(825, 180, 365, 175); 
    fill(250, 0, 0);
    rect(825, 250, 50, 105);
    fill(0);
    ellipse(830, 300, 5, 5);
    fill(250, 0, 0);
    triangle(990, 130, 815, 180, 1200, 180);
    fill(231, 247, 10);
    stroke(0);
    smooth();
    rect(900, 235, 85, 60);
    rect(1050, 235, 85, 60);
    stroke(3); 
    strokeWeight(3);
    fill(118, 78, 27);
    line(945, 235, 945, 295);
    line(900, 265, 985, 265);
    line(1095, 235, 1095, 295);
    line(1050, 265, 1135, 265);
    fill(250, 0, 0);
    noStroke();
    smooth();
    rect(885, 235, 15, 60);
    rect(985, 235, 15, 60);
    rect(1050, 235, 15, 60);
    rect(1120, 235, 15, 60); //end farmhouse

    targetX = mouseX; 
    targetY = mouseY; 
    x = x + ((targetX - x) * easing); 
    y = y + ((targetY - y) * easing);
  }

  if (mouseX < 235 && mouseX > 0 && mouseY > 180 && mouseY < 360)  
  {
    image(egg, mouseX, mouseY, 55, 65);    
  }


  else if (mouseX < 380 && mouseX > 235 && mouseY > 180 && mouseY < 360) 
  {    
    image(hatch, mouseX, mouseY, 75, 95);    
  }  

  else if (mouseX < 560 && mouseX > 380 && mouseY > 180 && mouseY < 360) 
  { 
    image(chick, mouseX, mouseY, 90, 110); 
  } 


  else if (mouseX < 835 && mouseX > 560 && mouseY > 180 && mouseY < 360) 
  {
    image(chicken, mouseX, mouseY, 105, 120);
  }

  else if (mouseX < 1200 && mouseX > 835 && mouseY > 180 && mouseY < 360)
  {
    image(dinner, mouseX, mouseY, 65, 75);
  }

} 
























