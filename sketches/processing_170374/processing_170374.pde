
Ball[] aBall = new Ball[5];
boolean globalGrow = true;
int totalBalls = 0;


void setup() {
  size(400, 400);
  smooth();

  // Initialize balls
  for (int i = 0; i < aBall.length; i ++ ) { // Initialize each Car using a for loop.
    aBall[i] = new Ball();
  }
}

void draw() {
  background(255);

  if (globalGrow == true) {
    for (int i = 0; i <aBall.length; i++) {
      aBall[i].sizeIt();
    }
  }

  for (int i = 0; i < aBall.length; i++)
  {
    for (int j = i+1; j < aBall.length; j++)
    {
      if (aBall[i].intersect(aBall[j]))
      {
        color c = color(random(255), random(255), random(255));
        aBall[i].resetMe(c);
        aBall[j].resetMe(c);
      }
    }
  }

  for (int i = 0; i < aBall.length; i++)
  {
    aBall[i].display();
  }
}
void mousePressed() {
  if (globalGrow == true) {
    globalGrow = false;
  } else {
    globalGrow = true;
  }
}

class Ball {
float r; // radius
float x,y;
color c;

Ball() {
resetMe(color(random(255),random(255),random(255)));
}

void sizeIt() {
r+=1;
}
void resetMe(color tempC){
r = 0;
x = random(width);
y = random(height);
c = tempC;
}

void display() {
noStroke();
fill(c);
ellipse(x,y,r*2,r*2);
}

boolean intersect(Ball b) {
// Objects can be passed into functions as arguments too! 
float distance = dist(x,y,b.x,b.y); // Calculate distance

// Compare distance to sum of radii
if (distance < r + b.r) {
return true;
} 
else {
return false;
}
}
}




