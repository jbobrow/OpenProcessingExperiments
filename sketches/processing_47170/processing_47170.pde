
PImage d;
void setup(){
  size(500,500);
  d=loadImage("twirl.gif");
 background(0,0,0,225);
 int value = 0;
  
}


void draw() {
    
if (mousePressed == true) { 
  fill(random(0,75),130,150);
  } else {
    
    tint(0,0,0,200);
    fill(0);
     }
     rect(random(0,500), random(0,129),50,50);

 if (mousePressed == true) {
    fill(random(0,225),200,150);
  } else {
    fill(13);
  }
  rect(random(0,500),178, 34,72);
  
  if (mousePressed == true) {
  fill(random(0,75),130,150);
  } else {
    
    tint(0,0,0,200);
    fill(0);
     }
     rect(random(0,500), random(373,500),50,50);
  
  if (mousePressed == true) {
    fill(random(0,225),200,150);
  } else {
    tint(0,0,0,100);
    fill(0);
  }
  rect(random(0,500),300, 34,72);


  if (mousePressed == true) {
    fill(random(0,130),10,0);
  } else {
    fill(13);
  }
  rect(random(0,500), 250, 50, 50);
  
  
}



