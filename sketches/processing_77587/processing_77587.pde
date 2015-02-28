
MRect r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, r12, r13, r14, r15, r16, r17;
MTriangle t1, t2, t3, t4, t5, t6;
PImage bg;

void setup()
{
  size(850, 850);
  noStroke();
  //rect(width, xpos, height, ypos)
  //teal
  r1 = new MRect(160, 100.0, .12, 60);
  r2 = new MRect(160, 270.0, 0.095, 60);
  r3 = new MRect(160, 270.0, 0.093, 150);
  r4 = new MRect(210, 50.0, 0.07, 170);
  r5 = new MRect(160, 50.0, 0.09, 235);
  
  //blue
  r6 = new MRect(50, 220.0, 0.09, 235);
  r7 = new MRect(150, 280.0, 0.09, 235);
  r8 = new MRect(210, 220.0, 0.1, 320);
  
  //red
  t1 = new MTriangle(435, 60, 435, 150, 520, 150);
  t2 = new MTriangle(440, 60, 530, 60, 530, 150);
  t3 = new MTriangle(535, 60, 535, 230, 650, 230);
  t4 = new MTriangle(535, 240, 650, 240, 535, 360);
  t5 = new MTriangle(435, 360, 530, 360, 435, 450);
  
  r9 = new MRect(60, 435.0, .1, 155);
  r10 = new MRect(30, 500.0, .15, 155);
  r11 = new MRect(30, 500.0, .075, 290);
  r12 = new MRect(60, 435.0, .13, 245);
  
  //yellow
  t6 = new MTriangle(435, 460, 650, 250, 650, 460);
  
  r13 = new MRect(140, 440.0, .15, 470);
  r14 = new MRect(60, 590.0, .15, 470);
  
  //light green
  r15 = new MRect(160, 50.0, .10, 320);
  
  //green
  r16 = new MRect(160, 50.0, .13, 410);
  r17 = new MRect(210, 220.0, .22, 410);
}
 
void draw()
{
  background(204, 222, 221);
  PImage bg = loadImage("sfmap.png");
  bg.resize(850, 850);
  image(bg, 0, 0);

  fill(64, 98, 100);
  r1.display();
  r2.display();
  r3.display();
  r4.display();
  r5.display();
  fill(65, 78, 101);
  r6.display();
  r7.display();
  r8.display();
  fill(173, 35, 21);
  t1.display();
  t2.display();
  t3.display();
  t4.display();
  t5.display();
  
  r9.display();
  r10.display();
  r11.display();
  r12.display();
  
  fill(166, 135, 76);
  t6.display();
  r13.display();
  r14.display();
  
  fill(140, 173, 123);
  r15.display();
  
  fill(102, 134, 86);
  r16.display();
  r17.display();

  
 if(mousePressed)
 {
    r1.move(mouseX-(width/2), mouseY+(height*0.1), 30);
    r2.move((mouseX+(width*0.05))%width, mouseY+(height*0.025), 20);
    r3.move(mouseX/4, mouseY-(height*0.025), 40);
    r4.move(mouseX-(width/2), (height-mouseY), 10);
    r5.move(mouseX-(width/4), mouseY+(height*0.5), 20);
    
    r6.move(mouseX+(width*0.05), mouseY+(height*0.2), 10);
    r7.move(mouseX, mouseY+(height*0.7), 10);
    r8.move(mouseX/2, mouseY-(height*0.05), 20);
    r9.move(mouseX-(width/2), mouseY+(height*0.1), 30);
    r10.move((mouseX+(width*0.05))%width, mouseY+(height*0.025), 20);
    r11.move(mouseX-(width/4), mouseY+(height*0.5), 20);
    r12.move((mouseX+(width*0.05))%width, mouseY+(height*0.025), 5);
    r13.move(mouseX-(width/2), mouseY+(height*0.1), 10);
    r14.move(mouseX-(width/2), mouseY+(height*0.1), 60);
    r15.move(mouseX-(width/4), mouseY+(height*0.5), 20);
    r16.move((mouseX+(width*0.05))%width, mouseY+(height*0.025), 1);
    r17.move(mouseX-(width/4), mouseY+(height*0.5), 20);
    
    t1.move(mouseX+(width/4), mouseY+(height*0.7), mouseX+(width/4), mouseY+(height*0.7), 
            mouseX=(width/4), mouseY+(height*0.7), 1);
    t2.move(mouseX*(width/4), mouseY*(height/4), mouseX*(width/4), mouseY*(height/4), 
            mouseX*(width/4), mouseY*(height/4), 5);
    t3.move(mouseX-(width/2), mouseY, mouseX-(width/2), mouseY, 
            mouseX-(width/2), mouseY, 20);
    t4.move(mouseX/4, height-mouseY, mouseX/4, height-mouseY, 
            mouseX/4, height-mouseY, 20);
    t5.move(mouseX, mouseY, mouseX, mouseY, mouseX, mouseY, 10);
    t6.move(mouseX/2, height-mouseY, mouseX/2, height-mouseY, 
            mouseX/2, height-mouseY, 5);
 }
}
 
class MRect 
{
  int w; // width
  float xpos; // rect xposition
  float h; // height
  float ypos ; // rect yposition
 
  MRect(int iw, float ixp, float ih, float iyp) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
  }
 
  void move (float posX, float posY, float damping) {
    float dif = ypos - posY;
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
    }
  }
 
  void display() 
  {
      rect(xpos, ypos, w, height*h);
  }
}

class MTriangle
{
  float xpos, x2, x3, ypos, y2, y3;
  
  MTriangle(float ix1, float iy1, float ix2, float iy2, float ix3, float iy3)
  {
    xpos = ix1;
    x2 = ix2;
    x3 = ix3;
    ypos = iy1;
    y2 = iy2;
    y3 = iy3;
  }
  
  void move(float posX, float posY, float posx2, float posy2, 
            float posx3, float posy3, float damping)
  {
    float dif = ypos - posY;
    if (abs(dif) > 1) 
    {
      ypos -= dif/damping;
      y2 -= dif/damping;
      y3 -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) 
    {
      xpos -= dif/damping;
      x2 -= dif/damping;
      x3 -= dif/damping;
    }
  }
  
  void display()
  {
    triangle(xpos, ypos, x2, y2, x3, y3);
  }
}

