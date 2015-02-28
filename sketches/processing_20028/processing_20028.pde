
int nnn=100;


void setup() {
  size(640, 480);
  fill(204);
  smooth();
  noStroke();
  frameRate(30);
  background(200,0,0);
}


void draw() {
  println(mouseY);
  background(200,0,0);

  float x=0.0;
  float targetX=ceil(mouseX/70)*70;
  float nn=ceil(mouseY/70)*70;


  for (int k = 0; k < width; k+=70) {
    for (int l = 0; l< height; l+=70) {
      noStroke();
      fill(20,0,mouseX,10);

      ellipse(k,l,(x+=1)+80,(x+=1)+80);
      stroke(255,50);
      //line(k,l,x+=(targetX-x)*0.5,mouseY);
      line(k,l,x+=(targetX-x)*0.5,nn);
      fill(255,255,255,70);
      ellipse(k,l,3,3);
    }
  }
}


