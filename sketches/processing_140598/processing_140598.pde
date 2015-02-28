

float radius = 50;
float centx, centy;
float xx,yy;
float rad = 0;
float step = random(radians(10));


void setup() {
  size(500,300);
  centx = width/2;
  centy = height/2;
  frameRate(30);
  strokeWeight(0.1);
  background(255);
  stroke(100,100);
  fill(255,0);
  ellipse(centx,centy,radius*2,radius*2);
}

void mousePressed() { 
  radius = random(50) + 10;
  strokeWeight(0.1);
  stroke(100,100);
  centx = mouseX;
  centy = mouseY;
  ellipse(centx,centy,radius*2,radius*2);
}

void keyPressed(){
  save("tmp.jpg");
}

void draw(){
  float ox,oy,x,y;
  stroke(0.3,50); 
  float angle = random(radians(360)); 

  ox = centx + radius * cos(angle);
  oy = centy + radius * sin(angle);
  x = ox; y = oy;

  for(float i = 0; i<= radians(1*360); i+=step){
    xx = centx + radius * cos(i) + random(-10,10);
    yy = centy + radius * sin(i) + random(-10,10);
    line(x,y,xx,yy);
    x = xx; y = yy;
  }  
  
}

