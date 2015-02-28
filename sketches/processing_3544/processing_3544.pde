
float a=10;
float b=20;
float c=30;
float d=40;

void setup(){
  size(600,600);
  background(0);
  loop();
}

void draw(){
  translate(width/2,height/2);
  fill(255,3);
  stroke(a,b,c,50);
  rotate(random(1));
  beginShape();
    vertex(a,b);
    vertex(b,c);
    vertex(c,d);
    vertex(d,b);
    vertex(a,c);
    vertex(a,d);
    vertex(c,a);
  endShape();
    a+=random(-1,1);
    b+=random(-1,1);
    c+=random(-2,2);
    d+=random(-1,1);
  }
  
void keyPressed(){
  noLoop();
}

void mousePressed(){
  loop();
}

