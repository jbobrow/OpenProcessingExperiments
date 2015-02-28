
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width

float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter

float v1 = 358;
float v2 = 0;
float v3 = 99;




void setup() {
  size(640, 360);
  noStroke();
  smooth();
  ellipseMode(RADIUS);

  colorMode(HSB, 100);

  // Set the x- and y-coordinates for the rectangle
  rx = width * 0.33 - rd/2;
  ry = height * 0.5 - rd/2;

  // Set the x- and y-coordinates for the ellipse
  ex = width * 0.66;
  ey = height * 0.5;
}

void draw() {
  background(v3, v2, v1);



  rect(rx, ry, rd, rd);
  if ((mouseX>rx)&&(mouseX<rx+rd)&&(mouseY>ry)&&(mouseY<ry+rd))
  {
    rx=rx+1;
  }
 if ((mouseX>rx)&&(mouseX<rx+rd)&&(mouseY>ry)&&(mouseY<ry+rd)&& mousePressed==true)
  {
   

    rd=rd+1;
  }



  fill(v1, v2, v3);
  ellipse(ex, ey, ed/2, ed/2);

  float d = dist(mouseX, mouseY, ex, ey);



  
    //ellipse mod
  if (d<(ed/2) && (d>0) && (mousePressed == true))
  {
       ed = ed-1;


    v2=v2+1;
    v1=v2+v2/9;
  }
  if (d<(ed/2) && (d>0) && (mousePressed == false))
  {
    fill(255,0,0);
  }
  else{
   fill(255,0,0);
   ellipse(ex, ey, ed/2, ed/2);
   


  }
}


