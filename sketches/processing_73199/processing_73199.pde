
PImage img;


void setup() {
  img = loadImage("Dojo.JPG");
  int horizon= 600;
  int vert= 600;
  size(horizon, vert);
}


void draw() {
  image(img, -175, -0);
  smooth();
  
  //////////////sword
  fill(0);
  stroke(0);
  strokeWeight(8);
  line (380, 330, 230, 520);
  
  fill(0);
  stroke(0);
  strokeWeight(8);
  line (220, 330, 370, 520);
  
  fill(0);
  stroke(0);
  strokeWeight(3);
  line (354, 355, 362, 363);
  
  fill(0);
  stroke(0);
  strokeWeight(3);
  line (246, 355, 238, 363);
  //////////////////////////////////////////swords///
  strokeWeight(4);
  stroke(0);
  fill (0);
  ellipse (267, 575, 50, 20);
  
  fill (0);
  ellipse (338, 575, 50, 20);
 
  strokeWeight (4);
  fill (0);
  quad (243, 570, 294, 570, 300, 495, 265, 490);
  quad (310, 570 ,362, 570, 335, 490, 300, 495);
  
  strokeWeight(0);
  stroke(0);
  fill(0);
  quad (243, 555, 243, 572, 297, 572, 297, 555);
  quad (308, 555, 308, 572, 363, 572, 363, 555);
  
  stroke(0);
  quad (251, 470, 270, 485, 325, 492, 346, 470);
  
  rect (263, 458, 73, 73);
  
  stroke(255, 0, 0);
  strokeWeight(15);
  line (265, 485, 335, 485);
  
  fill(0);
  stroke(0);
  quad (260, 410, 270, 460, 330, 460, 340, 410); 
  
    fill(0);
  stroke(0);
  strokeWeight(0);
  quad (235, 380, 260, 400, 240, 435, 210, 435); //////////////Up arm
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  quad (365, 380, 340, 400, 360, 435, 390, 435);/////////////Up arm
  
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(0);
  quad (230, 380, 260, 410, 340, 410, 370, 380); 
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse (300, 360, 100, 100);
  
  fill(252);
  stroke(252);
  strokeWeight(0);
  ellipse (280, 360, 20, 20);
  
  fill(252);
  stroke(252);
  strokeWeight(0);
  ellipse (320, 360, 20, 20);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  rect (310, 335, 22, 21);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  rect (270, 335, 22, 21);
 
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse (320, 366, 15, 15);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse (280, 366, 15, 15);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  quad ( 215, 435, 215, 470, 240, 470, 240, 435);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  quad (360, 470, 360, 435, 385, 435, 385, 470);


  fill(0);
  stroke(255, 0, 0);
  strokeWeight(8);
  line (260, 330, 340, 330);
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse (230, 470, 30, 30);//////note
  
  fill(0);
  stroke(0);
  strokeWeight(0);
  ellipse (370, 470, 30, 30);
  
  int x=0;                   //////////////////IF ELSE DAGGER// ears
  if (x < 150) {
    strokeWeight(5);
line(360, 460, 400, 500);
} else {
  strokeWeight(10);
ellipse(270, 301, 40, 40);
}


  int z=1;                   //////////////////IF ELSE DAGGER// ears
  if (z < 150) {
    strokeWeight(5);
line(240, 460, 200, 500);
} else {
  strokeWeight(10);
ellipse(330, 301, 40, 40);
}




float c= random (500);


if (c<10) {
  fill(255, 44, 51);
  stroke(255, 0, 0);
  strokeWeight(5);
  ellipse (230, 470, 30, 30);
}


float d= random (500);


if (d<10) {
  fill(255, 44, 51);
  stroke(255, 0, 0);
  strokeWeight(5);
  ellipse (370, 470, 30, 30);
}
  }

