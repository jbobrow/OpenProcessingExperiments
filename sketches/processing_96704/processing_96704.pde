
void setup(){
size(200, 200);
background(255);
}

int x=20;
int y=20;

void draw(){
for (x; x<200; x+=40) {
  line(20, x, 90, y);
  y+=20;
  
}
}
