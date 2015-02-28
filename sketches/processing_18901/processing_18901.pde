
//BLINKING EYELIDS
boolean drawS = false;
////RED VEINS IN WHITES OF EYES 
//boolean drawC = false;

PImage img1, img2, img3, img4, img5, img6, img7, 
img8, img9, img10, img11, img12, img13, img14, img15, img16;


void setup() {
  size(640,480);
  smooth();
  background (#dcc9af);
  img10 = loadImage ("face_mask.png");
  img1= loadImage("white_of_eye.png");
  img2= loadImage("green_pupil_left.png");
  img3= loadImage("green_pupil_right.png");
  img4= loadImage("red_pupil_left.png");
  img5= loadImage("red_pupil_right.png");
  img6= loadImage("pupil_left.png");
  img7= loadImage("pupil_right.png");
  img8= loadImage("catch_light_left.png");
  img9= loadImage("catch_light_right.png");
  img10= loadImage("face_mask.png");
  img11= loadImage("partially_closed_eyes_left.png");
  img12= loadImage("partially_closed_eyes_right.png");
  img13= loadImage("fully_closed_eyes_left.png");
  img14= loadImage("fully_closed_eyes_right.png");
  img15= loadImage("drunk_eye_left.png");
  img16= loadImage("drunk_eye_right.png");
}

void draw () {
  background(#dcc9af);
  image(img1,0,0);
  
  if(mousePressed && (mouseButton == RIGHT)) {
  image(img15, 0,0);
  image(img16, 0,0);
  }

 
  
////RED VEINS IN WHITES OF EYE
// if (drawC == true) {
//    fill (0);
//    image(img15, 0, 0);
//    image(img16, 0, 0);
//  }
  
  //GREEN EYES
  image (img2, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
  image (img3, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
  image (img6, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
  image (img7, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
  image (img8, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
  image (img9, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
  
//RED EYES AFTER MOUSE IS PRESSED
   if (mousePressed ==true) {
    image(img4,(((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
    image(img5, (((mouseX+34)*0.07)+2), (((mouseY+34)*0.05)+2));
    

  }
 
  image (img10, 0, 0);
  
  
//  BLINKING EYELIDS 
  if (drawS== true) {
fill(0);
arc(153, 210, 155,145,PI, TWO_PI);
arc(495, 210, 155,145,PI, TWO_PI);

  }

// RED EYES

}
void keyPressed(){
  if ((key == 'S') || (key == 's')) {
    drawS = true;
    
  }
//  if ((key == 'C') || (key == 'c')) { 
//  drawC = true;
//  }
}
void keyReleased (){
  drawS = false;
//  drawC = false;
}















