
void setup() {
  size(400,400);
  smooth();
  background(255);
  
}

void draw() {  
  if(mousePressed){
  
   fill(0,0,0,40);
   stroke(30);
   triangle(mouseX, mouseY,mouseX+100,mouseY+100,mouseY+100,mouseX+100);
   
  }else{
  
    noStroke();
   fill(255,255,255,10);
   rect(0,0,width,height);
   noFill();
   stroke(1);
   ellipse(width/2,height/2,mouseX,mouseY);
 
  }
 }

