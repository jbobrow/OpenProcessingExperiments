
/*array com 4*4 elementos */
//0 top left
//3  top right
//1 bottom left
//2 bottom right

int Bits[] = {
  0, 1, 0, 1, 
  2, 3, 2, 3, 
  0, 1, 0, 1, 
  2, 3, 2, 3
};

float lsize = 85;
float qsize = 60;


PShape logo;
long lastTime;
long accTime;

float v=1;
boolean invertColor = false;

void setup() {
  size(1000, 600);
  background(255);
  smooth();
  logo = loadShape("logo.svg");
  randss();
  redraw();
  //noLoop();
  lastTime = millis();
  accTime = millis();
}


void draw() {
  //println(frameRate);
  if (invertColor)
    background(0);
  else
    background(255);

  pushMatrix();
  translate(width/3, height/2);
  drawTriangle(Bits);
  drawSquare();

  logo.disableStyle();
  if (invertColor) {
    stroke(255);
    fill(255);
  }
  else {
    stroke(0);
    fill(0);
  }  
  shape(logo, -logo.width/2+qsize*4+3*qsize*4/4, -logo.height/2);
  popMatrix();

  if (millis()-lastTime < 5000) {
    v+=exp(0.0005*millis());
    //  println(v); 
    if (millis() - accTime > v) {
      accTime=millis();
      randss();
    }
  }
  else {
    noLoop();
  }
}

void drawSquare() {
  pushMatrix();

  translate(-qsize*4/2, -qsize*4/2);
  for (int x = 0; x < 4; x++) {
    for (int y = 0; y < 4; y++) {
      if (x % 3 == 0 ||y % 3 == 0) {
        pushStyle();
        noStroke();
        if (invertColor){
          fill(255, 255, 255,140);
        }else{
          fill(0, 0, 0, 200);
        }
        pushMatrix();
        translate(x*qsize, y*qsize);

        beginShape(QUADS);

        vertex(0, 0);
        vertex(0, qsize);
        if(invertColor){
          vertex(qsize+0.15, qsize);
          vertex(qsize+0.15, 0);
        }else{
          vertex(qsize+0.35, qsize);
          vertex(qsize+0.35, 0);
        }

        endShape(CLOSE);

        //rect(0,0,qsize+1,qsize);
        popMatrix();
        popStyle();
      }
    }
  }
  popMatrix();
}


void drawTriangle(int bits[]) {
  pushMatrix();
  rotate(PI/4);

  translate(-lsize*4/2, -lsize*4/2);
  for (int x = 0; x < 4; x++) {
    for (int y = 0; y < 4; y++) {
      int i = x + y*4;
      pushStyle();
      if (invertColor) {
        stroke(70, 70, 70);
        fill(70, 70, 70);
      }
      else {
        stroke(141, 141, 141);
        fill(141, 141, 141);
      }
      pushMatrix();
      translate(x*lsize, y*lsize);
      beginShape(TRIANGLES);
      switch(bits[i]) {

      case 0:
        // bottom right
        //triangle(lsize, lsize, 0, lsize, lsize, 0);
        vertex(lsize, lsize);
        vertex(0, lsize);
        vertex(lsize, 0);


        break;
      case 1:
        ///bottom left
        //triangle(0, 0, 0, lsize, lsize, lsize);
        vertex(0, 0);
        vertex(0, lsize);
        vertex(lsize, lsize);
        break;
      case 2:
        //top right
        //triangle(0, 0, lsize, 0, lsize, lsize);
        vertex(0, 0);
        vertex(lsize, 0);
        vertex(lsize, lsize);
        break;
      case 3:
        //top left
        //triangle(0, 0, lsize, 0, 0, lsize);
        vertex(0, 0);
        vertex(lsize, 0);
        vertex(0, lsize);
        break;
      }
      endShape(CLOSE);
      popStyle();
      popMatrix();
    }
  }
  popMatrix();
}



/*leva l1 para l2 */
void transposeRow(int bits[], int r0, int r1) {
  int temp[] = new int[4];

  for (int x=0;x<4;x++) {
    //keep the values from row r0 on temp
    int i = x + r0*4;
    temp[x] = bits[i];

    // put on row r0 values from row r1
    int i2 = x + r1*4;
    bits[i] = bits[i2];
    //put on row r1 values from r0 i.e. from temp
    bits[i2] = temp[x];
  }
}

void transposeColumn(int bits[], int c0, int c1) {
  int temp[] = new int[4];

  for (int y=0;y<4;y++) {
    //keep the values from column c1 on temp
    int i = c0 + y*4;
    temp[y] = bits[i];

    //put on column c0 values from column c1
    int i2 = c1 + y*4;
    bits[i] = bits[i2];

    //put on column c1 values from column c0 i.e. temp
    bits[i2] = temp[y];
  }
}

void transposeQuadrant(int bits[], int q0, int q1) {
  int temp[] = new int[4];

  //given a q0 - quadrant 0,1,2,3 
  // |0|1|
  // |2|3|
  //returns x,y initial coordinates 
  // |00|10|20|30|
  // |01|11|21|31|
  // |02|12|22|32|
  // |03|13|23|33| 

  int x0q0 = (q0%2)*2;
  int y0q0;
  if (q0>1) {
    y0q0 =2;
  }
  else {
    y0q0 =0;
  }

  int x0q1 = (q1%2)*2;
  int y0q1;
  if (q1>1) {
    y0q1 =2;
  }
  else {
    y0q1 =0;
  }

  int c=0; 
  for (int i = 0; i < 2; i++) {
    for (int j = 0; j < 2; j++) {
      temp[c] = bits[x0q0+i + (y0q0+j)*4];
      //println((x0q0+i)+ " " + (y0q0+j));
      bits[x0q0+i + (y0q0+j)*4] = bits[x0q1+i + (y0q1+j)*4];
      bits[x0q1+i + (y0q1+j)*4] = temp[c];
      c++;
    }
  }
}



void randss() {
  transposeRow(Bits, (int)random(0, 4), (int)random(0, 4));
  transposeColumn(Bits, (int)random(0, 4), (int)random(0, 4));
  transposeQuadrant(Bits, (int)random(0, 4), (int)random(0, 4));
}

void mousePressed() {
  randss();
  redraw();
}

void keyPressed() {
  if (key == ' ') {
    randss();
  }
  else if (key == 'r') {
    transposeRow(Bits, (int)random(0, 4), (int)random(0, 4));
  }
  else if (key == 'c') {
    transposeColumn(Bits, (int)random(0, 4), (int)random(0, 4));
  }
  else if (key=='q') {
    //println(
    transposeQuadrant(Bits, (int)random(0, 4), (int)random(0, 4));
  }
  else if (key =='s') {
    save("diamond-"+hour()+minute()+second()+".tiff"  );
  }
  else if (key == 'i') {
    invertColor = !invertColor;
  }
  redraw();
}

