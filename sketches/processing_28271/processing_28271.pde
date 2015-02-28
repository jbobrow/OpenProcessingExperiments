

void setup(){
   size(400,400);
   background (255);
   noStroke();

   
int x = 30;
int y = 30;
     
  for(int i = 0; i < width/x; i++){
      for(int j = 0; j < height/y; j++){
        pushMatrix();
        translate(i*x, j*y);
        kreisMuster();
        popMatrix();
      }
}
}
   
void kreisMuster(){
      
pushMatrix ();
translate (-85,-16);
smooth();
scale (0.35);
fill (random(255),random(160),random(255),100);
ellipse (275,100,50,50);
ellipse (325,100,50,50);
fill (39,155,119,100);
ellipse (300,75,50,50);
ellipse (300,125,50,50);
popMatrix();
}

