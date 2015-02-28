
int maVariable;
void setup() {
  maVariable=10;
size(1000,1000);
frameRate(50);
}
void draw(){
 maVariable=maVariable+5;
 noFill();
 stroke(random(255),random(250),random(100));
ellipse(mouseX+100,mouseY+100,maVariable+2,maVariable+5);
}
void mouseClicked(){
  maVariable=0;
}

