
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
  
void setup() {
  size(640, 360);
  smooth();
   
  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;
   
  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}
  
void draw() {
  background(255);
  stroke(0);
  rect(rx, ry, rd, rd);
  ellipse(ex, ey, ed, ed);
  float d=dist(mouseX,mouseY, ex,ey);
  fill(255);
    if((mouseX>rx) && (mouseX<rx+100) && (mouseY>ry) && (mouseY<ry+100)) {
      fill(0);
      rect(rx-40, ry-40, rd+80, rd+80);
      //face
      stroke(255);
      fill(0);
      ellipse(rx,ry+30, 10,10); ellipse(rx+100, ry+30, 10,10); 
      arc(rx+50,ry+50, 30,30, 0, PI); 
        if(mousePressed) {
          rect(rx-40, ry-40, rd+80, rd+80); 
          line(rx-10,ry+30, rx+10,ry+30); line(rx+90, ry+30,rx+110 ,ry+30); 
      arc(rx+50,ry+60, 30,30, PI, TWO_PI); 
        }
          
      //circle
      stroke(0);
      fill(255);
      ellipse(ex, ey, ed, ed);
    
    }
    else if(d< ed) {
      fill(0);
      ellipse(ex,ey, ed+70, ed+70);
      //face
      stroke(255);
      fill(0);
      ellipse(ex-40,ey-25, 10,10); ellipse(ex+40,ey-25,10,10);
      arc(ex,ey,30,30, 0 ,PI);
      if(mousePressed) {
          ellipse(ex,ey, ed+70, ed+70);
          fill(255);
          ellipse(ex-40,ey-25, 10,10); ellipse(ex+40,ey-25,10,10); 
       line(ex,ey,ex-10,ey+15); line(ex,ey,ex+10,ey+15);
        }
      //rectanlge
      stroke(0);
      fill(255);
      rect(rx,ry,rd,rd);
      
    }
}


