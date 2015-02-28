
int x=50;
int y=50;

void setup() {
size(500,500);
background(0);
}

void draw(){
  background (0);
  smooth();
  stroke(0,255,223);
  for (int i=0; i<=500; i=i+50) {
    line(x+i,0,500,y+i);
  }
}

                
                
