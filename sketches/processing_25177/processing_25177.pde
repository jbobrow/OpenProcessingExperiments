
PFont Helvetica;

void setup(){  

Helvetica = loadFont("Helvetica-48.vlw");
 
  
size(500, 500);

smooth();

}

void draw(){
  println(mousePressed);
  background(#FFCC00);
  

  
  PImage b;
b = loadImage("bamboo.gif"); // BG IMAGE
image(b, 0, 0);
  
  fill(255);
   ellipse(250, 200, 230, 250);
   
  fill(0);
 
  
ellipse(180, 100, 55, 55); // Left ere
ellipse(320, 100, 55, 55); // Reft ere

ellipse(200, 200, 55, 85); // Left eye
ellipse(300, 200, 60, 85); // Right eye
ellipse(250, 280, 30, 30); // Nose

/*fill(255);
ellipse(190, 228, 15, 15); // Left eye ball
ellipse(290, 228, 15, 15); // Right eye ball
*/

fill(0);
ellipse(250, 350, 62, 50); // Chest

ellipse(220, 385, 10, 80); // Left Arm
ellipse(280, 385, 10, 80); // Right Arm

ellipse(215, 425, 15, 15); // Left Hand
ellipse(285, 425, 15, 15); // Right Hand

ellipse(240, 450, 20, 35); // Left Leg
ellipse(260, 450, 20, 35); // Right Leg

fill(255);
ellipse(250, 385, 50, 120); // Body
  
  if(mouseX<250){
    fill(255);
    ellipse(190, 228, 15, 15); // Left eye ball CHNAGED
   ellipse(290, 228, 15, 15); // Right eye ball CHANGED
  }else if (mouseX>251){
    fill(200);
   ellipse(210, 228, 15, 15); // Left eye ball CHANGED
    ellipse(310, 228, 15, 15); // Right eye ball CHANGED
  }
  
    if (mousePressed) {
      fill(255,0,0);
      ellipse (250, 305, 30, 10); // MOUTH OPENED
    }
    
    if (mousePressed) {
    textFont (Helvetica); // TEXT SHOWN
    textSize(50);
    text ("Bamboo!", 50, 60);
    }
}


