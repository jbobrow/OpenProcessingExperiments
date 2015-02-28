
//first sketch advancement_03

void setup(){
  size(400,400);
  background(50, 50, 50);
  fill(255, 200, 50);
  rect(100, 100, 200, 200);
}//sets up background size 400 by 400 pixel length and width

void draw(){

   for (int i=0; i<30; i++){
       fill(0, 150, 200);
       line(pmouseX, pmouseY, mouseY, mouseX);
       stroke(0, 200, 150);
  ellipse(mouseX , mouseY, 20, 20);
}//allows a trail of pixels to follow the cursor


}


