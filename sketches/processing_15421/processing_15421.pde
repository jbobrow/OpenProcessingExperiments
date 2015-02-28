
int x;

void setup() {
  x=0;
  size(800,800);
  background(#FFFFFF);
}

void draw() {
  fill(255);

  x += 1;
  if (x%2 ==0) {
    //frameRate(100);

    fill(150,0,0);
  }
  if (x%3 ==0) {
    fill(#F2F218);
  }
  if (x%4 ==0) {
    fill(#2C15AF);
  }  
  stroke(#000000);
}

void mouseMoved() {

  rect(mouseX,mouseY,random(1,100),random(1,100));
}
void mouseClicked() {
  fill(0);
  rect(300,15,10,770);
  rect(650,15,10,770);
  rect(15,650,770,10);
  rect(15,350,285,10);
  rect(650,200,135,10);
  
}

                
                                
