




circle c;
ArrayList <circle> circulos;


void setup() {
  size(600, 500);
  
  circulos = new ArrayList();
  
  int count=0;
  while(count<1000){
  circle c = new circle();
  circulos.add(c);
  count+=1;
  }
  
  background(255);
}


void draw() {
 //background(255);
 
  for (circle c : circulos){
  //c.draw();
  c.dline();
  c.move();
  c.bounce();
  
  }
}













class circle {
  float x, y, diam;
  float vx, vy;

  color a;


  circle() {
    a=color(random(230, 255), random(230, 255), random(120, 255), 190);
    x= random(0, width);
    y= random(0, height);

    diam=random(1, 200);

    vx = random(-2, 2);
    vy = random(1, 2);
  }

  void draw() {

    noStroke();
    fill(a);
    ellipse(x, y, diam, diam);
  }


  void move() {
    x=x+vx;
    y=y+vy;
  }

  void bounce() {
    if (x>width || x<0) {
      vx= -vx;
    }
    if (y>height || y<0) {
      vy=-vy;
    }
  }


void dline() {
  
  stroke(40);
  strokeWeight(1);
  // Detect if the circle collides with another circle
 
 
    if (c != this && dist(x, y, mouseX, mouseY)<(diam)/2) {
      float d = dist(x, y, mouseX, mouseY);
      stroke(50,d);
      if (mousePressed){
      line(x, y, mouseX, mouseY);
    }}
  }
}




