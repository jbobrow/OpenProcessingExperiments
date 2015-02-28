

float radius = 150;
float centx, centy;
float xx,yy;
float rad = 0;
float step = random(radians(10));


void setup() {
  size(500, 300);
  centx = width/2;
  centy = height/2;
  frameRate(30);
  strokeWeight(0.1);
  background(255);
  stroke(100,100);
  strokeCap(PROJECT);
  fill(255,0);
}

void mousePressed() { 
  radius = random(50) + 20;
  strokeWeight(0.1);
  stroke(100,100);
  centx = mouseX;
  centy = mouseY;
}

void keyPressed(){
  save("tmp.jpg");
}

void draw(){

  float starta,stopa;
  float a;
  
  a = random(height);
  starta = radians(random(-360,360));
  stopa = radians(random(-360,360));
  fill(255,0);  // toggle the space color
 
  stroke(random(255),random(255)); 
  strokeWeight(random(2));

  arc(centx,centy,a,a,starta,stopa);
  
  stroke(random(255),random(255));
  strokeWeight(random(4));
  float dis = random(10);  
  arc(centx,centy,a-a/dis,a-a/dis,starta,stopa);
  
  stroke(random(255),random(255),random(255),random(255));
  strokeWeight(random(1));    
  float xx = centx+(a*cos(starta)+a*cos(stopa))/2;
  float yy = centy+(a*sin(starta)+a*sin(stopa))/2;
  line(centx,centy,xx,yy);
  fill(random(255),random(255),random(255),random(255));
  ellipse(xx,yy,random(20),random(20));

  
  
}

