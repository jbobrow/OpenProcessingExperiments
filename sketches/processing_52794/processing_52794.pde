
void setup(){
   size(600,800);
   smooth();
   background(0);
   fill(255);
   noStroke(); 
}

void draw(){
 background(0);
 float ellSize = 0;
 for(int x = 0; x < width; x+=10){
   for(int y = 0; y < height; y+=10){
     ellSize = cos(x*mouseY)*cos(x*y)*30;
     ellipse(x,y,ellSize,ellSize*20);
     
   }
 } 
}

