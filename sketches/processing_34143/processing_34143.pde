


void setup() {
  smooth();
  size(800, 800);
 PImage myImage = loadImage("background.jpg");
 image(myImage,0,0);

  
  
 
}
void draw() {
  if ( key == '1') {
    noStroke();
    smooth();
    fill(255, 0, 0,160);
    ellipse(mouseX, mouseY, 20, 20);
  }
   if ( key == '2') {
   noStroke();
   smooth();
   fill(234,63,0,160);
   ellipse(mouseX,mouseY,20,20);
 
  //if (mousePressed==true
}
  if (key =='3') {
    noStroke();
    smooth();
    fill(250,255,0,160);
    ellipse(mouseX,mouseY,20,20);
  }
  if (key == '4') {
    noStroke();
    smooth();
    fill(0,255,18,160);
    ellipse(mouseX,mouseY,20,20);
  }
  if (key == '5') {
    noStroke();
    smooth();
    fill(0,53,255,160);
    ellipse(mouseX,mouseY,20,20);
  }
  if (key == '6') {
    noStroke();
    smooth();
    fill(109,0,255,160);
    ellipse(mouseX,mouseY,20,20);
  }
  if (key =='7'){
    noFill();
  }
  if (key =='8'){
    noStroke();
    smooth();
    fill(255);
    ellipse(mouseX,mouseY,20,20);
    
  }
  if (key =='9'){
    noStroke();
    smooth();
  fill(181,227,246);
  ellipse(mouseX,mouseY,210,20);
  
}
  if (key =='0') {
    background(181,227,246);
  }
  if (key =='p' || key =='P') {
    saveFrame("myMonster-####.jpg");
  }
}
void keyTyped() {
  if (key == 'a'|| key =='A') {
    aEye(mouseX, mouseY);
  }
  if (key=='s') {
    sEye(mouseX, mouseY);
  }
  if (key=='S') {
    srEye(mouseX, mouseY);
  }
  if (key=='D') {
    dEye(mouseX-30, mouseY+20);
  }
  if (key=='d') {
    drEye(mouseX-45, mouseY+20);
  }
  if (key =='f') {
    fEye(mouseX, mouseY);
  }
  if (key == 'F') {
    frEye(mouseX,mouseY);
}
  if (key =='g') {
    gEye(mouseX,mouseY);
}
   if (key =='l') {
     lEar (mouseX,mouseY);
}
  if (key =='L') {
    lrEar (mouseX,mouseY);
}
  if (key =='k') {
    kEar (mouseX,mouseY);
}
  if (key =='K') {
    krEar (mouseX,mouseY);
}
  if (key =='j') {
    jEar (mouseX,mouseY);
}
  if (key =='J') {
    jrEar (mouseX,mouseY);
}
  if (key =='z') {
    zHair (mouseX,mouseY);
}
  if (key=='x') {
  xHair (mouseX,mouseY);
}
  if (key=='X') {
    xrHair(mouseX,mouseY);
}
  if (key =='m') {
    mMouth (mouseX,mouseY);
}
  if (key == 'M') {
    mmMouth (mouseX,mouseY);
}
  if (key =='n') {
    nMouth (mouseX,mouseY);
   
}
  if (key =='q') {
    qBody (mouseX-100,mouseY+150);
  }
  if (key=='w') {
    wBody (mouseX-150, mouseY+300);
  }
  if (key =='e') {
  eBody (mouseX, mouseY);
}
  
}
void aEye(int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  fill(255);
  ellipse(circX, circY, 45, 72);
  fill(0);
  ellipse(circX, circY+20, 30, 30);
  fill(255);
  noStroke();
  ellipse(circX, circY+25, 8, 10);
  
}
void sEye(int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  fill(255);
  ellipse(circX, circY, 64, 64);
  fill(0);
  ellipse(circX+12, circY+16, 25, 25);
  fill(255);
  noStroke();
  ellipse(circX+17, circY+22, 8, 8);
  stroke(1);
  line(circX-30, circY-10, circX+30, circY-8);
  line(circX-25, circY-10, circX-45, circY-25);
  line(circX-10, circY-8, circX-30, circY-30);
  line(circX, circY-8, circX-25, circY-40);
}
void srEye(int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  fill(255);
  ellipse(circX, circY, 64, 64);
  fill(0);
  ellipse(circX-12, circY+16, 25, 25);
  fill(255);
  noStroke();
  ellipse(circX-16, circY+22, 8, 8);
  stroke(1);
  line(circX-30, circY-8, circX+30, circY-10);
  line(circX+25, circY-10, circX+45, circY-30);
  line(circX+10, circY-8, circX+30, circY-30);
  line(circX, circY-8, circX+25, circY-40);
}
void dEye (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX, circY);
  curveVertex(circX, circY);
  curveVertex(circX+11, circY-24);
  curveVertex(circX+11, circY-24);
  curveVertex(circX+26, circY-40);
  curveVertex(circX+44, circY-44);
  curveVertex(circX+67, circY-40);
  curveVertex(circX+85, circY-24);
  curveVertex(circX+90, circY);
  curveVertex(circX, circY);
  curveVertex(circX, circY);
  endShape();
  fill(0);
  ellipse(circX+30, circY-20, 40, 20);
  noStroke();
  fill(255);
  ellipse(circX+20, circY-22, 8, 4);
}
void drEye (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX, circY);
  curveVertex(circX, circY);
  curveVertex(circX+90, circY);
  curveVertex(circX+85, circY-24);
  curveVertex(circX+67, circY-40);
  curveVertex(circX+44, circY-44);
  curveVertex(circX+26, circY-40);
  curveVertex(circX+11, circY-24);
  curveVertex(circX+11, circY-24);
  curveVertex(circX, circY);
  curveVertex(circX, circY);
  endShape();
  fill(0);
  ellipse(circX+65, circY-20, 40, 20);
  noStroke();
  fill(255);
  ellipse(circX+75, circY-22, 8, 4);
}

