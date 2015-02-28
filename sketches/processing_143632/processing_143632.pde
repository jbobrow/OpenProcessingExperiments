
///////////////////////////
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #353 Cut-out
// http://geometrydaily.tumblr.com/post/38227555655/353-cut-out-a-new-minimal-geometric-composition
//
// Controls:
// MouseClick - new composition 
//
/////////////////////////////////////////////////


int sz = 3;
float [][] xOy;
float [][] xyLine;
color clr = #0E390C;
int bg = 235;

void setup() {
  size (700, 700);
  noLoop();
  setNewAngles();
}


void draw() {
  background(bg);
  setNewComp();
  
stroke(bg);
strokeWeight(85); 
noFill();
beginShape();
vertex(0, 0);
vertex(width, 0);
vertex(width, height);
vertex(0, height);
endShape(CLOSE);

strokeWeight(1); 
noStroke();
for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), 25);
      rect(i, j, 2, 2);
    }
  }
   
     for (int i = 0; i<30; i++) {
     fill(random(130, 215), random(100, 170));
     rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}


void setNewAngles() {
  xOy = new float [sz][2];
  xyLine = new float[sz][6];
}

void setNewComp() {
  
  for (int i=0; i<sz; ++i) {
    for (int j=0; j<1; ++j) {  
      xOy[i][j] = random (width/3, width - width/3);
      xOy[i][j+1] = random(height/3, height-height/3);
    }
  }

// another way
//  float angle = TWO_PI/sz;
//  for (int i=0; i<sz; i++) {
//    for (int j=0; j<1; ++j) { 
//      xOy[i][j] = width/2 + cos(angle*i) *  random(-width/3, width/3);
//      xOy[i][j+1] = height/2 + sin(angle*i) * random(-width/3, width/3);
//    }
//  }

  fill(clr);
  noStroke();

  beginShape(TRIANGLE_STRIP);
  for (int i =0 ; i<sz; ++i) {
    for (int j =0 ; j<1; ++j) {
      vertex(xOy[i][j], xOy[i][j+1]);
    }
  }
  endShape(CLOSE);



  for (int i=0; i<sz; i++) {    
    xyLine [i][0] = xOy[(i+1)%sz][0] - xOy[i][0];
    xyLine [i][1] = xOy[(i+1)%sz][1] - xOy[i][1];
    xyLine [i][2] = random(12, 23);
    xyLine [i][3] = -xyLine [i][0];
    xyLine [i][4] = -xyLine [i][1];
    xyLine [i][5] = random(10, 24);
  }
  
  // Ð¾Ñ�Ð¾Ð±Ñ�Ð°Ð¶ÐµÐ½Ð¸Ðµ Ð»Ð¸Ð½Ð¸Ð¹ Ð²Ð´Ð¾Ð»Ñ� Ñ�Ñ�Ð¾Ñ�Ð¾Ð½ Ñ�Ñ�ÐµÑ�Ð³Ð¾Ð»Ñ�Ð½Ð¸ÐºÐ°
  stroke(clr);
  for (int i=0; i<sz; i++) {

    line (xOy[(i+1)%sz][0] + xyLine[i][0]/10*xyLine[(i+1)%sz][2], 
          xOy[(i+1)%sz][1] + xyLine[i][1]/10*xyLine[(i+1)%sz][2], 
          xOy[i][0] + xyLine[i][3]/10*xyLine[(i+1)%sz][5], 
          xOy[i][1] + xyLine[i][4]/10*xyLine[(i+1)%sz][5]);
  }
}


void mouseClicked() {
  setNewComp();
  redraw();
}

void keyPressed() {
  if (keyCode == UP) {
    sz++;
  }
  if (keyCode == DOWN) {
    sz--;
  }
  sz = constrain(sz, 3, 10);
  setNewAngles();
  redraw();
}
