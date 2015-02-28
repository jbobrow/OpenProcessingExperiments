
//for animating setting

int elements = 1000;
float x[] = new float[elements];
float y[] = new float[elements];
int numpoints = 0;
boolean animate = false;
float headx = 0;
float heady = 0;
int head = 0;
float penx = 0;
float peny = 0;

//start to set up

void setup() {
  size(1000, 1000);
}

//setting about mouse control
void mousePressed() {

  numpoints = 0;
  head = 0;
  
  headx = mouseX;
  heady = mouseY;
  
  animate = false;
}

void mouseReleased() {
  animate = true;
}

void mouseDragged() {
 
  x[numpoints] = mouseX - pmouseX;
  y[numpoints] = mouseY - pmouseY;
 
  numpoints += 1;
}

//setting about moving body
void drawsegments(int from, int to) {
  for (int i = from; i < to; i++) {
    fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
    rect(penx, peny, random(10,50), random(10,50));
  
    penx += x[i];
    peny += y[i];
  }
}
//let's draw
void draw() {
//for the renewal a screen each frame. because of this,unfortunately I throw up my lastest work concept.
  background(170);
  fill(0);
  noStroke();

  //moving option
  if (animate && numpoints > 1) {
 
    headx += x[head];
    heady += y[head];

 
    if (headx > width) {
      headx -= width-1;
    } 
    else if (headx < 0) { 
      headx += width-1;
    } 
    else if (heady > height) { 
      heady -= height-1;
    } 
    else if (heady < 0) { 
      heady += height-1;
    }


    head = head + 10;
    if (head >= numpoints) { 
      head = 0;
    }
  }

 
  penx = headx;
  peny = heady;

 //draw
  drawsegments(head, numpoints);
  drawsegments(0, head);

  rect(penx, peny, 5, 5);
  fill(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
}
