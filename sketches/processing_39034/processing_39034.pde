
void setup() {
  size(400, 400);
  smooth();
  colorMode(HSB, 100);
  background(60, 30, 20);
  noStroke();

  for (int a= 0; a <=400; a+=2) {
    for (int b=0; b <=400; b+=2) {
      star(a, b+10); //application of function, nested)
    }
  }
}

int fade1;
int fade2;
int fade3;

void draw() {


  fill(15, 20, 90);
  ellipse(width*6/8, height*1.5/8, 80, 80);

  fill(40, 50, 18);
  ellipse(width, height, 600, 500);
  fill(40, 50, 20);
  ellipse(0, height, 800, 400);
  fill(40, 50, 22);
  ellipse(width, height, 1000, 300);
}


void star(float x, float y) { //function to create starry night
  float s =random(40);
  if (s > 1) {
    fade1=60;
    fade2=30;
    fade3=20;
  }  
  else {
    fade1=15;
    fade2=20;
    fade3=90;

    pushMatrix();
    translate(x, y);
    stroke(fade1, fade2, fade3);//the variable that changes
    line(x-2, y, x+2, y);
    line(x, y-3, x, y+3);
    ellipse(x, y, 2, 2);
    popMatrix();
    noStroke();
  }
}


