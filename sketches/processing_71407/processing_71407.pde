
int sizeX= 500;
int sizeY= 500;
fairy[] fairies = new fairy[200]; //an array of fairy objects
boolean drawingNet = false; //becomes true when the user clicks
net activeNet;

void setup() {
  //I used variables for the size so I can refer to them later 
  //when I'm making sure the fairies don't go offscreen
  size(500, 500);
  background(0);
  smooth();
  //fills the array with fairies created at random positions
  for (int i =0; i<200; i++) {
    fairies[i] = new fairy(random(0, sizeX), random(0, sizeY), random(-1.5, 1.5), random(-1.5, 1.5), random(0, 20));
  }
}

void draw() {
background(0);
  //call react
  //check if user is drawing circle 
  for (fairy each : fairies) {
    each.react();
  }

  if (!(activeNet==null)) {
    activeNet.drawNet();
  }
}

void mousePressed() {
  drawingNet = true;
  activeNet = new net(mouseX, mouseY);
}

void mouseReleased() {
  drawingNet = false;
  activeNet.closeNet();
}

//-------------------------------------------------------------//
class net {
  boolean closed;

  float centerX;
  float centerY;

  float rad;

  //constructor
  net(float x, float y) {
    centerX = x;
    centerY = y;
    closed = false;
  }

  void drawNet() {
    stroke(216, 191, 216);
    strokeWeight(3);
    noFill();
    if (closed) {
      ellipse(centerX, centerY, rad, rad);
    }
    else {
      float temp = dist(centerX, centerY, mouseX, mouseY);
        ellipse(centerX, centerY, 2*temp,2*temp);
      }  
  }

  void closeNet() {
    closed = true;
    drawingNet=false;
    if (mouseX>centerX) {
      rad=2*(dist(centerX, centerY, mouseX, mouseY)+ random(-50,10));
    }
    else {
      rad=centerX-mouseX;
    }
  }
}


//-------------------------------------------------------------//
class fairy {
  boolean trapped = false;
  float xpos;
  float ypos;

  float xstep;
  float ystep;

  float breath;//the count that goes up
  float b =0.01;//how much the count goes up by
  float a;//the opacity

  float inner = 5;
  float outer = 20;


  //constructor, 
  //gets passed the initial x and y position of the fairy
  //the initial speed and where the transparency starts
  fairy(float x, float y, float x2, float y2, float i) {
    xpos = x;
    ypos = y;
    xstep = x2;
    ystep = y2;
    breath = i;
  }

  //this makes the fairy move 
  //and changes its direction if it's about to go out of bounds
  void react() {
    breathe();
    outOfBounds();
    if (trapped) {
      b= b+0.01;
      xstep = xstep*1.01;
      ystep = ystep*1.01;
    }
    xpos = xpos+xstep;
    ypos = ypos+ystep;
    //possible colour 221-160-221 
    fill(216, 191, 216);
    noStroke();
    ellipse(xpos, ypos, inner, inner);
    fill(216, 191, 216,a);
    ellipse(xpos, ypos, outer, outer);
  }


  //if the fairy is about to go offscreen or run in to the edge 
  //of a net it turns it around. 
  void outOfBounds() {
    if (trapped) {
      //makes sure the fairy doesn't go outside the net
      if (xpos+xstep>activeNet.rad/2) {
        xstep = xstep*-1;
      }
      if (ypos+ystep>activeNet.rad/2) {
        ystep = ystep*-1;
      }
    }
    else {
      if (xpos+xstep<0 || xpos+xstep>sizeX) {
        xstep = xstep*-1;
      }
      if (ypos+ystep<0 || ypos+ystep>sizeY) {
        ystep = ystep*-1;
      }
      if (!(activeNet==null)) {
        if (dist(xpos+xstep, ypos+ystep, activeNet.centerX, activeNet.centerY)<activeNet.rad/2) {
          ystep = ystep*-1;
          xstep = xstep*-1;
        }
      }
    }
  }

  //the glow around the fairy fades in and out 
  //to look like the fairy is breathing
  void breathe() {
    a = sin(breath)*255;
    //uses a sin wave to change the transparency smoothly;
    breath= breath+b;
  }
}
