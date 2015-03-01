
int x1, x2, x3, x4, x5, x6, x7, x8, x9;
int y1, y2, y3, y4, y5, y6, y7, y8, y9;
float[][] Xindex;
float[][] Yindex;
float[][] X2index;
float[][] Y2index;
float size;
float Rsize;
int speed;
int points;
float Nsx;
void setup() {
  size(400, 400);
  Xindex = new float[60][60];
  Yindex = new float[60][60];
  X2index = new float[60][60];
  Y2index = new float[60][60];
  
  speed = 1;
}


void draw() {
  background(0);
  fill(0, 0, 0, 0);
  stroke(255);
  Rsize = size/2.6;
  size = mouseY/2;
  //size += speed;
  points = mouseX/10;
  for(int j = 0; j < width; j = j+50) {
   line(j,0,j,height); 
  }


  pushMatrix();
  pentagon(width/2, height/2, size, points);
  popMatrix();
 

  pushMatrix();
  translate(width,height);
  rotate(radians(180));
  reversePentagon(0,0,Rsize,5);
  popMatrix();

  star();
  reverseStar();
  coordinates();
}

//modified shape function from processing documentation
void pentagon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  println(npoints);
  if(npoints ==5) {
    fill(255,0,0,100);}
    else if(npoints < 5 ||npoints > 5) {
     fill(0,0,0,0); 
    }
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius; //calculate x coordinate
    float sy = y + sin(a) * radius; //calculate y coordinate
    vertex(sx, sy); //draw the line
    for (int b = 0; b < npoints; b++) {
      Xindex[int(a)][b] = sx; //store x coordinate in an array
      Yindex[int(a)][b] = sy; //store y coordinate in an array
        ellipse(sx, sy, 10+a, 10+a); //determine the starting point
      //line(sx, sy, mouseX, mouseY); //draw the pentagon
    }
  }
  endShape(CLOSE);
}


void reversePentagon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = width/2 + cos(a) * radius; //calculate x coordinate
    float sy = width/2 + sin(a) * radius; //calculate y coordinate
    vertex(sx, sy); //draw the line
    for (int b = 0; b < npoints; b++) {
      X2index[int(a)][b] = sx; //store x coordinate in an array
      Y2index[int(a)][b] = sy; //store y coordinate in an array
      
        ellipse(sx, sy, 10+a, 10+a); //determine the starting point
      //line(sx, sy, mouseX, mouseY); //draw the pentagon
    }
  }
  endShape(CLOSE);
}

void star() {
  //store x coordinate inside of a variable
  x1 = int(Xindex[0][0]);
  x2 = int(Xindex[1][1]);
  x3 = int(Xindex[2][2]);
  x4 = int(Xindex[3][3]);
  x5 = int(Xindex[4][4]);
  x6 = int(Xindex[5][5]);
  x7 = int(Xindex[6][6]);
  x8 = int(Xindex[7][7]);
  x9 = int(Xindex[8][8]);
  
  //store y coordinate inside of a variable
  y1 = int(Yindex[0][0]);
  y2 = int(Yindex[1][1]);
  y3 = int(Yindex[2][2]);
  y4 = int(Yindex[3][3]);
  y5 = int(Yindex[4][4]);
  y6 = int(Yindex[5][5]);
  y7 = int(Xindex[6][6]);
  y8 = int(Xindex[7][7]);
  y9 = int(Xindex[8][8]);
  //draw the star inside of the pentagon based on the stored coordinate values
  beginShape();
    vertex(x1,y1);
    vertex(x3,y3);
    //vertex(x5,y5); value is missing in the array, so define the points individualy
    vertex(width/2 + cos(5.0265484)*size,height/2 + sin(5.0265484)*size);
    vertex(x2,y2);
    vertex(x4,y4);
  endShape(CLOSE);
  /*
  println(x1,y1);
  println(x2,y2);
  println(x3,y3);
  println(x4,y4);
  println(x5,y5);
  */
}

void reverseStar() {
  //store x coordinate inside of a variable
  x1 = int(X2index[0][0]);
  x2 = int(X2index[1][1]);
  x3 = int(X2index[2][2]);
  x4 = int(X2index[3][3]);
  x5 = int(X2index[4][4]);
  x6 = int(X2index[5][5]);
  
  //store y coordinate inside of a variable
  y1 = int(Y2index[0][0]);
  y2 = int(Y2index[1][1]);
  y3 = int(Y2index[2][2]);
  y4 = int(Y2index[3][3]);
  y5 = int(Y2index[4][4]);
  y6 = int(Y2index[5][5]);
  
  //draw the star inside of the pentagon based on the stored coordinate values
  beginShape();
  translate(width,height);
    rotate(radians(180));
    vertex(x1,y1);
    vertex(x3,y3);
    //vertex(x5,y5); value is missing in the array, so define the points individualy
    vertex(width/2 + cos(5.0265484)*Rsize,height/2 + sin(5.0265484)*Rsize);
    vertex(x2,y2);
    vertex(x4,y4);
  endShape(CLOSE);
  /*
  println(x1,y1);
  println(x2,y2);
  println(x3,y3);
  println(x4,y4);
  println(x5,y5);
  */
}

void coordinates() {
  fill(255);
  text(mouseX, mouseX+20, mouseY);
  text(mouseY, mouseX+20, mouseY+20);
}





