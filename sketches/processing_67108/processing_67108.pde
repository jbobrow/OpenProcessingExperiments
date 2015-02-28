
//  Countdown (actually up)
//  Jonathan Bobrow
//
//  The following code creates the 10 digits using a series of
//  twelve points.  Note that the 8 is only creatable to an incomplete
//  eight with this many points.  I welcome some clever alternatives.
//  I would like to see this used for an HH:MM:SS clock :)

int [][] x;
int [][] y;
int [] drawX;
int [] drawY;
float ease = .3;
int k = 0;

int seconds = 0;

void setup(){
  smooth();
  size(480,360);
  background(0);
  
  x = new int[12][12];
  y = new int[12][12];
  drawX = new int[12];
  drawY = new int[12];
  
  for(int l=0; l<12; l++){
    drawX[l]=0;
    drawY[l]=0;
  }
  
  //nine
  x[9][0]=0;     y[9][0]=0;
  x[9][1]=100;   y[9][1]=0;
  x[9][2]=100;   y[9][2]=190;
  x[9][3]=90;    y[9][3]=190;
  x[9][4]=90;    y[9][4]=100;
  x[9][5]=0;     y[9][5]=100;
  x[9][6]=0;     y[9][6]=10;
  x[9][7]=10;    y[9][7]=10;
  x[9][8]=10;    y[9][8]=90;
  x[9][9]=90;    y[9][9]=90;
  x[9][10]=90;   y[9][10]=10;
  x[9][11]=0;    y[9][11]=10; 
  //eight
  x[8][0]=0;     y[8][0]=0;
  x[8][1]=0;     y[8][1]=190;
  x[8][2]=100;   y[8][2]=190;
  x[8][3]=100;   y[8][3]=0;
  x[8][4]=90;    y[8][4]=0;
  x[8][5]=90;    y[8][5]=90;
  x[8][6]=10;    y[8][6]=90;
  x[8][7]=10;    y[8][7]=100;
  x[8][8]=90;    y[8][8]=100;
  x[8][9]=90;    y[8][9]=180;
  x[8][10]=10;   y[8][10]=180;
  x[8][11]=10;   y[8][11]=0; 
  //seven
  x[7][0]=0;     y[7][0]=0;
  x[7][1]=10;    y[7][1]=0;
  x[7][2]=90;    y[7][2]=0;
  x[7][3]=100;   y[7][3]=0;
  x[7][4]=100;   y[7][4]=10;
  x[7][5]=100;   y[7][5]=100;
  x[7][6]=100;   y[7][6]=190;
  x[7][7]=90;    y[7][7]=190;
  x[7][8]=90;    y[7][8]=100;
  x[7][9]=90;    y[7][9]=10;
  x[7][10]=10;   y[7][10]=10;
  x[7][11]=0;    y[7][11]=10;  
  //six
  x[6][0]=0;     y[6][0]=0;
  x[6][1]=0;     y[6][1]=190;
  x[6][2]=100;   y[6][2]=190;
  x[6][3]=100;   y[6][3]=90;
  x[6][4]=10;    y[6][4]=90;
  x[6][5]=10;    y[6][5]=100;
  x[6][6]=90;    y[6][6]=100;
  x[6][7]=90;    y[6][7]=180;
  x[6][8]=10;    y[6][8]=180;
  x[6][9]=10;    y[6][9]=10;
  x[6][10]=100;  y[6][10]=10;
  x[6][11]=100;  y[6][11]=0;
  //five
  x[5][0]=0;     y[5][0]=0;
  x[5][1]=0;     y[5][1]=100;
  x[5][2]=90;    y[5][2]=100;
  x[5][3]=90;    y[5][3]=180;
  x[5][4]=0;     y[5][4]=180;
  x[5][5]=0;     y[5][5]=190;
  x[5][6]=100;   y[5][6]=190;
  x[5][7]=100;   y[5][7]=90;
  x[5][8]=10;    y[5][8]=90;
  x[5][9]=10;    y[5][9]=10;
  x[5][10]=100;  y[5][10]=10;
  x[5][11]=100;  y[5][11]=0;
  //four
  x[4][0]=0;     y[4][0]=0;
  x[4][1]=0;     y[4][1]=100;
  x[4][2]=90;    y[4][2]=100;
  x[4][3]=90;    y[4][3]=180;
  x[4][4]=90;    y[4][4]=190;
  x[4][5]=100;   y[4][5]=190;
  x[4][6]=100;   y[4][6]=100;
  x[4][7]=100;   y[4][7]=0;
  x[4][8]=90;    y[4][8]=0;
  x[4][9]=90;    y[4][9]=90;
  x[4][10]=10;   y[4][10]=90;
  x[4][11]=10;   y[4][11]=0;
  //three
  x[3][0]=0;     y[3][0]=0;
  x[3][1]=0;     y[3][1]=10;
  x[3][2]=90;    y[3][2]=10;
  x[3][3]=90;    y[3][3]=90;
  x[3][4]=0;     y[3][4]=90;
  x[3][5]=0;     y[3][5]=100;
  x[3][6]=90;    y[3][6]=100;
  x[3][7]=90;    y[3][7]=180;
  x[3][8]=0;     y[3][8]=180;
  x[3][9]=0;     y[3][9]=190;
  x[3][10]=100;  y[3][10]=190;
  x[3][11]=100;  y[3][11]=0;
  //two
  x[2][0]=0;     y[2][0]=0;
  x[2][1]=0;     y[2][1]=10;
  x[2][2]=90;    y[2][2]=10;
  x[2][3]=90;    y[2][3]=90;
  x[2][4]=0;     y[2][4]=90;
  x[2][5]=0;     y[2][5]=190;
  x[2][6]=100;   y[2][6]=190;
  x[2][7]=100;   y[2][7]=180;
  x[2][8]=10;    y[2][8]=180;
  x[2][9]=10;    y[2][9]=100;
  x[2][10]=100;  y[2][10]=100;
  x[2][11]=100;  y[2][11]=0;
  //one
  x[1][0]=0;     y[1][0]=0;
  x[1][1]=0;     y[1][1]=10;
  x[1][2]=45;    y[1][2]=10;
  x[1][3]=45;    y[1][3]=90;
  x[1][4]=45;    y[1][4]=180;
  x[1][5]=0;     y[1][5]=180;
  x[1][6]=0;     y[1][6]=190;
  x[1][7]=100;   y[1][7]=190;
  x[1][8]=100;   y[1][8]=180;
  x[1][9]=55;    y[1][9]=180;
  x[1][10]=55;   y[1][10]=90;
  x[1][11]=55;   y[1][11]=0;
  //zero
  x[0][0]=0;     y[0][0]=0;
  x[0][1]=0;     y[0][1]=190;
  x[0][2]=100;    y[0][2]=190;
  x[0][3]=100;    y[0][3]=0;
  x[0][4]=10;    y[0][4]=0;
  x[0][5]=10;     y[0][5]=10;
  x[0][6]=90;     y[0][6]=10;
  x[0][7]=90;   y[0][7]=90;
  x[0][8]=90;   y[0][8]=180;
  x[0][9]=10;    y[0][9]=180;
  x[0][10]=10;   y[0][10]=90;
  x[0][11]=10;   y[0][11]=0;
}

