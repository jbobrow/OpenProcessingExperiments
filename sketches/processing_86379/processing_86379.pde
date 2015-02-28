
PImage[] interview = new PImage[24];
int moveImageAlong;


//PImage[] thumbsUp;
//PImage[] thumbsDown;
//PImage[] interview;


//PImage[] moveImageAlong;

//handshake bad answer
int x = 114;
int y = 42;
int w = 457;
int h = 470;
//handshake good answer
int x1 = 114;
int y1 = 545;
int w1 = 457;
int h1 = 223;

//crossing good answer
int x2 = 57;
int y2 = 57;
int w2 = 281;
int h2 = 78;
//crossing bad answer 1
int x3 = 394;
int y3 = 128;
int w3 = 182;
int h3 = 74;
//crossing bad answer 2
int x4 = 39;
int y4 = 218;
int w4 = 166;
int h4 = 69;

//leaning back good answer 
int x5 = 53;
int y5 = 71;
int w5 = 228;
int h5 = 144;
//leaning back bad answer 1
int x6 = 304;
int y6 = 18;
int w6 = 248;
int h6 = 84;
//leaning back good answer 2
int x7 = 356;
int y7 = 157;
int w7 = 234;
int h7 = 66;

//eye contact good answer 
int x8 = 35;
int y8 = 125;
int w8 = 292;
int h8 = 76;
//eye contact bad answer 1
int x9 = 271;
int y9 = 44;
int w9 = 285;
int h9 = 60;
//eye contact bad answer 2
int x10 = 369;
int y10 = 193;
int w10 = 198;
int h10 = 76;

//touching neck good answer 
int x11 = 43;
int y11 = 270;
int w11 = 226;
int h11 = 71;
//touching neck bad answer 1
int x12 = 105;
int y12 = 82;
int w12 = 229;
int h12 = 131;
//touching neck bad answer 2
int x13 = 415;
int y13 = 159;
int w13 = 154;
int h13 = 73;

//fidgeting good answer 
int x14 = 57;
int y14 = 50;
int w14 = 288;
int h14 = 74;
//fidgeting bad answer 1
int x15 = 354;
int y15 = 138;
int w15 = 208;
int h15 = 62;
//fidgeting bad answer 2
int x16 = 79;
int y16 = 229;
int w16 = 155;
int h16 = 54;

//touching face good answer 
int x17 = 334;
int y17 = 41;
int w17 = 252;
int h17 = 60;
//touching face bad answer 1
int x18 = 23;
int y18 = 59;
int w18 = 280;
int h18 = 153;
//touching face bad answer 2
int x19 = 20;
int y19 = 290;
int w19 = 188;
int h19 = 69;

