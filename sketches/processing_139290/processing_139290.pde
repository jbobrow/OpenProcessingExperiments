
color colors[];
int count = 17;
void setup() {
  size(600,600);
  ellipseMode(CENTER);
  background(0);
  colors = new color[2*count];
  colorMode(HSB,3400);
  for(int i=0; i<colors.length;i++){
    colors[i] = color(100*i,3400,3400);
  }
}

void draw() {
  fill(0,0,0,80);
  rect(0,0,width,height);
  translate(width/2, height/2);
  for (int i = 0; i<count;i++) {
    rotate(PI/count);
    noFill();
    stroke(colors[i]);
    noStroke();
    fill(colors[i]);
    float a = map((millis()+1000*i)%(count*400), 0, (count*400), 0, TWO_PI);
    ellipse(75*cos(a), 250*sin(a), 20, 20);
    fill(colors[i+17]);
    ellipse(75*cos(a+PI), 250*sin(a+PI), 20, 20);
  }
}

