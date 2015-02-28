
int x;
int y;
void setup() {
  size(800,800);

}

void draw() {
  background(255);
  stroke(255);

  if(keyPressed) {
    fill(48,100,26);
    x=mouseX;
    y=mouseY;
  } else {
    x=400;
    y=400;
    fill(48,139,206);
  }
  //head
  arc(x,y-140,300,300,PI,TWO_PI);
  //body
  rect(x-165,y-140,330,350);
  
  //arms

  rect(x-235,y-140,70,290);
  rect(x+165,y-140,70,290);
  
  //legs

  rect(x+22,y+210,100,150);
  rect(x-123,y+210,100,150);
  
  if(mousePressed) {
    fill(48,139,206);
    ellipse(x-45,y-225,35,30);
    ellipse(x+45,y-225,35,30);
    noFill();
    fill(0);
  } else {
    fill(255);
    ellipse(x-45,y-225,35,30);
    ellipse(x+45,y-225,35,30);
    noFill();
    fill(0);
    ellipse(x-45,y-225,10,10);
    ellipse(x+45,y-225,10,10);
    noFill();
  }
  


}

