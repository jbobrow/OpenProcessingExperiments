
//float x;
//float y;
float angle=0.0;


void setup() {
  size(640, 360);
  smooth();
  background(255);
}


void draw() {
  //float x=mouseX;
  //float ax=map(mouseX,0,width,0,200);
  //float ay=map(mouseY,0,width,0,100);
  strokeWeight(12);

  //1
  stroke(238, 77, 155);
  fill(238, 77, 155);
  rect(6, 6, 148, 78);


  //2
  stroke(141, 215, 247);
  fill(248, 158, 92);
  rect(166, 6, 148, 78);

  //3
  stroke(247, 183, 211);
  fill(115, 118, 184);
  rect(326, 6, 148, 78);

  //4
  stroke(21, 190, 206);
  fill(141, 215, 247);
  rect(486, 6, 148, 78);
  
  
  //5
  stroke(248, 158, 92);
  fill(141, 215, 247);
  rect(6, 96, 148, 78);


  //6
  stroke(115, 118, 184);
  fill(115, 118, 184);
  rect(166, 96, 148, 78);
  
    //7
  stroke(255, 214, 104);
  fill(248, 158, 92);
  rect(326, 96, 148, 78);
  
    //8
  stroke(166, 209, 119);
  fill(238, 77, 155);
  rect(486, 96, 148, 78);
  
    //9
  stroke(255, 214, 104);
  fill(238, 77, 155);
  rect(6, 186, 148, 78);
  
    //10
  stroke(247, 183, 211);
  fill(248, 158, 92);
  rect(166, 186, 148, 78);
  
    //11
  stroke(21, 190, 206);
  fill(238, 77, 155);
  rect(326, 186, 148, 78);
  
    //12
  stroke(115, 118, 184);
  fill(248, 158, 92);
  rect(486, 186, 148, 78);

    //13
  stroke(141, 215, 247);
  fill(141, 215, 247);
  rect(6, 276, 148, 78);
  
    //14
  stroke(166, 209, 119);
  fill(115, 118, 184);
  rect(166, 276, 148, 78);
  
    //15
  stroke(238, 77, 155);
  fill(141, 215, 247);
  rect(326, 276, 148, 78);
  
    //16
  stroke(248, 158, 92);
  fill(115, 118, 184);
  rect(486, 276, 148, 78);
  
  draw1();
  draw2();
  draw3();
  draw4();
  draw5();
  draw6();
  draw7();
  draw8();
  draw9();
  draw10();
  draw11();
  draw12();
  draw13();
  draw14();
  draw15();
  draw16();
  draw17();
  draw18();
  draw19();
  draw20();
  draw21();
  draw22();
  draw23();
  draw24();
  draw25();
  draw26();
  draw27();
  draw28();
  draw29();
  draw30();
  draw31();
  draw32(); 
  draw33(); 
 
}


void draw1() {
  noStroke();
  pushMatrix();
  translate(160, 90);
  rotate(angle);
  angle+=0.01;


  fill(248, 158, 92);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();


}

void draw2() {

  pushMatrix();
  translate(0, 0);
  rotate(angle);
  angle+=0.01;

  fill(141, 215, 247);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();

}


void draw3() {
  pushMatrix();
  translate(321, 0);
  rotate(angle);
  angle+=0.01;

  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(238, 77, 155);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(141, 215, 247);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(166, 209, 119);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}

void draw4() {
  
  pushMatrix();
  translate(160, 90);
  rotate(angle);
  angle+=0.01;
  
  fill(247, 183, 211);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(248, 158, 92);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(115, 118, 184);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}



  //3

void draw5() {
  pushMatrix();
  translate(480, 90);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(166, 209, 119);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(247, 183, 211);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}

void draw6() {
  pushMatrix();
  translate(320, 0);
  rotate(angle);
  angle+=0.01;
  
  fill(238, 77, 155);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(247, 183, 211);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
}



  //4

void draw7() {
  pushMatrix();
  translate(640, 0);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(115, 118, 184);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(247, 183, 211);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(21, 190, 206);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(238, 77, 155);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}

void draw8() {
  pushMatrix();
  translate(480, 90);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(115, 118, 184);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}




  //5
void draw9() {
  pushMatrix();
  translate(0, 180);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(115, 118, 184);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(247, 183, 211);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(21, 190, 206);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(238, 77, 155);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}


void draw10() {
  pushMatrix();
  translate(160, 90);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(115, 118, 184);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}





  //6
void draw11() {
  pushMatrix();
  translate(160, 90);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(166, 209, 119);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(247, 183, 211);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
}

void draw12() {
  pushMatrix();
  translate(320, 180);
  rotate(angle);
  angle+=0.01;
  
  fill(238, 77, 155);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(247, 183, 211);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}



  //7

void draw13() {
  pushMatrix();
  translate(320, 180);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(238, 77, 155);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(141, 215, 247);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(166, 209, 119);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}


void draw14() {
  pushMatrix();
  translate(480, 90);
  rotate(angle);
  angle+=0.01;
  
  fill(247, 183, 211);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(248, 158, 92);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(115, 118, 184);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}



  //8

void draw15() {
  pushMatrix();
  translate(480, 90);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
} 
  
void draw16() {
  pushMatrix();
  translate(640, 180);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}

//9
void draw17() {
  pushMatrix();
  translate(0, 180);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(141, 215, 247);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
}

void draw18() {
  pushMatrix();
  translate(160, 270);
  rotate(angle);
  angle+=0.01;
  
  fill(247, 183, 211);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}



  //10

