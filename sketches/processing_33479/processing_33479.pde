
 PImage myImage; //hey heres an imge!!//I dont know what its gona be..

void setup(){
  size(750,300);
  background(#0f9c26);
  smooth();
  imageMode(CENTER);
  myImage = loadImage("codeeyes.png");//hey I just found this image! I want to put it somewhere!!//
}


void draw(){
  
    // random colors on background//
  
     for(int i=0; i<width; i+=30) {
      for(int j=0; j<height; j+=30) {
        fill(random(0,100),100,60); 
        // second two parameters are for saturation and brightness
        // which are 0 to 100 by default
        rect(i,j,30,30);
      }
    }

  fill(#0f9c26);
  noStroke();
  ellipse(300,150,300,300);
  ellipse(600,150,300,300);
  float leftEyePos = map(mouseX,0,width,275,325); //MouseX=0-width/can you take this range and only move it to 275 to 325)
  float rightEyePos = map(mouseX,0,width,550,650);
  fill(#0f9c26);
//  ellipse(leftEyePos, 170,20,20);
//  ellipse(rightEyePos, 170,20,20);
  image (myImage, leftEyePos, 170);
  image (myImage, rightEyePos,170); //hey! place my img at the left eye position!//
//   ellipse(rightEyePos, 170,20,20);
  float lidPos = map(mouseY,0,height,0,250);
  rect(0,0,width,lidPos);
  
  
    float r =map(mouseX,0,width,0,255);
  float g =map(mouseY,0,width,0,255);
  





  
  //____________________eyes
  translate(50,30);
  rotate(PI/3.0);


}






  

