
int x = 0; // x position
int y = 0; // y position

int speed = 3;

int state = 0;

void setup(){
  size(400,400);

}

void draw() {
  background (88,0,138);

//das 4eck
noStroke();
fill(2,104,57);
rect(x,y,50,50);
if(state == 0 ) {
  x = x + speed;
  if (x > width-50) {
    x = width-50;
    state = 1;
    }
} else if (state == 1) {
  y = y + speed - 2;
  x = x - speed + 1;
  if (x < 0) {
   y = 175;
   x = 0;
   state = 2;
  } 
} else if (state == 2) {
    x = x + speed;
  if (x > width-50) {
   y = 175;
   x = 350;
   state = 3;
}
} else if (state == 3) {
  y = y + speed - 2;
  x = x - speed + 1;
  if (x < 0) {
   y = 350;
   x = 0;
   state = 4;
}
} else if (state == 4) {
    x = x + speed;
  if (x > width-50) {
   y = 350;
   x = 350;
   state = 5;
}
} else if (state == 5) {
  x = 0;
  y = 0;
  state = 0;
}
}


