
int x=0;
int y=125;
int aSpeed=1;

void setup() {
  size (400, 200);
  frameRate(30);
}

void draw() {

  background(255);
  

  for (x=0; x<800; x+=1) {   
    float r=random(400);
    float a=random(400);
    float p=random(400);
    fill (r, a, p, p*2);
    //stroke(1);
    ellipse(r, x/4, 5, 5);
    ellipse(a, x/4, 5, 5);
    noStroke();
    fill(255);
    rect(100, 70, 200, 50);
  }
  
    if (y<=125) {
    aSpeed=1;
  }
  if (y>=275) {
    aSpeed=-1;
  }
  noStroke();
  fill(100,255,0);
  ellipse(y, 95, 45, 45);

  y+=aSpeed;
}



