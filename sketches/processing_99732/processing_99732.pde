
void setup(){
  size(300,300);
  background(255);
}

void draw(){
 if(mousePressed==true){
   fill(mouseX,mouseY,mouseX+mouseY,100);
 }
 else
 {
   noStroke();
   noFill();
}
float i=random(30);
frameRate(12);
ellipse(mouseX,mouseY,i,i);
}


