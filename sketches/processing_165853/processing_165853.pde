
void setup(){
  background(100,200,100);
  size(500,500);
  smooth();
  ellipseMode(CENTER);
  noStroke();
  frameRate(120);
};
int X = 250;
int Y = 250;
void draw(){
  background(100,200,100);
  ellipse(X,Y,100,100);
  if(mousePressed){ 
  if((mouseY <= Y+50 && mouseY >= Y-50) && (mouseX <= X+50 && mouseX >= X-50)){   
    X = mouseX;
    Y = mouseY;
     fill(mouseX,150,mouseY);
  }
  else {
    ellipse(mouseX,mouseY,(int)random(0,20),(int)random(0,20));
  };
};
};



