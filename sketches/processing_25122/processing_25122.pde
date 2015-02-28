
PImage img, img2, img3, img4, img5, img6, img7, img8, img9;
float angle = 0.03;
float posY = 5;
float rectWidth = 10;
float rectHeight = 10;
boolean clicked = false;

void setup(){
  size(500, 500);
  img = loadImage("Image2.png");
  img2 = loadImage("Image3.png");
  img3 = loadImage("Image1.png");  
  img4 = loadImage("Image4.png");
  img5 = loadImage("Image5.png");  
  img6 = loadImage("Image6.png");
  img7 = loadImage("Image7.png");
  img8 = loadImage("Image8.png");
  img9 = loadImage("Image9.png");
  smooth();

}

void draw(){
  background(img);
 

  rectMode(CENTER);

  angle = angle + 0.01;
 
  if(clicked) {
    posY = mouseY;
  }
  pushMatrix();
  if (posY >= 62){
    translate(width/2, height/2);
    pushMatrix();    
    imageMode(CENTER);
    rotate(angle);
    translate(-img2.width/2,-img2.height/2);
    image(img2,250,250);
    popMatrix();
  } 
 
    else if(posY < 62){
      img = img;
  }
  
    if (posY >= 124){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.01);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img3,250,250);
    popMatrix();
  } 
 
    else if(posY < 124){
      img = img;
  }
 
    if (posY >= 186){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.02);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img4,250,250);
    popMatrix();
  } 
 
    else if(posY < 186){
      img = img;
  }
  
    if (posY >= 248){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.03);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img5,250,250);
    popMatrix();
  } 
 
    else if(posY < 248){
      img = img;
  }
  
    if (posY >= 310){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.04);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img6,250,250);
    popMatrix();
  } 
 
    else if(posY < 310){
      img = img;
  }
  
    if (posY >= 373){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.05);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img7,250,250);
    popMatrix();
  } 
 
    else if(posY < 373){
      img = img;
  }
  
    if (posY >= 435){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.06);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img8,250,250);
    popMatrix();
  } 
 
    else if(posY < 435){
      img = img;
  }
  
    if (posY >= 497){
    translate(width/2, height/2);
    translate(-img2.width/2,-img2.height/2); 
    rotate(angle);
    pushMatrix();
    rotate(angle+0.07);
    imageMode(CENTER);
    translate(-img2.width/2,-img2.height/2);
    image(img9,250,250);
    popMatrix();
  } 
 
    else if(posY < 497){
      img = img;
  }
  popMatrix();
  pushMatrix();
  fill(255);
  rect(250,200,1,758);
  noStroke();
  fill(0);
  rect(250,posY,10,10);
  popMatrix();
}

void mousePressed(){
  if(hitDetect(mouseX,mouseY,rectWidth,rectHeight,250,posY,rectWidth,rectHeight)) {
    clicked = true;
}
}

void mouseReleased() {
  clicked = false;
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

