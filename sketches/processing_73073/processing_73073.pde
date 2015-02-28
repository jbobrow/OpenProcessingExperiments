
/*****************************************
 * Assignment: 03
 * Name: Rhett Richardson
 * E-mail: merichards@brynmawr.edu
 * Course: CS 110 - Section 01
 * Submitted: 10/02/2012
 * 
 * This sketch is of space, in which there are three
 * space ships randomly placed, and three "moons"
 * (also randomly placed) that are actually monsters
 * of some kind. When hovered over, these "moons"
 * turn red and have angry eyes. When you click on
 * a space ship, the printed text is "That's no moon--"
 * because Star Wars is cool, who doesn't love Star Wars.
***********************************************/


// Color Variables
float r = random(30,255);
float g = random(30,255);
float bl = random(30,255);

// Moon Monster Variables
float x1 = random (100,600);
float y1 = random (100,600);
float x2 = random (100,600);
float y2 = random (100,600);
float x3 = random (100,600);
float y3 = random (100,600);
float object1Width = random (200,300);
float object1Height = object1Width;

// Spaceship Variables
float a1 = random (200,400);
float b1 = random (200,400);
float a2 = random (200,400);
float b2 = random (200,400);
float a3 = random (200,400);
float b3 = random (200,400);
float object2Width = random (50,200);
float object2Height = object2Width/2;





void setup () {
  size (600,600);
  background (0);
  stroke (0);
  
  // Stars
  for (float star = 0; star < 60; star++) {
    fill (255);
    ellipse (random(600),random(600),3,3);
  }
  
}

void myObject1 () {
 // "Moon" Monster
 fill (r,g,bl);
 ellipseMode (CENTER);
 ellipse (x1,y1,object1Width,object1Height);
ellipse (x2,y2,object1Width,object1Height);
ellipse (x3,y3,object1Width,object1Height);
 

}

void myObject2 () {
  // Spaceship
  fill (r);
  ellipse (a1,b1,object2Width,object2Height);
  ellipse (a2,b2,object2Width,object2Height);
  ellipse (a3,b3,object2Width,object2Height);
  fill (bl,r,g);
  
  
}

void draw () {
  myObject1 ();
  myObject2 ();
  if (mouseX<=x1+(object1Width/2) && mouseX>=x1-(object1Width/2) && mouseY>=y1-(object1Height/2) && mouseY<=y1+(object1Height/2)) {
     fill (255,70,70);
     ellipseMode (CENTER);
     ellipse (x1,y1,object1Width,object1Height);

    // Eyebrows
      stroke (0);
      line (x1-10,y1-20,x1+20,y1);
      line (x1+50,y1,x1+80,y1-20);

    // Eyes
      noStroke ();
      ellipseMode (CENTER);
      fill (255);
      ellipse (x1+10,y1+10,30,30);
      ellipse (x1+60,y1+10,30,30);
      fill (0);
      float x4 = constrain (mouseX,x1,x1+20);
      float y4 = constrain (mouseY,y1,y1+20);
      ellipse (x4,y4,10,10);
      float x5 = constrain (mouseX,x1+50,x1+70);
      float y5 = constrain (mouseY,y1,y1+20);
      ellipse (x5,y5,10,10);
}

  if (mouseX<=x2+(object1Width/2) && mouseX>=x2-(object1Width/2) && mouseY>=y2-(object1Height/2) && mouseY<=y2+(object1Height/2)) {
     fill (255,70,70);
     ellipseMode (CENTER);
     ellipse (x2,y2,object1Width,object1Height);

     //  Eyebrows
      stroke (0);
      line (x2-10,y2-20,x2+20,y2);
      line (x2+50,y2,x2+80,y2-20);

     // Eyes
      noStroke ();
      ellipseMode (CENTER);
      fill (255);
      ellipse (x2+10,y2+10,30,30);
      ellipse (x2+60,y2+10,30,30);
      fill (0);
      float x6 = constrain (mouseX,x2,x2+20);
      float y6 = constrain (mouseY,y2,y2+20);
      ellipse (x6,y6,10,10);
      float x7 = constrain (mouseX,x2+50,x2+70);
      float y7 = constrain (mouseY,y2,y2+20);
      ellipse (x7,y7,10,10);
}



  if (mouseX<=x3+(object1Width/2) && mouseX>=x3-(object1Width/2) && mouseY>=y3-(object1Height/2) && mouseY<=y3+(object1Height/2)) {
     fill (255,70,70);
     ellipseMode (CENTER);
     ellipse (x3,y3,object1Width,object1Height);
     
      // Eyebrows
      stroke (0);
      line (x3-10,y3-20,x3+20,y3);
      line (x3+50,y3,x3+80,y3-20);

      // Eyes
      noStroke ();
      ellipseMode (CENTER);
      fill (255);
      ellipse (x3+10,y3+10,30,30);
      ellipse (x3+60,y3+10,30,30);
      fill (0);
      float x8 = constrain (mouseX,x3,x3+20);
      float y8 = constrain (mouseY,y3,y3+20);
      ellipse (x8,y8,10,10);
      float x9 = constrain (mouseX,x3+50,x3+70);
      float y9 = constrain (mouseY,y3,y3+20);
      ellipse (x9,y9,10,10);
      stroke (0);
  }

 
  
    
} 

void mousePressed(){
  if ((mouseX<=a1+(object2Width) && mouseX>=a1-(object2Width) && mouseY>=b1-(object2Height) && mouseY<=b1+(object2Height)) || (mouseX<=a2+(object2Width) && mouseX>=a2-(object2Width) && mouseY>=b2-(object2Height) && mouseY<=b2+(object2Height)) || (mouseX<=a3+(object2Width) && mouseX>=a3-(object2Width) && mouseY>=b3-(object2Height) && mouseY<=b3+(object2Height))) {
    println ("That's no moon --");
  }
}
