
boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
boolean page4 = false;
PImage img;
PImage img2;
PImage img3;
PImage img4;
float linkcolor, linkcolor2;
PFont font;
 
void setup(){
  size(400,600);
  img = loadImage("Image12.png");
  img2 = loadImage("Image9.png");
  img3 = loadImage("Image10.png");
  img4 = loadImage("Image11.png");
  linkcolor = 0;
  linkcolor2 = 0;
  font = loadFont("PrestigeEliteStd-Bd-17.vlw");
}
 
void draw(){
  if(page1){
    drawPage1();
  }
  else if(page2){
    drawPage2();
  }
  else if(page3){
    drawPage3();
  }
  else if(page4){
  drawPage4();
  }
}

void drawPage1(){
  image(img,0,0);
  noStroke();
  noFill();
  rectMode(CENTER);
  rect(180,485,32,60);
  textFont(font);
  fill(10,0,80);
  text("LET'S GO TO FUTURES", 180,200);
  
  if(hitDetect(mouseX,mouseY,0,0,180,485,32,60)){
   rectMode(CENTER);
   fill(180,150,0,100);
   rect(180,485,40,60);
} 
   if(!hitDetect(mouseX,mouseY,0,0,180,485,32,60)){
   noFill();
} 
}
 
void drawPage2(){
  image(img2,0,0);
  smooth();
  noStroke();
  noFill();
  ellipseMode(CENTER);
  ellipse(267,355,15,15);
  
  if(hitDetect(mouseX,mouseY,0,0,267,355,15,15)){
   fill(62,100,173);
   ellipseMode(CENTER);
   ellipse(267,355,15,15);
}
} 
void drawPage3(){
  image(img3,0,0);
  noStroke();
  noFill();
  ellipseMode(CENTER);
  ellipse(180,460,170,170);
  
   if(hitDetect(mouseX,mouseY,0,0,180,460,170,170)){
   fill(100,70,40);
   ellipseMode(CENTER);
   ellipse(180,460,170,170);
} 
}

void drawPage4(){
  image(img4,0,0);
  noStroke();
  textFont(font);
  text("Mmmmm...COFFEE", 185,545);
  fill(255,255,255);
  }
 
void mousePressed(){
 
  if(page1){
    if(hitDetect(mouseX,mouseY,0,0,180,485,32,60)){
      page1=false;
      page2=true;
      page3=false;
      page4=false;
    }
 
}   if(page2){
    if(hitDetect(mouseX,mouseY,0,0,267,355,15,15)){
      page1=false;
      page2=false;
      page3=true;
      page4=false;
    }
}     else if(page3){
      if(hitDetect(mouseX,mouseY,0,0,180,460,170,170)){
      page1=false;
      page2=false;
      page3=false;
      page4=true;
    }
}   else if(page4){
      if(hitDetect(mouseX,mouseY,0,0,180,460,170,170)){
      page1=true;
      page2=false;
      page3=false;
      page4=false;
    }
}
}
boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  w1 /= 2;
  h1 /= 2;
  w2 /= 2;
  h2 /= 2;
  if(x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
    return true;
  } else {
    return false;
  }
}
 