void fEye (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  fill(255);
  ellipse(circX, circY, 71, 35);
  fill(0);
  ellipse(circX+28, circY+2, 16, 16);
  fill(0);
  rect(circX-30, circY-20, 60, 10);
}
void frEye (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  fill(255);
  ellipse(circX,circY,71,35);
  fill(0);
  ellipse(circX-28, circY+2, 16, 16);
  fill(0);
  rect(circX-30, circY-20,60,10);
}
void gEye (int circX, int circY) {
  stroke (1); 
  strokeWeight(4);
  fill(255);
  ellipse (circX,circY,62,62);
  ellipse (circX+2,circY-1, 50,50);
  fill(0);
  line (circX-10, circY-8, circX+10, circY+8);
  line (circX-6,circY+8, circX+10, circY-8);
}
void lEar (int circX, int circY) {
  stroke (1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX-26,circY-18);
  curveVertex(circX-54,circY);
  curveVertex(circX-54,circY+21);
  curveVertex(circX-54,circY+41);
  curveVertex(circX-30,circY+53);
  curveVertex(circX,circY+36);
  curveVertex(circX,circY+36);
  endShape();
  beginShape();
  curveVertex(circX-30,circY+30);
  curveVertex(circX-30,circY+30);
  curveVertex(circX-35,circY+32);
  curveVertex(circX-35,circY+28);
  curveVertex(circX-30,circY+26);
  curveVertex(circX-30,circY+26);
  endShape();
  line(circX-30,circY+10,circX-30,circY+26);
}
void lrEar (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill ();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX+26,circY-18);
  curveVertex(circX+54,circY);
  curveVertex(circX+54,circY+21);
  curveVertex(circX+54,circY+41);
  curveVertex(circX+30,circY+53);
  curveVertex(circX,circY+36);
  curveVertex(circX,circY+36);
  endShape();
  beginShape();
  curveVertex(circX+30,circY+30);
  curveVertex(circX+30,circY+30);
  curveVertex(circX+35,circY+32);
  curveVertex(circX+35,circY+28);
  curveVertex(circX+30,circY+26);
  curveVertex(circX+30,circY+26);
  endShape();
  line(circX+30,circY+10,circX+30,circY+26);
}
void kEar (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX-24,circY-36);
  curveVertex(circX-38,circY);
  curveVertex(circX-38,circY);
  endShape();
  beginShape();
  curveVertex(circX-20,circY-30);
  curveVertex(circX-20,circY-30);
  curveVertex(circX-24,circY-24);
  curveVertex(circX-27,circY-12);
  curveVertex(circX-24,circY);
  curveVertex(circX-24,circY);
  endShape();
}
void krEar (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX+24,circY-36);
  curveVertex(circX+38,circY);
  curveVertex(circX+38,circY);
  endShape();
  beginShape();
  curveVertex(circX+20,circY-30);
  curveVertex(circX+20,circY-30);
  curveVertex(circX+24,circY-24);
  curveVertex(circX+27,circY-12);
  curveVertex(circX+24,circY);
  curveVertex(circX+24,circY);
  endShape();
}
void jEar (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX-15,circY-18);
  curveVertex(circX-32,circY);
  curveVertex(circX-36,circY+14);
  curveVertex(circX-33,circY+36);
  curveVertex(circX-22,circY+49);
  curveVertex(circX-7,circY+35);
  curveVertex(circX-7,circY+35);
  endShape();
  beginShape();
  curveVertex(circX-15,circY-5);
  curveVertex(circX-15,circY-5);
  curveVertex(circX-23,circY+20);
  curveVertex(circX-20,circY+36);
  curveVertex(circX-20,circY+36);
  endShape();
}
void jrEar (int circX, int circY) {
stroke(1);
strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX+15,circY-18);
  curveVertex(circX+32,circY);
  curveVertex(circX+36,circY+14);
  curveVertex(circX+33,circY+36);
  curveVertex(circX+22,circY+49);
  curveVertex(circX+7,circY+35);
  curveVertex(circX+7,circY+35);
  endShape();
  beginShape();
  curveVertex(circX+15,circY-5);
  curveVertex(circX+15,circY-5);
  curveVertex(circX+23,circY+20);
  curveVertex(circX+20,circY+36);
  curveVertex(circX+20,circY+36);
  endShape();
}
void zHair (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  line(circX,circY,circX-4,circY-33);
  line(circX+9,circY-65,circX,circY-7);
  line(circX,circY-12,circX+6,circY-35);
  line(circX+1,circY-10,circX+27,circY-33);
  line(circX+8,circY-18,circX+35,circY-53);
  line(circX+3,circY-6,circX+36,circY-36);
  line(circX+9,circY-4,circX+43,circY-29);
  line(circX,circY-7,circX-18,circY-34);
  line(circX,circY,circX-27,circY-38);
  line(circX-9,circY-10,circX-36,circY-56);
  line(circX-6,circY-1,circX-35,circY-56);
  line(circX-8,circY-5,circX-45,circY-28);
  line(circX-10,circY-23,circX-43,circY-22);
}
void xHair (int circX, int circY) {
  stroke (1);
  strokeWeight(4);
  noFill();
  line(circX,circY,circX-51,circY+2);
  line(circX+2,circY-1,circX-19,circY-22);
  line(circX+1,circY+1,circX-37,circY-20);
  line(circX-15,circY-1,circX-43,circY-9);
  line(circX-5,circY+5,circX-44,circY+16);
  line(circX-6,circY+9,circX-27,circY+23);
  line(circX,circY,circX-20,circY+34);
}
void xrHair (int circX, int circY) {
  stroke (1);
  strokeWeight(4);
  noFill();
  line(circX,circY,circX+60,circY+2);
  line(circX-2,circY-1,circX+19,circY-22);
  line(circX-1,circY+1,circX+37,circY-20);
  line(circX+15,circY-1,circX+43,circY-9);
  line(circX+5,circY+5,circX+44,circY+16);
  line(circX+2,circY+9,circX+35,circY+23);
  line(circX,circY,circX+30,circY+25);
}
void mMouth (int circX, int circY) {
  stroke (1);
  strokeWeight(4);
  noFill();
  line(circX,circY,circX+93,circY);
  line(circX+11,circY,circX+29,circY+42);
  line(circX+29,circY+42,circX+46,circY);
  line(circX+46,circY,circX+65,circY+42);
  line(circX+65,circY+42,circX+83,circY);
}
void mmMouth (int circX, int circY) {
  stroke (1);
  strokeWeight(4);
  noFill();
  line(circX,circY,circX+108,circY);
  line(circX+36,circY,circX+54,circY+43);
  line(circX+54,circY+43,circX+71,circY);
}
void nMouth (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  ellipse(circX,circY,93,40);
  line(circX-36,circY-11,circX-23,circY+2);
  line(circX-23,circY+2,circX-20,circY-18);
  line(circX-20,circY-18,circX-13,circY+4);
  line(circX-13,circY+4,circX,circY-19);
  line(circX,circY-19,circX+10,circY+2);
  line(circX+10,circY+2,circX+20,circY-17);
  line(circX+20,circY-17,circX+20,circY+3);
  line(circX+20,circY+3,circX+39,circY-8);  
  line(circX-30,circY+13,circX-19,circY+3);
  line(circX-19,circY+3,circX-14,circY+18);
  line(circX-8,circY+19,circX,circY+1);
  line(circX,circY+1,circX+11,circY+18);
  line(circX+15,circY+18,circX+17,circY+4);
  line(circX+17,circY+4,circX+28,circY+15);
}
void qBody (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX-1,circY-19);
  curveVertex(circX-7,circY-126);
  curveVertex(circX+4,circY-218);
  curveVertex(circX+42,circY-288);
  curveVertex(circX+81,circY-312);
  curveVertex(circX+183,circY-316);
  curveVertex(circX+223,circY-288);
  curveVertex(circX+268,circY-216);
  curveVertex(circX+278,circY-125);
  curveVertex(circX+277,circY-19);
  curveVertex(circX+277,circY-19);
  endShape();
  beginShape();
  curveVertex(circX-1,circY-19);
  curveVertex(circX-1,circY-19);
  curveVertex(circX-39,circY+12);
  curveVertex(circX-87,circY+33);
  curveVertex(circX-118,circY+37);
  curveVertex(circX-136,circY+29);
  curveVertex(circX-159,circY+6);
  curveVertex(circX-175,circY+24);
  curveVertex(circX-170,circY+33);
  curveVertex(circX-148,circY-101);
  curveVertex(circX-45,circY+43);
  curveVertex(circX+22,circY+18);
  curveVertex(circX+59,circY-23);
  curveVertex(circX+59,circY-23);
  endShape();
  beginShape();
  curveVertex(circX+59,circY-23);
  curveVertex(circX+59,circY-23);
  curveVertex(circX+84,circY+10);
  curveVertex(circX+95,circY+64);
  curveVertex(circX+40,circY+107);
  curveVertex(circX-10,circY+122);
  curveVertex(circX-35,circY+133);
  curveVertex(circX-58,circY+94);
  curveVertex(circX-50,circY+127);
  curveVertex(circX-20,circY+146);
  curveVertex(circX+40,circY+141);
  curveVertex(circX+84,circY+128);
  curveVertex(circX+136,circY+96);
  curveVertex(circX+150,circY+66);
  curveVertex(circX+152,circY+29);
  curveVertex(circX+138,circY-18);
  curveVertex(circX+138,circY-18);
  endShape();
  beginShape();
  curveVertex(circX+138,circY-18);
  curveVertex(circX+138,circY-18);
  curveVertex(circX+204,circY+66);
  curveVertex(circX+233,circY+88);
  curveVertex(circX+354,circY+108);
  curveVertex(circX+397,circY+125);
  curveVertex(circX+390,circY+152);
  curveVertex(circX+362,circY+167);
  curveVertex(circX+416,circY+167);
  curveVertex(circX+442,circY+147);
  curveVertex(circX+436,circY+130);
  curveVertex(circX+414,circY+100);
  curveVertex(circX+362,circY+73);
  curveVertex(circX+255,circY+41);
  curveVertex(circX+191,circY+4);
  curveVertex(circX+183,circY-37);
  curveVertex(circX+183,circY-37);
  endShape();
  beginShape();
  curveVertex(circX+183,circY-37);
  curveVertex(circX+183,circY-37);
  curveVertex(circX+209,circY-10);
  curveVertex(circX+246,circY+7);
  curveVertex(circX+311,circY+12);
  curveVertex(circX+355,circY-8);
  curveVertex(circX+389,circY-38);
  curveVertex(circX+460,circY+1);
  curveVertex(circX+519,circY+53);
  curveVertex(circX+522,circY+35);
  curveVertex(circX+490,circY+3);
  curveVertex(circX+437,circY-54);
  curveVertex(circX+382,circY-75);
  curveVertex(circX+344,circY-60);
  curveVertex(circX+327,circY-33);
  curveVertex(circX+284,circY-26);
  curveVertex(circX+262,circY-42);
  curveVertex(circX+252,circY-67);
  curveVertex(circX+252,circY-67);
  endShape();
  
}
void wBody (int circX, int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  beginShape();
  curveVertex(circX,circY);
  curveVertex(circX,circY);
  curveVertex(circX+5,circY-256);
  curveVertex(circX-66,circY-314);
  curveVertex(circX-92,circY-345);
  curveVertex(circX-37,circY-377);
  curveVertex(circX+49,circY-314);
  curveVertex(circX+79,circY-382);
  curveVertex(circX-52,circY-508);
  curveVertex(circX-10,circY-538);
  curveVertex(circX+109,circY-402);
  curveVertex(circX+123,circY-404);
  curveVertex(circX+96,circY-636);
  curveVertex(circX+165,circY-626);
  curveVertex(circX+181,circY-545);
  curveVertex(circX+179,circY-401);
  curveVertex(circX+224,circY-552);
  curveVertex(circX+265,circY-639);
  curveVertex(circX+339,circY-600);
  curveVertex(circX+257,circY-372);
  curveVertex(circX+323,circY-479);
  curveVertex(circX+461,circY-522);
  curveVertex(circX+507,circY-418);
  curveVertex(circX+296,circY-360);
  curveVertex(circX+328,circY-313);
  curveVertex(circX+386,circY-313);
  curveVertex(circX+418,circY-301);
  curveVertex(circX+413,circY-271);
  curveVertex(circX+328,circY-222);
  curveVertex(circX+357,circY);
  curveVertex(circX+357,circY);
  endShape();
}
void eBody (int circX,int circY) {
  stroke(1);
  strokeWeight(4);
  noFill();
  ellipse(mouseX,mouseY,314,222);
  line(116,377,5,467);
  
}


