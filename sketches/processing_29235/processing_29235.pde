
void setup(){
  size(400, 600);
  smooth();
  background (255);
}
 
 
void draw(){
  
   noStroke();


  if(mousePressed) {
  fill(0,60);
  ellipse (mouseX, mouseY, mouseX, 10);
  }


   noStroke();
   fill(0);
   rect(30, 30, 340, 18);
   rect(30, 70, 340, 18);
   rect(30, 110, 340, 18);
   rect(30, 150, 340, 18);
   rect(30, 190, 340, 18);
   rect(30, 230, 340, 18);
   rect(30, 270, 340, 18);
   rect(30, 310, 340, 18);
   rect(30, 350, 340, 18);
   rect(30, 390, 340, 18);
   rect(30, 430, 340, 18);
   rect(30, 470, 340, 18);
   rect(30, 510, 340, 18);
   rect(30, 550, 340, 18);
  }


