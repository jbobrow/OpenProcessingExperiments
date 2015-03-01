
int radius = 50;
boolean increase = true;



void setup(){
 size(1280,720);
 background(255,255,255);
}

void draw(){
  //background(0);
  stroke(mouseX*3%40, mouseY*5%255, (mouseX+mouseY)*9%255);
  strokeWeight(10);
  fill(0,0,0,0);
    
}

void mouseDragged(){
 ellipse(mouseX, mouseY, radius, radius);
 
 
 if (radius < 50){
     increase = true;
 }
 else if (radius > 150){
     increase = false;
 }
 
 if (increase == true){
   radius+=2;
 }
 else{
   radius -=2;
 }
}
