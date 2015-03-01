
//For

color[] Alicia = {#1BA6A6, #30BFB1, #F2B5A7, #D97B73, #F27979};
color[] palette = Alicia;
int z= 25;
void setup(){
  size(500, 500);
  background(255);
  smooth();
  frameRate(30);
  strokeWeight(10);
  strokeCap(SQUARE);
  for(int y=0; y< height; y+= z){
    stroke(palette[int(random(1,5))]);
    line(50, y, 450, y);
  }
}

void draw(){
  stroke(palette[int(random(1,5))]);
  int y = int(random(height/z))*z;
  line(50, y, 450, y);
}


