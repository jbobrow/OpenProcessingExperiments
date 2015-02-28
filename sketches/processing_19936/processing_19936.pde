
float myScaler = 0;
boolean isGoingRight = true;
PImage myImage;

void setup() {
  size(500,500);
  smooth();
  background(255);
  myImage = loadImage("myImage.png");
  
}
void draw() {
  //background(random(0-255),random(0-255),random(0-255));
  float angle = 0;
  float angle2 = 0;
  
  
    for(int x = 0; x <= width; x += 3) {
    stroke(0);
    float y = map(sin(angle2), -1, 1, height, 0);
    angle2 += PI / mouseY*2; // or myScaler
    color blueColor = color(0,255,255,125);
    color yellowColor = color(255,255,0,125);
    color redColor = color(255,0,255,125);
    
    tint(redColor);
    image(myImage,x+150,y-150,width/2,height/2);
    tint(blueColor);
    image(myImage,x-150,y-150,width/4,height/4);
    tint(yellowColor);
    image(myImage,x-150,y+150,width*2,height*2);
  }
  
  if(isGoingRight) {
    if(myScaler > width) {
      isGoingRight = true;
    } 
    else {
      myScaler += 5;
    }
  } 
  else {
    if(myScaler < 0) {
      isGoingRight = false;
    } 
    else {
      myScaler -= 5;
    }
    
    
    
  } //draw
  
  for(int x = 0; x <= width; x += 15) {
    stroke(0);
    float y = map(sin(angle), -1, 1, height*2, 0);
    angle += PI / mouseX*2; // or myScaler
    color blueColor = color(0,255,255,125);
    color yellowColor = color(255,255,0,125);
    color redColor = color(255,0,255,125);
    
    tint(redColor);
    image(myImage,x+width/2,y-height/3,width/2,height/2);
    tint(blueColor);
    image(myImage,x-150,y-150,width*2,height*2);
    tint(yellowColor);
    image(myImage,x-width/5,y+height/2,width/4,height/4);

  }
  if(isGoingRight) {
    if(myScaler < width) {
      isGoingRight = true;
    } 
    else {
      myScaler += 5;
    }
  } 
  else {
    if(myScaler > 0) {
      isGoingRight = false;
    } 
    else {
      myScaler -= 5;
    }
  }
  
}


