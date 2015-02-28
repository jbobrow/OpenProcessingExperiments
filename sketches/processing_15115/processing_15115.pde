
void setup() {
  size(200,200);
noLoop();
}

void draw() {
  for(int x=0; x<200; x=x+10) {

    line(x,0,random(200),200);
  }
}

                
                