void draw19() {
  pushMatrix();
  translate(160, 270);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(115, 118, 184);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(166, 209, 119);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(238, 77, 155);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}

void draw20() {
  pushMatrix();
  translate(320, 180);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}



  //11

void draw21() {
  pushMatrix();
  translate(320, 180);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(115, 118, 184);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(247, 183, 211);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
}

void draw22() {
  pushMatrix();
  translate(480, 270);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}



  //12
void draw23() {
  pushMatrix();
  translate(480, 270);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(166, 209, 119);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(247, 183, 211);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(238, 77, 155);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}

void draw24() {
  pushMatrix();
  translate(640, 180);
  rotate(angle);
  angle+=0.01;
  
  fill(238, 77, 155);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(247, 183, 211);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}


  //13

void draw25() {
  pushMatrix();
  translate(160, 270);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(166, 209, 119);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(255, 214, 104);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(247, 183, 211);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(238, 77, 155);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}

void draw26() {
  pushMatrix();
  translate(0, 360);
  rotate(angle);
  angle+=0.01;
  
  fill(238, 77, 155);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(248, 158, 92);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(247, 183, 211);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(21, 190, 206);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}



  //14

void draw27() {
  pushMatrix();
  translate(320, 360);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(115, 118, 184);
  arc(0,0, 264, 144, PI, PI+HALF_PI);
  fill(247, 183, 211);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}

void draw28() {
  pushMatrix();
  translate(160, 270);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
}




  //15

void draw29() {
  pushMatrix();
  translate(480, 270);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, HALF_PI, PI);
  fill(115, 118, 184);
  arc(0, 0, 232, 126, HALF_PI, PI);
  fill(166, 209, 119);
  arc(0, 0, 200, 108, HALF_PI, PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, HALF_PI, PI);
  fill(238, 77, 155);
  arc(0, 0, 136, 72, HALF_PI, PI);
  fill(141, 215, 247);
  arc(0, 0, 104, 54, HALF_PI, PI);
  popMatrix();
}

void draw30() {
  pushMatrix();
  translate(320, 360);
  rotate(angle);
  angle+=0.01;
  
  fill(141, 215, 247);
  arc(0, 0, 264, 144, PI+HALF_PI, TWO_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, PI+HALF_PI, TWO_PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, PI+HALF_PI, TWO_PI);
  fill(166, 209, 119);
  arc(0, 0, 168, 90, PI+HALF_PI, TWO_PI);
  fill(248, 158, 92);
  arc(0, 0, 136, 72, PI+HALF_PI, TWO_PI);
  fill(115, 118, 184);
  arc(0, 0, 104, 54, PI+HALF_PI, TWO_PI);
  popMatrix();
}



  //16

void draw31() {
  pushMatrix();
  translate(640, 360);
  rotate(angle);
  angle+=0.01;
  
  noStroke();
  fill(248, 158, 92);
  arc(0, 0, 264, 144, PI, PI+HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 232, 126, PI, PI+HALF_PI);
  fill(141, 215, 247);
  arc(0, 0, 200, 108, PI, PI+HALF_PI);
  fill(21, 190, 206);
  arc(0, 0, 168, 90, PI, PI+HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 136, 72, PI, PI+HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 104, 54, PI, PI+HALF_PI);
  popMatrix();
}

void draw32() {
  pushMatrix();
  translate(480, 270);
  rotate(angle);
  angle+=0.01;
  
  fill(247, 183, 211);
  arc(0, 0, 264, 144, 0, HALF_PI);
  fill(255, 214, 104);
  arc(0, 0, 232, 126, 0, HALF_PI);
  fill(238, 77, 155);
  arc(0, 0, 200, 108, 0, HALF_PI);
  fill(248, 158, 92);
  arc(0, 0, 168, 90, 0, HALF_PI);
  fill(115, 118, 184);
  arc(0, 0, 136, 72, 0, HALF_PI);
  fill(166, 209, 119);
  arc(0, 0, 104, 54, 0, HALF_PI);
  popMatrix();
}

void draw33() {
  stroke(248, 158, 92);
  noFill();
  rect(486, 276, 148, 78);

  stroke(238, 77, 155);
  noFill();
  rect(6, 6, 148, 78);

  stroke(141, 215, 247);
  noFill();
  rect(166, 6, 148, 78);

  stroke(247, 183, 211);
  noFill();
  rect(326, 6, 148, 78);

  stroke(21, 190, 206);
  noFill();
  rect(486, 6, 148, 78);

  stroke(248, 158, 92);
  noFill();
  rect(6, 96, 148, 78);

  stroke(115, 118, 184);
  noFill();
  rect(166, 96, 148, 78);

  stroke(255, 214, 104);
  noFill();
  rect(326, 96, 148, 78);

  stroke(166, 209, 119);
  noFill();
  rect(486, 96, 148, 78);

  stroke(255, 214, 104);
  noFill();
  rect(6, 186, 148, 78);

  stroke(247, 183, 211);
  noFill();
  rect(166, 186, 148, 78);

  stroke(21, 190, 206);
  noFill();
  rect(326, 186, 148, 78);

  stroke(115, 118, 184);
  noFill();
  rect(486, 186, 148, 78);

  stroke(141, 215, 247);
  noFill();
  rect(6, 276, 148, 78);

  stroke(166, 209, 119);
  noFill();
  rect(166, 276, 148, 78);

  stroke(238, 77, 155);
  noFill();
  rect(326, 276, 148, 78);
}
