
int shape = 1; //shape counter
int count = 1; //color counter
color c = color(255,255,255);
float xpos, ypos;
float xspeed = 10;  // Speed of the shape
float yspeed = 10;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int radx,rady;

void setup() {
   size(512, 384);
   background(51);
   noStroke();
   frameRate(30);
   ellipseMode(RADIUS);
   rectMode(RADIUS);
   xpos = width/2;
   ypos = height/2;
   radx = 10;
   rady = 10;
} 

void draw() {
  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-radx || xpos < radx) {
    xdirection *= -1;
  }
  if (ypos > height-rady || ypos < rady) {
    ydirection *= -1;
  }
  variableShape(xpos,ypos);
}

void variableShape(float x, float y) {
  if(shape == 1) {
    ellipse(x,y,radx,rady);
    if(count == 1) {
      c=color(random(255),0,0);
      fill(c);
    }
    else if(count == 2) {
      c=color(0,random(255),0);
      fill(c);
    }
    else if(count == 3) {
      c=color(0,0,random(255));
      fill(c);
    }
    else if(count == 4) {
      c=color(random(255),random(255),0);
      fill(c);
    }
    else if(count == 5) {
      c=color(random(255),0,random(255));
      fill(c);
    }
    else if(count == 6) {
      c=color(0,random(255),random(255));
      fill(c);
    }
    else if(count == 7) {
      c=color(random(255),random(255),random(255));
      fill(c);
    }
    else if(count == 8) {
      c=color(255,255,255);
      fill(c);
    }
  }
  else if(shape == 2) {
    rect(x,y,radx,rady);
    if(count == 1) {
      c=color(random(255),0,0);
      fill(c);
    }
    else if(count == 2) {
      c=color(0,random(255),0);
      fill(c);
    }
    else if(count == 3) {
      c=color(0,0,random(255));
      fill(c);
    }
    else if(count == 4) {
      c=color(random(255),random(255),0);
      fill(c);
    }
    else if(count == 5) {
      c=color(random(255),0,random(255));
      fill(c);
    }
    else if(count == 6) {
      c=color(0,random(255),random(255));
      fill(c);
    }
    else if(count == 7) {
      c=color(random(255),random(255),random(255));
      fill(c);
    }
    else if(count == 8) {
      c=color(255,255,255);
      fill(c);
    }
  }
  else if(shape == 3) {
    arc(x,y,radx,rady,radians(random(0,360)),radians(random(0,360)));
    if(count == 1) {
      c=color(random(255),0,0);
      fill(c);
    }
    else if(count == 2) {
      c=color(0,random(255),0);
      fill(c);
    }
    else if(count == 3) {
      c=color(0,0,random(255));
      fill(c);
    }
    else if(count == 4) {
      c=color(random(255),random(255),0);
      fill(c);
    }
    else if(count == 5) {
      c=color(random(255),0,random(255));
      fill(c);
    }
    else if(count == 6) {
      c=color(0,random(255),random(255));
      fill(c);
    }
    else if(count == 7) {
      c=color(random(255),random(255),random(255));
      fill(c);
    }
    else if(count == 8) {
      c=color(255,255,255);
      fill(c);
    }
  }
  radx = int(random(5,35));
  rady = int(random(5,35));
  println("X-Dir: " + xdirection + " Y-Dir: " + ydirection);
}

void keyPressed() {
  if(key == '1') {
    shape = 1;
  }
  else if(key == '2') {
    shape = 2;
  }
  else if(key == '3') {
    shape = 3;
  }
  if(key == 'q') {
    count = 1;
  }
  else if(key == 'w') {
    count = 2;
  }
  else if(key == 'e') {
    count = 3;
  }
  if(key == 'r') {
    count = 4;
  }
  else if(key == 'a') {
    count = 5;
  }
  else if(key == 's') {
    count = 6;
  }
  else if(key == 'd') {
    count = 7;
  }
  else if(keyCode == TAB) {
    count = 8;
  }
  else if(keyCode == UP) {
    ydirection++;
  }
  else if(keyCode == DOWN) {
    ydirection--;
  }
  else if(keyCode == LEFT) {
    xdirection++;
  }
  else if(keyCode == RIGHT) {
    xdirection--;
  }
  else if(keyCode == ENTER) {
    background(51);
    xpos = width/2;
    ypos = height/2;
  }
}
