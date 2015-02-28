
int x = 0; // x position
int y = 0; // y position

int speed = 100;

int state = 0;


int r;
int g;
int b;

void setup () {
  size (500,500);
}

void draw () 
{
  background(0);
  noStroke();
  
  if( mouseX > 250 && mouseY > 250) 
  { fill(2,104,57);
    rect(250,250,width/2,height/2);
  }
  
  if( mouseX > 250 && mouseY < 250)
  { fill(88,0,138);
    rect(250,0,width/2,height/2);
  }
  
  if( mouseX < 250 && mouseY > 250) 
  { fill(88,0,138);
    rect(0,250,width/2,height/2);
  }
  
  if( mouseX < 250 && mouseY < 250 && mouseY < 500 ) 
  { fill(2,104,57);
    rect(0,0,width/2,height/2);
  }
  
  
    fill(r,g,b);
    ellipse(pmouseX,pmouseY,30,30);
    r = int(random(0,255));
    g = int(random(0,255));
    b = int(random(0,255));
}

void mousePressed() {
  if (mouseButton == LEFT)  {
    fill(r,g,b);
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
     y = 450;
     x = 0;
   state = 2;
  } 
  } else if (state == 2) {
    x = x + speed;
  if (x > width-50) {
     y = 450;
     x = 450;
     state = 3;
  }
  } else if (state == 3) {
     x = 0;
     y = 0;
    state = 0;
  }
}
}

