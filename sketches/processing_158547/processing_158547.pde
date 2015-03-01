
int perro=0;
void setup(){
size(600,600);
background(random(255),random(255),random(255));
}

void draw(){
  perro=perro+10;
  stroke(random(255),random(255),random(255));
  strokeWeight(10);
  line (perro,perro,width,height);
  line(mouseX,mouseY,width,height);
  fill(random(255),random(255),random(255));
  line(mouseY,mouseX,width/2,height/2);
    line(mouseY,mouseX,0,0);
  noStroke();
  ellipse(mouseY,mouseX,100,100);
}

