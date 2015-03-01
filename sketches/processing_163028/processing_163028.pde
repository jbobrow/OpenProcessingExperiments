

int w = 700;
int h = 500;
void setup(){

  filter(BLUR);
  size(w,h);
background(255);
noStroke();
frameRate (30);
}
 
void draw(){

  
   filter(ERODE);


fill(random(0,255),random(0,255),random(0,255));
for(int y = mouseY; y < h+15; y = y+70) {
fill(random(0,255),random(0,255),random(0,255));
for (int x = mouseX; x < w+20; x = x+10)
rect (x-25, y-25, 1, 50);
}  

}

void keyPressed(){
  if(key=='b'){
    background(255);
  
  if (key=='s'){
frameRate(0);
    
}

if (key=='g'){
frameRate(random(1,40));
}
}
}
