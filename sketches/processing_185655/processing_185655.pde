

void setup() {
  size(1081,676);
  colorMode(HSB);
}

void draw() { 
  float aleatorio=random(100,150);
  float x = random(0,width);
  float y = random(0,height);
  background(aleatorio,255,255);
  ellipse(x,y,50,50);
  fill(0,56,0);
  rect (225,200,300,300);
  for (int i = 60;i>0;i=i-1) {
    println(i);
    ellipse(300, 300, i, i);
    ellipse(450,300,i,i);
    fill((i/2)+(mouseX/3), 255, 255);
    rect (280,400,200,50);
    stroke((i/2)+(mouseX/3), 255, 255);
  }
}