void setup(){
size(605, 806);

// thumbs up image array 
//thumbsUp = new PImage[7];
//thumbsUp[0] = loadImage("tu_handshake.jpg");
//thumbsUp[1] = loadImage("tu_crossing_arms.jpg");
//thumbsUp[2] = loadImage("tu_leaning_back.jpg");
//thumbsUp[3] = loadImage("tu_eye_contact.jpg");
//thumbsUp[4] = loadImage("tu_touching_neck.jpg");
//thumbsUp[5] = loadImage("tu_fidgeting.jpg");
//thumbsUp[6] = loadImage("tu_touching_face.jpg");
//
//// thumbs down image array 
//thumbsDown = new PImage[7];
//thumbsDown[0] = loadImage("td_handshake.jpg");
//thumbsDown[1] = loadImage("td_crossing_arms.jpg");
//thumbsDown[2] = loadImage("td_leaning_back.jpg");
//thumbsDown[3] = loadImage("td_eye_contact.jpg");
//thumbsDown[4] = loadImage("td_touching_neck.jpg");
//thumbsDown[5] = loadImage("td_fidgeting.jpg");
//thumbsDown[6] = loadImage("td_touching_face.jpg");

// actual interview images image array 
//interview = new PImage[7];
//interview[0] = loadImage("handshake1.jpg");
//interview[1] = loadImage("crossing_arms1.jpg");
//interview[2] = loadImage("leaning_back1.jpg");
//interview[3] = loadImage("eye_contact1.jpg");
//interview[4] = loadImage("touching_neck1.jpg");
//interview[5] = loadImage("fidgeting1.jpg");
//interview[6] = loadImage("touching_face1.jpg");

//moveImageAlong = new PImage[20]; 
//moveImageAlong[0] = interview[0];
//moveImageAlong[1] = thumbsDown[0];
//moveImageAlong[2] = thumbsUp[0];
//moveImageAlong[3] = interview[1];
//moveImageAlong[4] = thumbsDown[1];
//moveImageAlong[5] = thumbsUp[1];
//moveImageAlong[6] = interview[2];
//}

for (int i =0; i <interview.length; i++) {
  interview[i] = loadImage(i+".jpg");
//  frameRate(10);
}
frame.setBackground(new java.awt.Color(0, 0, 0));
}
void draw() {
//background(0);
if(moveImageAlong ==0) {
image(interview[0],0,0);

}
// println(moveImageAlong);

fill(#e09554,0);
noStroke();
rect(x,y,w,h);
rect(x1,y1,w1,h1);

fill(#ff0000,0);
noStroke();
rect(x2,y2,w2,h2);
rect(x3,y3,w3,h3);
rect(x4,y4,w4,h4);

fill(#ff0000,0);
noStroke();
rect(x5,y5,w5,h5);
rect(x6,y6,w6,h6);
rect(x7,y7,w7,h7);

fill(#ff0000,0);
noStroke();
rect(x8,y8,w8,h8);
rect(x9,y9,w9,h9);
rect(x10,y10,w10,h10);

fill(#ff0000,0);
noStroke();
rect(x11,y11,w11,h11);
rect(x12,y12,w12,h12);
rect(x13,y13,w13,h13);

fill(#ff0000,0);
noStroke();
rect(x14,y14,w14,h14);
rect(x15,y15,w15,h15);
rect(x16,y16,w16,h16);

fill(#ff0000,0);
noStroke();
rect(x17,y17,w17,h17);
rect(x18,y18,w18,h18);
rect(x19,y19,w19,h19);
}


void mouseReleased() {       //place the else statements in // to make the choice change permanent
//if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && moveImageAlong == 0) {
//  image(interview[5],0,0); 
//} else{ image(interview[6],0,0); 
//}

//moveImageAlong +=6;
//}

if (moveImageAlong == 0) {
  image(interview[1],0,0); 

moveImageAlong+=1;
}
if (moveImageAlong == 2) {
    image(interview[2],0,0); 
}
if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && moveImageAlong == 3) {
    image(interview[4],0,0); 
}
if (mouseX > x1 && mouseX < x1+w1 && mouseY > y1 && mouseY < y1+h1 && moveImageAlong == 3) {
    image(interview[3],0,0); 
}
if (moveImageAlong == 4) {
    image(interview[5],0,0); 
}
if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2 && moveImageAlong == 5) {
    image(interview[6],0,0); 
}
if (mouseX > x3 && mouseX < x3+w3 && mouseY > y3 && mouseY < y3+h3 && moveImageAlong == 5 || mouseX > x4 && mouseX < x4+w4 && mouseY > y4 && mouseY < y4+h4 && moveImageAlong == 5)  {
    image(interview[7],0,0); 
}
if (moveImageAlong == 6) {
    image(interview[8],0,0); 
}
if (mouseX > x5 && mouseX < x5+w5 && mouseY > y5 && mouseY < y5+h5 && moveImageAlong == 7 || mouseX > x7 && mouseX < x7+w7 && mouseY > y7&& mouseY < y7+h7 && moveImageAlong == 5)  {
    image(interview[9],0,0); 
}
if (mouseX > x6 && mouseX < x6+w6 && mouseY > y6 && mouseY < y6+h6 && moveImageAlong == 7) {
    image(interview[10],0,0); 
}
if (moveImageAlong == 8) {
    image(interview[11],0,0); 
}
if (mouseX > x8 && mouseX < x8+w8 && mouseY > y8 && mouseY < y8+h8 && moveImageAlong == 9 || mouseX > x10 && mouseX < x10+w10 && mouseY > y10&& mouseY < y10+h10 && moveImageAlong == 9)  {
    image(interview[12],0,0); 
}
if (mouseX > x9 && mouseX < x9+w9 && mouseY > y9&& mouseY < y9+h9 && moveImageAlong == 9) {
    image(interview[13],0,0); 
}
if (moveImageAlong == 10) {
    image(interview[14],0,0); 
}
if (mouseX > x11 && mouseX < x11+w11 && mouseY > y11&& mouseY < y11+h11 && moveImageAlong == 11) {
    image(interview[15],0,0); 
}
if (mouseX > x12 && mouseX < x12+w12 && mouseY > y12 && mouseY < y12+h12 && moveImageAlong == 11 || mouseX > x13 && mouseX < x13+w13 && mouseY > y13&& mouseY < y13+h13 && moveImageAlong == 11)  {
    image(interview[16],0,0); 
}
if (moveImageAlong == 12) {
    image(interview[17],0,0); 
}
if (mouseX > x14 && mouseX < x14+w14 && mouseY > y14 && mouseY < y14+h14 && moveImageAlong == 13 || mouseX > x15 && mouseX < x15+w15 && mouseY > y15&& mouseY < y15+h15 && moveImageAlong == 13)  {
    image(interview[18],0,0); 
}
if (mouseX > x16 && mouseX < x16+w16 && mouseY > y16&& mouseY < y16+h16 && moveImageAlong == 13) {
    image(interview[19],0,0); 
}
if (moveImageAlong == 14) {
    image(interview[20],0,0); 
}
if (mouseX > x17 && mouseX < x17+w17 && mouseY > y17&& mouseY < y17+h17 && moveImageAlong == 15) {
    image(interview[21],0,0); 
}
if (mouseX > x18 && mouseX < x18+w18 && mouseY > y18 && mouseY < y18+h18 && moveImageAlong == 15 || mouseX > x19 && mouseX < x19+w19 && mouseY > y19&& mouseY < y19+h19 && moveImageAlong == 15)  {
    image(interview[22],0,0); 
}
if (moveImageAlong == 16) {
    image(interview[23],0,0); 
}
if (moveImageAlong == 17) {
    image(interview[0],0,0); 
    moveImageAlong-=18;
}

  moveImageAlong++;
  }
//if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h && moveImageAlong == 6) {
//  image(interview[7],0,0); 
//
//moveImageAlong = 7;
//}



