
//dana gloria 


int directionX;
int directionY;
int X;
int Y;

void setup () {
size (600,600);
background (3,155,118);
smooth ();
stroke(255);

directionX= 1;
directionY= 1;

X = 10;
Y= 60;
}

void draw () {
  X+= directionX;
  Y+= directionY;
  
ellipse(X,Y,80,80);

fill(178,65,240);

if(Y > 600) {
  directionY = -1;
}
if(X > 600) {
  directionX= -1;
}
if(Y < 1) {
  directionY= 1;
}
if(X < 1) {
  directionY= 1;
}

}


