

float r;float r1;float r2;float r3;float r4;float r5;float r6;float r7;float r8;float r9;float r10;
float b;float b1;float b2;float b3;float b4;float b5;float b6; float b7;float b8;float b9;float b10;
float g;float g1;float g2;float g3;float g4;float g5;float g6;float g7;float g8;float g9;float g10;
float a;float a1;float a2;float a3;float a4;float a5;float a6;float a7;float a8;float a9;float a10;

void setup() {
  size(480, 480);
  frameRate(15);
}

void draw() {
 r = random(255);r2 = random(255);r3 = random(255);r4 = random(255);r5 = random(255);
 r6 = random(255);r7 = random(255);r8 = random(255);r9 = random(255);r10 = random(255);
 g = random(255);g2 = random(255);g3 = random(255);g4 = random(255);g5 = random(255);
 g6 = random(255);g7 = random(255);g8 = random(255);g9 = random(255);g10 = random(255);
 b = random(255);b2 = random(255);b3 = random(255);b4 = random(255);b5 = random(255);
 b6 = random(255);b7 = random(255);b8 = random(255);b9 = random(255);b10 = random(255);
  a = random(255);a2 = random(255);a3 = random(255);a4 = random(255);a5 = random(255);
  a6 = random(255);a7 = random(255);a8 = random(255);a9 = random(255);a10 = random(255);
  background(0);

  //DIAMOND
  strokeWeight(5);
  fill(r3,g3,b3);
  quad(240, 140, 200, 330, 240, 430, 280, 330);
  fill(r8,g8,b8);
  quad(240, 130, 180, 70, 240, 50, 300, 70);
  fill(r3,g3,b3);
  line(25, 130, 455, 130);
  fill(r9,g9,b9);
  triangle(240, 130, 179, 70, 140, 130);
  fill(r4,g4,b4);
  triangle(240, 130, 300, 70, 340, 130);
  fill(r5,g5,b5);
  triangle(310, 130, 279, 330, 239, 130);
  fill(r6,g6,b6);
  triangle(200, 329, 170, 130, 241, 130);
  fill(r7,g7,b7);
  triangle(300, 70, 240, 50, 320, 50);
  fill(r8,g8,b8);
  quad(160, 52, 180, 70, 140, 130, 95, 75);
  fill(r9,g9,b9);
  quad(320, 52, 300, 70, 340, 130, 385, 75);
  fill(r10,g10,b10);
  triangle(180, 70, 235, 50, 160, 50);
  fill(r,g,b);
  triangle(320, 50, 387, 75, 360, 50);
  fill(r4,g4,b4);
  triangle(120, 50, 95, 74, 160, 50);
  fill(r6,g6,b6);
  triangle(95, 74, 25, 130, 60, 130);
  fill(r7,g7,b7);
  triangle(387, 75, 455, 130, 420, 130);
  fill(r4,g4,b4);
  triangle(455, 130, 310, 330, 420, 130);
  fill(r8,g8,b8);
  quad(310, 330, 245, 425, 279, 330, 340, 130);
  fill(r3,g3,b3);
  triangle(340, 130, 420, 130, 312, 325);
  fill(r6,g6,b6);
  triangle(340, 130, 305, 130, 280, 325);
  fill(r10,g10,b10);
  triangle(340, 130, 305, 130, 302, 74);
  fill(r8,g8,b8);
  triangle(200, 320, 170, 130, 140, 130);
  fill(r,g,b);
  triangle(170, 130, 140, 130, 176, 75);
  fill(r7,g7,b7);
  triangle(140, 130, 60, 130, 204, 335);
  fill(r5,g5,b5);
  triangle(25, 130, 60, 130, 176, 340);
  fill(r,g,b);
  quad(60, 130, 176, 340, 240, 430, 195, 315);
  fill(r9,g9,b9);
  triangle(60, 130, 140, 130, 95, 74);
  fill(r5,g5,b5);
  triangle(340, 130, 420, 130, 387, 74);

  
  }
  
  


