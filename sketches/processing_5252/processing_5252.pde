


float angle = 0.1;
float speed = 0.1;
float rad = 30;
boolean imageMode = false;
PImage img;
PImage imghead;



void setup() {
  size(400, 480);
  smooth();
  img = loadImage("skin.png"); // <-- put image in foler
  imghead = loadImage("head.png"); 
  //noLoop();
}






  //change HEAD

void eImageHD(float x, float y, float d, float dd) {
  
  if (imageMode == true) {
    // Draw the image instead of the ellipse 
    image(imghead, x-48, y-70, 100, 150);
  } else {
    ellipse(x, y, 100, 150);
  }
  
}

  

 //change TENTACLES
void eImage(float x, float y, float d, float dd) {
  
  if (imageMode == true) {
    // Draw the image instead of the ellipse 
    image(img, x - d/2, y - d/2 , d, d);
    speed = 0.8;
  } else {
    ellipse(x, y, d, d);
    speed = 0.1;
    
  } 
  
}

void keyPressed () {
  imageMode = !imageMode; 
}


  




void draw() {

  background(0, 247, 20);
  angle = angle + speed;
  
  
// BODY


float radius = 6;


float my = map(mouseY, 0, height, 0, 10);

noFill(); 
for (int c = 0; c < 100; c += 2) {
    stroke(250, mouseY+10, 200);
    strokeWeight(my);
    ellipse(200, 200, radius, radius);
    radius = radius += 30;
}
  
  fill(230, 0, 0);
  int mx = constrain(mouseX, 173, 188);
  
  
  
  noStroke();
  eImageHD(200 + (sin(angle + PI) * 2), 160, 100, 120); //head

  // R eye
  fill(220, 250, 0);
  ellipse(180  + (sin(angle + PI) * 2), 148, 30, 45); // eye
  fill(0);
  ellipse(mx  + (sin(angle + PI) * 2), 148, 15, 35); // pupil

  // L eye
  fill(220, 250, 0);
  ellipse(220  + (sin(angle + PI) * 2), 148, 30, 45); // eye
  fill(0);
  ellipse((mx + 40) + (sin(angle + PI) * 2), 148, 15, 35); // pupil
   
  
  noStroke(); 
  fill(230, 0, 0);

  //1R tentacle
  eImage(210 + (sin(angle + PI) * 5), 225, rad, rad);
  rad -= 3;
  eImage(220 + (sin(angle + HALF_PI) * 5), 255, rad, rad);
  rad -= 3;
  eImage(230 + (sin(angle + QUARTER_PI) * 5), 285, rad, rad);
  rad -= 3;
  eImage(240 + (sin(angle + TWO_PI) * 5), 315, rad, rad);
  rad -= 3;
  eImage(250 + (sin(angle + PI) * 5), 345, rad, rad);
  rad = 30;
  //tentacle

  //2R tentacle
  eImage(220 + (sin(angle + PI) * 5), 225, rad, rad);
  rad -= 3;
  eImage(240 + (sin(angle + HALF_PI) * 5), 245, rad, rad);
  rad -= 3;
  eImage(260 + (sin(angle + QUARTER_PI) * 5), 265, rad, rad);
  rad -= 3;
  eImage(280 + (sin(angle + TWO_PI) * 5), 285, rad, rad);
  rad -= 3;
  eImage(300 + (sin(angle + PI) * 5), 305, rad, rad);
  rad = 30;
  //tentacle

  //3R tentacle
  eImage(230 + (sin(angle - PI) * 5), 220, rad, rad);
  rad -= 3;
  eImage(260 + (sin(angle - HALF_PI) * 5), 230, rad, rad);
  rad -= 3;
  eImage(290 + (sin(angle - QUARTER_PI) * 5), 240, rad, rad);
  rad -= 3;
  eImage(320 + (sin(angle - TWO_PI) * 5), 250, rad, rad);
  rad -= 3;
  eImage(350 + (sin(angle - PI) * 5), 260, rad, rad);
  rad = 30;
  //tentacle

  //1L tentacle
  eImage(190 + (sin(angle - PI) * 5), 225, rad, rad);
  rad -= 3;
  eImage(180 + (sin(angle - HALF_PI) * 5), 255, rad, rad);
  rad -= 3;
  eImage(170 + (sin(angle - QUARTER_PI) * 5), 285, rad, rad);
  rad -= 3;
  eImage(160 + (sin(angle - TWO_PI) * 5), 315, rad, rad);
  rad -= 3;
  eImage(150 + (sin(angle - PI) * 5), 345, rad, rad);
  rad = 30;
  //tentacle

  //2L tentacle
  eImage(180 + (sin(angle - PI) * 5), 225, rad, rad);
  rad -= 3;
  eImage(160 + (sin(angle - HALF_PI) * 5), 245, rad, rad);
  rad -= 3;
  eImage(140 + (sin(angle - QUARTER_PI) * 5), 265, rad, rad);
  rad -= 3;
  eImage(120 + (sin(angle - TWO_PI) * 5), 285, rad, rad);
  rad -= 3;
  eImage(100 + (sin(angle - PI) * 5), 305, rad, rad);
  rad = 30;
  //tentacle

  //3L tentacle
  eImage(170 + (sin(angle + PI) * 5), 220, rad, rad);
  rad -= 3;
  eImage(140 + (sin(angle + HALF_PI) * 5), 230, rad, rad);
  rad -= 3;
  eImage(110 + (sin(angle + QUARTER_PI) * 5), 240, rad, rad);
  rad -= 3;
  eImage(80 + (sin(angle + TWO_PI) * 5), 250, rad, rad);
  rad -= 3;
  eImage(50 + (sin(angle + PI) * 5), 260, rad, rad);
  rad = 30;
  //tentacle

}



