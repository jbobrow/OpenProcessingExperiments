
int ko;

void setup() {
  ko=10;
  size(850,850);
  noStroke();
}
void draw() {
  ko = ko+2;
rect(random(1000),random(1000), random(250),random(350)); 
  fill((ko+100),random(100),80,8);
};

void mouseClicked(){
  fill(0,0,0,30); 
  ellipse((mouseX),(mouseY),250,250);
 
};
