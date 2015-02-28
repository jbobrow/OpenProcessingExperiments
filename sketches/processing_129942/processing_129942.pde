
void setup() {
 size(800, 500) ; 
}

void draw() {
  
  background(#05FFF9);
 
 fill(#02CB1B);
 rect(0, 300, width, 400);
 //Creature's bod
 fill(#000000);
 quad(380, 320, 360, 200, 440, 200, 420, 320); //main body
 
  //Creature's head!
   
   fill(#434342);
   ellipse(400, 155, 100, 100) ; //head shape
  
  
  //mask
  fill(#000000);
  arc(400, 158, 100, 92, 0, PI-0);
  arc(400, 138, 90, 70, 0-PI, 0);
  
  //eyes
  
 fill(#00FF01);
  quad(360, 140, 360, 155, 398, 152, 398, 147); //left eye
  quad(402, 152, 402, 147, 440, 140, 440, 155); //right eye
  
 
  
  //"rayman" hands
 fill(#434342);
 ellipse(350, 260, 25, 25);
 ellipse(450, 260, 25, 25);
 
  //rayman feet
  fill(#000000);
  rect(375, 330, 22, 20, 80, 0, 0, 80);
  rect(405, 330, 22, 20, 0, 80, 80, 0);
  
  println(mouseX + "," + mouseY);
}




