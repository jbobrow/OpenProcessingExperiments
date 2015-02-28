
float angle = 0.0;
float offset = 60;
float offsett = 120;
float offsettt = 250;
float coffsettt = 370;
float ccoffsettt = 430;
float scalar = 50;
float speed = 0.10;
void setup() {
 size(500, 500);
 smooth(); 
}
void draw() {
 background(mouseX, 255, mouseY);
 noStroke();
 float y1 = offset + sin(angle) * scalar;
 float y2 = offset + sin(angle + 0.4) * scalar;
 float y3 = offset + sin(angle + 0.8) * scalar;
  float y4 = offset + sin(angle + 1.2) * scalar;
  float y5 = offset + sin(angle + 1.6) * scalar;
 float y6 = offset + sin(angle + 2) * scalar;
 float y7 = offset + sin(angle + 2.4) * scalar;
  float y8 = offset + sin(angle + 2.8) * scalar;
     float y9 = offset + sin(angle + 3.2) * scalar;
 float y10 = offset + sin(angle + 3.6) * scalar;
 float y11 = offset + sin(angle + 4) * scalar;
  float y12 = offset + sin(angle + 4.4) * scalar;
   float y13 = offset + sin(angle - 0.4) * scalar;
 float y14 = offset + sin(angle - 0.8) * scalar;
 
  float x1 = offsett + sin(angle) * scalar;
 float x2 = offsett + sin(angle + 0.4) * scalar;
 float x3 = offsett + sin(angle + 0.8) * scalar;
  float x4 = offsett + sin(angle + 1.2) * scalar;
  float x5 = offsett + sin(angle + 1.6) * scalar;
 float x6 = offsett + sin(angle + 2) * scalar;
 float x7 = offsett + sin(angle + 2.4) * scalar;
  float x8 = offsett + sin(angle + 2.8) * scalar;
     float x9 = offsett + sin(angle + 3.2) * scalar;
 float x10 = offsett + sin(angle + 3.6) * scalar;
 float x11 = offsett + sin(angle + 4) * scalar;
  float x12 = offsett + sin(angle + 4.4) * scalar;
   float x13 = offsett + sin(angle - 0.4) * scalar;
 float x14 = offsett + sin(angle - 0.8) * scalar;
 

 
 
   float xy1 = offsettt + sin(angle) * scalar;
 float xy2 = offsettt + sin(angle + 0.4) * scalar;
 float xy3 = offsettt + sin(angle + 0.8) * scalar;
  float xy4 = offsettt + sin(angle + 1.2) * scalar;
  float xy5 = offsettt + sin(angle + 1.6) * scalar;
 float xy6 = offsettt + sin(angle + 2) * scalar;
 float xy7 = offsettt + sin(angle + 2.4) * scalar;
  float xy8 = offsettt + sin(angle + 2.8) * scalar;
     float xy9 = offsettt + sin(angle + 3.2) * scalar;
 float xy10 = offsettt + sin(angle + 3.6) * scalar;
 float xy11 = offsettt + sin(angle + 4) * scalar;
  float xy12 = offsettt + sin(angle + 4.4) * scalar;
   float xy13 = offsettt + sin(angle - 0.4) * scalar;
 float xy14 = offsettt + sin(angle - 0.8) * scalar;
 
    float xyz1 = coffsettt + sin(angle) * scalar;
 float xyz2 = coffsettt + sin(angle + 0.4) * scalar;
 float xyz3 = coffsettt + sin(angle + 0.8) * scalar;
  float xyz4 = coffsettt + sin(angle + 1.2) * scalar;
  float xyz5 = coffsettt + sin(angle + 1.6) * scalar;
 float xyz6 = coffsettt + sin(angle + 2) * scalar;
 float xyz7 = coffsettt + sin(angle + 2.4) * scalar;
  float xyz8 = coffsettt + sin(angle + 2.8) * scalar;
     float xyz9 = coffsettt + sin(angle + 3.2) * scalar;
 float xyz10 = coffsettt + sin(angle + 3.6) * scalar;
 float xyz11 = coffsettt + sin(angle + 4) * scalar;
  float xyz12 = coffsettt + sin(angle + 4.4) * scalar;
   float xyz13 = coffsettt + sin(angle - 0.4) * scalar;
 float xyz14 = coffsettt + sin(angle - 0.8) * scalar;
 
     float wxyz1 = ccoffsettt + sin(angle) * scalar;
 float wxyz2 = ccoffsettt + sin(angle + 0.4) * scalar;
 float wxyz3 = ccoffsettt + sin(angle + 0.8) * scalar;
  float wxyz4 = ccoffsettt + sin(angle + 1.2) * scalar;
  float wxyz5 = ccoffsettt + sin(angle + 1.6) * scalar;
 float wxyz6 = ccoffsettt + sin(angle + 2) * scalar;
 float wxyz7 = ccoffsettt + sin(angle + 2.4) * scalar;
  float wxyz8 = ccoffsettt + sin(angle + 2.8) * scalar;
     float wxyz9 = ccoffsettt + sin(angle + 3.2) * scalar;
 float wxyz10 = ccoffsettt + sin(angle + 3.6) * scalar;
 float wxyz11 = ccoffsettt + sin(angle + 4) * scalar;
  float wxyz12 = ccoffsettt + sin(angle + 4.4) * scalar;
   float wxyz13 = ccoffsettt + sin(angle - 0.4) * scalar;
 float wxyz14 = ccoffsettt + sin(angle - 0.8) * scalar;

fill(204, 255,255);

 ellipse(0, y14, 40, 40);
 ellipse(40, y13, 40, 40);
 ellipse( 80, y1, 40, 40);
 ellipse(120, y2, 40, 40);
 ellipse(160, y3, 40, 40);
 ellipse(200, y4, 40, 40);
 ellipse(240, y5, 40, 40);
 ellipse(280, y6, 40, 40);
 ellipse(320, y7, 40, 40);
 ellipse(360, y8, 40, 40);
 ellipse(400, y9, 40, 40);
 ellipse(440, y10, 40, 40);
 ellipse(480, y11, 40, 40);
 ellipse(520, y12, 40, 40);
  
  fill (102,255,255);
  
 ellipse(0, x14, 40, 40);
 ellipse(40, x13, 40, 40);
 ellipse( 80, x1, 40, 40);
 ellipse(120, x2, 40, 40);
 ellipse(160, x3, 40, 40);
 ellipse(200, x4, 40, 40);
 ellipse(240, x5, 40, 40);
 ellipse(280, x6, 40, 40);
 ellipse(320, x7, 40, 40);
 ellipse(360, x8, 40, 40);
 ellipse(400, x9, 40, 40);
 ellipse(440, x10, 40, 40);
 ellipse(480, x11, 40, 40);
 ellipse(520, x12, 40, 40);
  
   fill(051,153,255);
  
 ellipse(0, xy14, 40, 40);
 ellipse(40, xy13, 40, 40);
 ellipse( 80, xy1, 40, 40);
 ellipse(120, xy2, 40, 40);
 ellipse(160, xy3, 40, 40);
 ellipse(200, xy4, 40, 40);
 ellipse(240, xy5, 40, 40);
 ellipse(280, xy6, 40, 40);
 ellipse(320, xy7, 40, 40);
 ellipse(360, xy8, 40, 40);
 ellipse(400, xy9, 40, 40);
 ellipse(440, xy10, 40, 40);
 ellipse(480, xy11, 40, 40);
 ellipse(520, xy12, 40, 40);
 
  fill(000,000,255);

 ellipse(0, xyz14, 40, 40);
 ellipse(40, xyz13, 40, 40);
 ellipse(80, xyz1, 40, 40);
 ellipse(120, xyz2, 40, 40);
 ellipse(160, xyz3, 40, 40);
 ellipse(200, xyz4, 40, 40);
 ellipse(240, xyz5, 40, 40);
 ellipse(280, xyz6, 40, 40);
 ellipse(320, xyz7, 40, 40);
 ellipse(360, xyz8, 40, 40);
 ellipse(400, xyz9, 40, 40);
 ellipse(440, xyz10, 40, 40);
 ellipse(480, xyz11, 40, 40);
 ellipse(520, xyz12, 40, 40);
 
fill(051, 000, 153);
 
  ellipse(0, wxyz14, 40, 40);
 ellipse(40, wxyz13, 40, 40);
 ellipse(80, wxyz1, 40, 40);
 ellipse(120, wxyz2, 40, 40);
 ellipse(160, wxyz3, 40, 40);
 ellipse(200, wxyz4, 40, 40);
 ellipse(240, wxyz5, 40, 40);
 ellipse(280, wxyz6, 40, 40);
 ellipse(320, wxyz7, 40, 40);
 ellipse(360, wxyz8, 40, 40);
 ellipse(400, wxyz9, 40, 40);
 ellipse(440, wxyz10, 40, 40);
 ellipse(480, wxyz11, 40, 40);
 ellipse(520, wxyz12, 40, 40);

 angle += speed;
}
