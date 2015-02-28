
void setup() {
  //noLoop();  // draw wird nicht gelooped
  size(500, 500);
  background(255);

}

int toggle = 1;


void draw(){
  
  // print mouse 
  println (mouseX +"_______" + mouseY);
  
  strokeWeight(3);  
  rotate(radians(-35));
  translate(-200,80);
  
  /** load org. image
  PImage img;
  img = loadImage("comp1.png");
  background (0);
  if (mousePressed)image(img,100, 0);
  */
  
  
  pink();
  purple();
  blue();
  orange();
  red();
  yellow();
  green();
}



void red(){
  
  stroke(255);
  fill(167,26,24);
  rect(160, 130, 100, 100, 15);
  rect(270, 95, 135, 135, 15);
}

void orange(){
  
  noStroke();
  fill(240,129,34);
  rect(150, 10, 143, 143, 15);

  stroke(255);
  rect(100, 80, 70, 70, 15);
  
  fill(165,85,26);
  rect(210, 20, 50, 50, 8);
}

void pink(){

  noStroke();
  fill(203,11,122);
  rect(207, 338, 130, 130, 15);
  rect(160, 300, 80, 80, 15);
  rect(285, 270, 130, 130, 15);
  
  fill(129,21,85);
  rect(215, 350, 60, 60, 15);
  rect(260, 390, 30, 30, 8);
  
  rect(315, 310, 45, 45, 8);
  rect(350, 290, 30, 30, 8);
}


void green(){
  stroke(255);
  fill(140, 191,67);
  rect(115, 220, 110, 110, 15);
  rect(200, 185, 55, 55, 15);
  
  fill(78,102,38);
  noStroke();
  rect(165, 250, 20, 20, 8);
  rect(175, 260, 35, 35, 8);
}



void yellow(){
  
  stroke(255);
  fill(249,183,32);
  rect(235, 130, 143, 143, 15); 
  rect(190, 85, 70, 70, 15); 
    
  noStroke();
  fill(114,80,17);
  rect(285, 190, 35, 35, 8); 
  rect(310, 210, 55, 55, 8);  
}




void blue(){  
  
  stroke(255);
  fill(21, 117,185);
  rect(225, 260, 90, 90, 15);
}

void purple(){
  
  fill(88,39,123);
  rect(230, 450, 80, 80, 15);
  noStroke();  
  rect(213, 510, 30, 30, 8);  
  fill(50,30,75);
  rect(245, 460, 25, 25, 8);
  rect(260, 475, 30, 30, 8);
}


