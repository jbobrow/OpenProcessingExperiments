
void setup(){
  background(121, 61, 121);
  size(300,300);
}

void draw(){
  smooth();
  
// Body
fill(255);
beginShape();
vertex (126, 54);
vertex (99, 81);
vertex (108, 90);
vertex (81, 99);
vertex (99, 108);
vertex (63, 126);
vertex (99, 128);
vertex (90, 144);
vertex (90, 198);
vertex (36, 216);
vertex (36, 234);
vertex (63, 243);
vertex (72, 243);
vertex (81, 234);
vertex (90, 243);
vertex (108, 243);
vertex (117, 234);
vertex (126, 243);
vertex (144, 243);
vertex (153, 234);
vertex (162, 243);
vertex (180, 243);
vertex (189, 234);
vertex (198, 243);
vertex (216, 243);
vertex (234, 234);
vertex (234, 216);
vertex (216, 207);
vertex (198, 207);
vertex (189, 216);
vertex (180, 207);
vertex (162, 207);
vertex (162, 198);
vertex (180, 162);
vertex (180, 144);
vertex (153, 108);
vertex (162, 99);
vertex (180, 99);
vertex (180, 90);
vertex (162, 90);
vertex (153, 81);
vertex (189, 81);
vertex (188, 54);
vertex (126, 54);
endShape(CLOSE);

//ear 1
beginShape();
vertex (126, 63);
vertex (126, 27);
vertex (117, 27);
vertex (126, 39);
endShape();

//ear 2
beginShape();
vertex (135, 54);
vertex (135, 27);
vertex (126, 27);
vertex (135, 36);
endShape();

//nose
beginShape();
vertex (189, 63);
vertex (171, 54);
vertex (174, 45);
vertex (188, 45);
endShape();

//eyes
beginShape();
vertex (135, 72);
vertex (135, 63);
vertex (153, 63);
vertex (144, 72);
vertex (135, 72);
endShape();
}



