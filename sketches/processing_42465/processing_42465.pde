
void setup(){
size(400, 420);
smooth();
background(200, 100, 80);

for(int y=0; y<height; y=y+30){
 for(int x=0; x<width; x=x+40){
   stroke(200);
   line(x, y, x+40, y);
   line(x, y+15, x+40, y+15);
   
   line(x, y, x, y+15);
   line(x+20, y+15, x+20, y+30);
   }
   }
}

void draw(){
noStroke();

   if(mousePressed){
   noStroke();
   fill(0, 0, 255, 60);
   ellipse(mouseX, mouseY, 20, 20);
   
   }

}

