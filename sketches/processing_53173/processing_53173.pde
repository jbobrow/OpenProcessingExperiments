
float x,y,angle;

void setup(){
  size(500,500);
  background(255);
  fill(255);
  smooth();
   x = angle;
  y = 0;
  angle = 0;
}

void draw(){
  background(0);
  float ellSize = 0;
  for(int x = 0; x <width; x+=5){
    for(int y = 0; y < height; y+=5){
      if(mouseX < x+10 && mouseX < y+10 && mouseY < x+10 && mouseY < y+10){
        ellSize = tan(x*y)*mouseX*mouseY;
      }
       float glowLight = sin(radians(angle));
 glowLight = map(glowLight, -1,1,0,255);
 fill(glowLight,10,70);
 angle+=-10;
      ellSize = sin(x+y)*100;
      ellSize = cos(x*y)*mouseX/20;
     rect(x,y,ellSize,ellSize);
      rect(x,y,ellSize,ellSize);
  
     
    }
  }
}

