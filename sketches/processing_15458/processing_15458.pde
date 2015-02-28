
// new script
float s = 15;
void setup() {
  size(400,400);
  noStroke();
}

void draw() {
if(mousePressed){
  for(int x =0; x < width/s; x++){
      for(int y =0; y < width/s; y++){
          float r = (dist(x*s,y*s,mouseX,mouseY)/width)*100;
          fill(r, 100 - r, 50);
          rect(x*s,y*s,s,s);
      }
  }
  } 
}