void draw(){
  background(0);
  brackets();
  transform(k);
  drawNumber(k); 
  if(millis() - seconds*1000 > 1000){
    seconds++;
    if(k>8)
      k=0;
    else
      k++;
  }
 
}

void next(){
  k++;
}

void drawNumber(int i){
  pushMatrix();
  translate(width/2-50, height/2-95);
  beginShape();
    for(int j=0; j<12; j++){
    vertex(drawX[j],drawY[j]);
    } 
  endShape();
  popMatrix();
}

void transform(int i){
  for(int j=0; j<12; j++){
    drawX[j] += int((x[i][j]-drawX[j])*ease);
    drawY[j] += int((y[i][j]-drawY[j])*ease);
  }
}

void mousePressed(){
  next();
}

void brackets(){
    noStroke();
  fill(255);
  beginShape();
    vertex(10,10);
    vertex(100,10);
    vertex(100,20);
    vertex(20,20);
    vertex(20,100);
    vertex(10,100);
    vertex(10,10);
  endShape();
  
  beginShape();
    vertex(width-10,10);
    vertex(width-100,10);
    vertex(width-100,20);
    vertex(width-20,20);
    vertex(width-20,100);
    vertex(width-10,100);
    vertex(width-10,10);
  endShape();
  
  beginShape();
    vertex(10,height-10);
    vertex(100,height-10);
    vertex(100,height-20);
    vertex(20,height-20);
    vertex(20,height-100);
    vertex(10,height-100);
    vertex(10,height-10);
  endShape();
  
  beginShape();
    vertex(width-10,height-10);
    vertex(width-100,height-10);
    vertex(width-100,height-20);
    vertex(width-20,height-20);
    vertex(width-20,height-100);
    vertex(width-10,height-100);
    vertex(width-10,height-10);
  endShape(); 
}

