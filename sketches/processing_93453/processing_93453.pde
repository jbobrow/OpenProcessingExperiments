
//variables - always set up before voide setup
int x;
int y;
//x and y = mouseX and mouseY

//void setup - initial conditions
void setup(){
  size(300,300);
  rectMode(CENTER);
  x = 150;
  y = 200;
  //x = 150;
  //y = 150;
  //want x and y variables to move - put in void draw, where
  // x =mouseX; and y = mouseY;
}

void draw(){
  //x =mouseX;
  //y =mouseY;
  background(255);
  rect(x,y,125,100);

//head
ellipseMode(CENTER);
ellipse(x,y-100,50,75);

//eyes
//fill(r,g,b); -- error: "cannot find anything named "r"
ellipse(x-10,y-100,10,10);
ellipse(x+10,y-100,10,10);
//noFill();

//add one to the x position
//x = random(300);
//error ^ so, can convert random function into int e.g. int(random(300)); therefore:
//x = int(random(300));
y=y-1;

//change colour variable - error: "cannot find anything named "r"
//r = int(random(255));
//g = int(random(255));
//b = int(random(255));
}


