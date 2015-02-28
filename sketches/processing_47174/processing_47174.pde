
PImage d;
void setup(){
  size(500,500);
  d=loadImage("twirl.gif");
 background(0,0,0,225);
 int value = 0;
  
}


void draw() {
  stroke(140,random(0,110),20);
  line(-500,random(0,500),500,350);
  line(1200,random(0,500),500,150);
  line(-1200,random(-500,0),500,150);
  line(2100,random(-500,0),500,350);

    
if (mousePressed == true) { 
  fill(random(0,215),70,40);
  } else {
    
    tint(0,0,0,200);
    fill(0);
     }
     rect(random(0,500), random(0,129),50,50);

 if (mousePressed == true) {
    fill(random(0,225),100,150);
  } else {
    fill(13);
  }
  rect(random(0,500),178, 34,72);
  
  if (mousePressed == true) {
  fill(random(0,215),70,40);
  } else {
    
    tint(0,0,0,200);
    fill(0);
     }
     rect(random(0,500), random(373,500),50,50);
  
  if (mousePressed == true) {
    fill(random(0,225),100,150);
  } else {
    tint(0,0,0,100);
    fill(0);
  }
  rect(random(0,500),300, 34,72);
image(d,0,0,500,500);

  if (mousePressed == true) {
    fill(140,random(0,90),20);
  } else {
    fill(13);
  }
  rect(random(0,500), 250, 50, 50);
  
  
}



