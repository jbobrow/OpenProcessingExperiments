
void setup(){
  size(600, 600);
  smooth();
  background(255);
}

float rot;
void draw(){

  fill(0,50);
  rect(0, 0, width, height);
  noCursor();
  noStroke();
  translate(300,300);
  rotate(radians(rot+=0.014));

  float x[] = new float[48];
  float y[] = new float[48];

  for(int i=0; i<48; i++) {
    x[i] = 100 * sin((i+1)*7.5 *PI/180);
    y[i] = 100 * cos((i+1)*7.5 *PI/180);

    fill(i*2+130,250,0, 5);
    rect(2, 2, 9, 9);
    fill(255, 60);
    ellipse(x[i]/5, y[i]/5, 5, 5);
    fill(10,91,181, 140 + 10);
    ellipse(x[i]/2, y[i]/2, 7, 7);
    fill(10,91,181, 140 + 10);
    ellipse(x[i]/3, y[i]/3, 10, 10);
    fill(255, 140 + 10);
    ellipse(x[i]/2, y[i]/2, 6, 6);
    fill(10 * (i+1),121,131, 140 + 10);
    ellipse(x[i], y[i], 15, 15);
    rotate(radians(rot-=0.1));
    fill(10,91,181, 40);
    ellipse(x[i]*2, y[i]*2, 7, 7);
    fill(255,80);
    ellipse(x[i]*1.8, y[i]/3, 7, 7);
    rotate(radians(rot+=0.1));
    fill(10,121,181, 140 + 10);
    ellipse(x[i]*2.5, y[i]*2.5, 22, 22);
    
    fill(255,140 + 10);
    ellipse(x[i]/3, y[i]*4, 7, 7);
  }
}
