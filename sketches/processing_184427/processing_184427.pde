
//Week1 


int x = 10; //xposition
int y = 10; //yposition
void setup(){
  background(255,255,0);
  size(640,480);
  print("setup done!");
  frameRate(30);
}

void draw(){//executed every frame
  x = mouseX;
  y = mouseY;
  background(mouseX/3,mouseX/3,0);
  print1n("Start to draw");
  rectMode(CENTER);
  fill (0,255,0);
  rect(x,y,100,100);
  fill(255,255,255);
  rect(X-30,y,10,10);
  rect(X+30,y,10,10);
  
}

//event function
