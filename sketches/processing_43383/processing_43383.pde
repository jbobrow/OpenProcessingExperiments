
float points[];
float clickx[];
float clicky[];
int counter;

void setup(){
  size(400, 400);
  stroke(0);
  counter = 0;
  points = new float [56];
  points[0] = 0;
  points[1] = 0;
  points[2] = 50;
  points[3] = 0;
  points[4] = 0;
  points[5] = 0;
  points[6] = 25;
  points[7] = 0;
  points[8] = 18;
  points[9] = -20;
  points[10] = 45;
  points[11] = -20;
  points[12] = 18;
  points[13] = -20;
  points[14] = 18;
  points[15] = -25;
  points[16] = 0;
  points[17] = -12;
  points[18] = 0;
  points[19] = 12;
  points[20] = -9;
  points[21] = -9;
  points[22] = 9;
  points[23] = 9;
  points[24] = 50;
  points[25] = -12;
  points[26] = 50;
  points[27] = 12;
  points[28] = 59;
  points[29] = -9;
  points[30] = 41;
  points[31] = 9;
  points[32] = 16;
  points[33] = -25;
  points[34] = 50;
  points[35] = -2;
  points[36] = 45;
  points[37] = -24;
  points[38] = 45;
  points[39] = -10;
  points[40] = 50;
  points[41] = 0;
  points[42] = 50;
  points[43] = 0;
  points[44] = 9;
  points[45] = -10;
  points[46] = -9;
  points[47] = 10;
  points[48] = 59;
  points[49] = 9;
  points[50] = 41;
  points[51] = -9;
  points[52] = 45;
  points[53] = -24;
  points[54] = 50;
  points[55] = -26;

  clickx = new float [1000];
  clicky = new float [1000];
}

void draw() {
  background (255);

  for (int i=0; i<counter; i++){
    placeRubberStamp (clickx[i], clicky[i]);
    clickx[i]++;
  }
}
void mousePressed() {
  clickx [counter] = mouseX;
  clicky [counter] = mouseY;
  counter++;
}
void placeRubberStamp (float px, float py){
  smooth();

  beginShape(TRIANGLE_STRIP);
  stroke(102,153,0);
  noFill();
  vertex(points [4] + px, points [5] + py);//frame
  vertex(points [6] + px, points [7] + py);//frame
  vertex(points [8] + px, points [9] + py);//frame
  vertex(points [10] + px, points [11] + py);//frame
  endShape();
  line(points [12] + px, points [13] + py, points [14] + px, points [15] + py);//seat post
  noFill();
  beginShape();
  curveVertex(points [34] + px, points [35] + py);//fork
  curveVertex(points [36] + px, points [37] + py);//fork
  curveVertex(points [38] + px, points [39] + py);//fork
  curveVertex(points [40] + px, points [41] + py);//fork
  curveVertex(points [42] + px, points [43] + py);//fork
  endShape();

  stroke(100);
  noFill();
  ellipseMode(CENTER);
  ellipse(points [0] + px, points [1] + py, 25, 25);//wheel
  ellipse(points [2] + px, points [3] + py, 25, 25);//wheel

  line(points [16] + px, points [17] + py, points [18] + px, points [19] + py);//spoke
  line(points [20] + px, points [21] + py, points [22] + px, points [23] + py);//spoke
  line(points [24] + px, points [25] + py, points [26] + px, points [27] + py);//spoke
  line(points [28] + px, points [29] + py, points [30] + px, points [31] + py);//spoke
  line(points [44] + px, points [45] + py, points [46] + px, points [47] + py);//spoke
  line(points [48] + px, points [49] + py, points [50] + px, points [51] + py);//spoke

  stroke(153,153,51);
  fill(51,51,0);
  ellipseMode(CORNER);
  ellipse(points [32] + px, points [33] + py, 8, 3); //seat
  line(points [52] + px, points [53] + py, points [54] + px, points [55] + py);//spoke
}
void keyPressed (){
  counter = 0;
}


