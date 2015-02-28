
PImage bg;
PImage bg2;
void setup() {
  size(500,500);
  bg = loadImage("bg.jpg");
  bg2 = loadImage("bg2.jpg");
}


void draw() {
  if(mousePressed==true){
    image(bg,0,0);
  }
  else{
    image(bg2,0,0);
  }
  if(mouseX<width/2){
    
    
    line(240,300,220,350);
    line(255,300,270,350);
    fill(0);
    ellipse(210,350,50,20);
    ellipse(270,350,30,20);
    fill(255,255,0);
    ellipse(250,250,50,150);
    fill(255,255,255);
    stroke(1);
    ellipse(230,200, 20,40);
   
    float leftEyePos2 = map(mouseY,0,height, 190,210);
    float rightEyePos2 = map(mouseY,0,height,195,215);
    float leftEyeBrow2 = map(mouseY,0,height,160,180);
    fill(0);
    ellipse(230,leftEyePos2,10,10);
    fill(255);
    ellipse(240,200, 20,40);
    fill(0);
    ellipse(240,rightEyePos2,10,10);
    stroke(255);
    strokeWeight(2);
    line(225,leftEyeBrow2,250,leftEyeBrow2);
    
    
    
  }
  if(mouseX>width/2){
    
    line(210,300,195,350);
    line(220,300,250,350);
    fill(0);
    ellipse(195,350,30,20);
    ellipse(250,350,50,20);
 
    fill(255,255,0);
    ellipse(215,250,50,150);
    
    fill(255,255,255);
    stroke(1);
    ellipse(235,200, 20,40);
    ellipse(225,200, 20,40);
    float leftEyePos1 = map(mouseY,0,height, 190,210);
    float rightEyePos1 = map(mouseY,0,height,195,215);
    float leftEyeBrow1 = map(mouseY,0,height,160,180);
    fill(0);
    ellipse(235,leftEyePos1,10,10);
    fill(255);
    ellipse(225,200, 20,40);
    fill(0);
    ellipse(225,rightEyePos1,10,10);
    stroke(255);
    strokeWeight(2);
    line(215,leftEyeBrow1,240,leftEyeBrow1);
    
  }
}

