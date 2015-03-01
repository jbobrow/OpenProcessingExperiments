
//background changes color with mouse position

int r=100;
int g=100;
int b=100;


void setup (){

}

void draw () {
  if (mouseX <width/2) {
    r=constrain(r-1, 0,255);
    background (r,g,b);
  }
  else if (mouseX >width/2) {
    r=constrain(r+1, 0,255);
    background (r, g, b);
    }

}


