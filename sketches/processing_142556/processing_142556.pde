
void setup(){

size(500,500);
background(200);

// wiederholung
frameRate (11);

}

void draw(){
  
  for (int i = 200; i < width; i++)
  {
   // r = zufällig zwischen 0 und 255
   float r = random(255);
   stroke (r);
   noFill();
   strokeWeight(1);
   translate (0,0);
   line(r,0,mouseX,mouseY);
   
  
  
  }
}
