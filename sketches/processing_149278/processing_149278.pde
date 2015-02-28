
int x=0;
int y=0;

void setup() {  
  size(250, 250);  
}

void draw() {  
  background(255);
  fill (0);
  rect (x,y,10,10);
  x=constrain (x, 0, 240);
  y=constrain (y, 0, 240);
  }

void keyPressed () {
    switch (key) {
        case 'w':
            y=y-5;
            break;
        case 'a':
            x=x-5;
            break;
        case 's':
            y=y+5;
            break;
        case 'd':
            x=x+5;
            break;
    }
}
