
float y=0;
void setup() {
  size (1000, 1000);;
}

void draw (){
  frameRate (40);
  strokeWeight (50);
  background (0);
    float r= 1 + y*0.5;
    float g= 6 + y*0.45;
    float b= 4 + y*0.67;
    stroke (r, g, b, 100);
    
    line (0, y, 1000, y++);
    line (y, 0, y++, 1000);
    scale (1.5);
    line (0, y+5, 1000, y+6);
    line (y+5, 0, y+6, 1000);
     line (0, y+100, 1000, y+6);
    line (y+20, 0, y+6, 1000);
    line (0, y+5, 1000, y+6);
    line (y+2, 0, y+6, 1000);
    scale (2,3);
    line (0, y+10, 1000, y+6);
    line (y+59, 0, y+6, 1000);
    rotate (y/40);
    line (0, y+50, 1000, y+6);
    line (y+51, 0, y+61, 1000);
   if (y>1000){
    y=-1;}
    
  println (frameCount);
}



