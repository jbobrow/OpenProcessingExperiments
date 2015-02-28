
//by Elaine(Lei Zhao)
//UCLA SUMMDER 2012
// Pressing Control-R will render this sketch.

//Game Rules
//The white circle and rectangle move into different direction automatically,
//When your mouse is inside the white circle or white rectangle, they get to move into the opposite direction.
//Try to make the white rectangle move into the grey rectangle and at the same time, the white circle into the grey circle.
//Then you will have some surprise~~~

float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

int r = 102;    //coclor for the final smiling face
int g = 102;    //coclor for the final smiling face
int b = 102;    //coclor for the final smiling face
  
void setup() {
  size(640, 360);
  smooth();
  noStroke();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(102);
  
  //draw the moving rectangle(white)
  fill(255);
  rect(rx, ry, rd, rd);
  
  //draw the stable rectangle(grey)
  fill(200);
  rect(400, 100, 1.5*rd, 1.5*rd);
  
  //draw the moving circle(white)
  fill(255);
  ellipse(ex, ey, ed, ed);
  
   //draw the moving circle(grey)
  fill(200);
  ellipse(160,180,1.5*ed,1.5*ed);
  
  //redraw the moving rectangle when mouse over it
  fill(255);
  //to judge whether the mouse is in the region of moving rect
  if(mouseX>rx && mouseX<(rx+rd) && mouseY>ry && mouseY<(ry+rd)){
    //if in, goes right
    rx +=2;
    rect(rx,ry,rd,rd);
  }else{
    //if out, goes left
    rx--;
    rect(rx,ry,rd,rd);
  }
  
  //to judge whether the mouse is in the region of moving circle
  if(mouseX>(ex-ed/2) && mouseX<(ex+ed/2) && mouseY>(ey-ed/2) && mouseY<(ey+ed/2)){
    //if in, goes left
    ex -= 2;
    ellipse(ex, ey, ed, ed);
  }else{
    //if out, goes right
    ex++;
    ellipse(ex, ey, ed, ed);
  }
  
  //to judge whether the moving circle is inside the stable circle
  //AND at the SAME TIME, the moving rect is inside the stable rect
  if(rx>400 && rx<(400+0.5*rd) && ex>(160-0.5*ed) && ex<(160+0.5*ed)){
    //if both in, draw a smiling face
    //change the color parameter, the color turns from grey to red
    r++;
    g -= 1;
    b -= 1;
    fill(r,g,b);
    //draw two eyes
    ellipse(295,30,10,10);
    ellipse(320,30,10,10);
    //draw mouth
    noFill();
    stroke(r,g,b);
    strokeWeight(3);
    strokeCap(ROUND);
    arc(307,45,35,25,PI/5,4*PI/5);
    noStroke();
  }
  
}




