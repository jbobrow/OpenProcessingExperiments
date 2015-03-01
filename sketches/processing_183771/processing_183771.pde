
    float circle_x = 0;
    float circle_y = 0;
    
void setup () { 
  size (400,400);
  noStroke();
  fill(#E87EF0);
  frameRate(1000);
}

void draw () {
     background (#8CF0ED);
     
ellipse(circle_x,50,50,50);

circle_x = circle_x + 1;

if(circle_x>400) {
  circle_x = 0;
}
ellipse(circle_y,200,200,200);

circle_y = circle_y + 10;

if(circle_y>400) {
  circle_y = 0;
}
}

