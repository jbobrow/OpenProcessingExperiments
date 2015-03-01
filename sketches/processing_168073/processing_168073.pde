
float angle = 0.0;
float speed = 0.7;
float p = 80; // insect radius
float p_e = 15; // insect eyes radius
float delta = 3;
float t = 1;
 


void setup() {
  size(800, 800, P3D);
  
}


void draw() {
  background(#8AE5F0);
  pushMatrix();
  translate(width/2, height/2,0);
 
  rotateY(radians(mouseX/3));
  
  angle+=speed; // determined speed of insect
  
  /*
  /////// draw insect //////////
  fill(0, 150, 80);
  ellipse(300+(sin(angle+PI)*10), 150, 80, 80);
  ellipse(300+(sin(angle+HALF_PI)*10), 230, 80, 80);
  ellipse(300+(sin(angle+QUARTER_PI)*10), 310, 80, 80);
  ellipse(300+(sin(angle+30)*10), 390, 80, 80);
  fill(0);
  ellipse(280+(sin(angle+PI)*10), 138, 15, 15);
  ellipse(319+(sin(angle+PI)*10), 138, 15, 15);
  */
  
  
 ///////////color of insect using vector////////////
  
  float lx=0, ly=0, lz=1;
  
  float x = random(0,600);
  float y = random(0,600);
  float z = random(0,600);
  
  float rx = random(0,100);
  float ry = random(0,100);
  float rz = random(0,100);
  
  float sx = random(0,100);
  float sy = random(0,100);
  float sz = random(0,100);
  
  float cx = (ry*sz-ry*sy);
  float cy = -(rx*sz-rz*sx);
  float cz = (rx*sy-ry*sx);
  
  float size = sqrt(cx*cx+cy*cy+cz*cz);
  cx = cx/size;
  cy = cy/size;
  cz = cz/size;
  
  float brightness = abs(cx*lx+cy*ly+cz*lz);
  
  ///////////// draw 3D insect Body ///////////////
  
  for (float pi = 0; pi < 360; pi += 10)
  {
    for(float deg = 0; deg <360; deg += delta)
    {
      stroke(70, 250*brightness, 150*brightness);
      strokeWeight(5);
      float theta = radians(deg);
      float x1 = p * sin(pi) * cos(theta);
      float y1 = p * sin(pi) * sin(theta);
      float z1 = p * cos(pi);
      point(x1 +(sin(angle+PI)*10) , y1 ,z1 + 240);
      
      float x2 = p * sin(pi) * cos(theta);
      float y2 = p * sin(pi) * sin(theta);
      float z2 = p * cos(pi);
      point(x2 + (sin(angle+HALF_PI)*10) , y2, z2 + 80);
       
      float x3 = p * sin(pi) * cos(theta);
      float y3 = p * sin(pi) * sin(theta);
      float z3 = p * cos(pi);
      point(x3+(sin(angle+QUARTER_PI)*10),y3,z3 - 80);
       
      float x4 = p * sin(pi) * cos(theta);
      float y4 = p * sin(pi) * sin(theta);
      float z4 = p * cos(pi);
      point(x4+(sin(angle+30)*10),y4,z4 - 240);
      
      stroke(0);
      strokeWeight(5);
      
      float x5 = p_e * sin(pi) * cos(theta);
      float y5 = p_e * sin(pi) * sin(theta);
      float z5 = p_e * cos(pi);
      point(x5+(sin(angle+30)*10)- 20,y5 - 25,z5 - 320);
       
      float x6 = p_e * sin(pi) * cos(theta);
      float y6 = p_e * sin(pi) * sin(theta);
      float z6 = p_e * cos(pi);
      point(x6+(sin(angle+30)*10) + 20,y6 - 25,z6 - 320);

    }
  }
  /////////Shape of clouds///////////

popMatrix();
 
  t+=0.3;
  fill(255);
  noStroke();
  ellipse(450+t, 500, 100, 100);
  ellipse(400+t, 520, 80, 80);
  ellipse(470+t, 520, 100, 90);
  ellipse(500+t, 530, 60, 60);
  ellipse(520+t, 535, 60, 40);
  ellipse(360+t, 540, 60, 40);
  ellipse(430+t, 540, 60, 40);
  ellipse(330+t, 50, 30, 10);
  ellipse(540+t, 550, 30, 10);
 
 
 
 
  fill(255);
  noStroke();
  ellipse(170+t, 200, 100, 100);
  ellipse(120+t, 220, 80, 80);
  ellipse(180+t, 210, 100, 90);
  ellipse(230+t, 225, 60, 50);
  ellipse(90+t, 235, 60, 40);
  ellipse(260+t, 240, 50, 30);
  ellipse(60+t, 240, 30, 10);
 

 
  
  fill(255);
  noStroke();
  ellipse(170+t, 600, 60, 60);
  ellipse(150+t, 610, 40, 40);
  ellipse(180+t, 610, 60, 50);
  ellipse(210+t, 615, 40, 30);
  ellipse(130+t, 615, 20, 15);
  ellipse(230+t, 620, 30, 10);
  ellipse(120+t, 620, 10, 5);
 
 
 
  
  fill(255);
  noStroke();
  ellipse(400+t, 320, 60, 60);
  ellipse(430+t, 325, 40, 40);
  ellipse(380+t, 330, 60, 50);
  ellipse(355+t, 330, 40, 30);
  ellipse(450+t, 325, 20, 15);
  ellipse(335+t, 325, 30, 10);
  ellipse(470+t, 330, 10, 5);
 
 
 
  fill(255);
  noStroke();
  ellipse(500+t, 120, 60, 60);
  ellipse(530+t, 125, 40, 40);
  ellipse(480+t, 130, 60, 50);
  ellipse(455+t, 130, 40, 30);
  ellipse(550+t, 125, 20, 15);
  ellipse(435+t, 125, 30, 10);
  ellipse(570+t, 130, 10, 5);
 
 
  fill(255);
  noStroke();
  ellipse(480+t, 650, 60, 60);
  ellipse(510+t, 655, 40, 40);
  ellipse(460+t, 660, 60, 50);
  ellipse(435+t, 660, 40, 30);
  ellipse(530+t, 655, 20, 15);
  ellipse(415+t, 655, 30, 10);
  ellipse(550+t, 660, 10, 5);
 
  
  fill(255);
  noStroke();
  ellipse(80+t, 420, 40, 40);
  ellipse(100+t, 425, 20, 20);
  ellipse(60+t, 430, 40, 30);
  ellipse(105+t, 430, 20, 10);
  ellipse(40+t, 435, 15, 10);
  ellipse(110+t, 430, 10, 10);
  ellipse(115+t, 430, 10, 5);
 
  
  fill(255);
  noStroke();
  ellipse(60+t, 50, 40, 40);
  ellipse(70+t, 55, 20, 20);
  ellipse(80+t, 55, 40, 30);
  ellipse(95+t, 60, 20, 10);
  ellipse(40+t, 55, 25, 20);
  ellipse(105+t, 60, 10, 5);
  ellipse(115+t, 60, 5, 2);
 
 
  fill(255);
  noStroke();
  ellipse(85+t, 750, 40, 40);
  ellipse(95+t, 755, 20, 20);
  ellipse(105+t, 755, 40, 30);
  ellipse(120+t, 760, 20, 10);
  ellipse(65+t, 755, 25, 20);
  ellipse(130+t, 760, 10, 5);
  ellipse(140+t, 760, 5, 2);
  
    fill(255);
  noStroke();
  ellipse(400+t, 20, 60, 60);
  ellipse(430+t, 25, 40, 40);
  ellipse(380+t, 30, 60, 50);
  ellipse(355+t, 30, 40, 30);
  ellipse(450+t, 25, 20, 15);
  ellipse(335+t, 25, 30, 10);
  ellipse(470+t, 30, 10, 5);
  
   fill(255);
  noStroke();
  ellipse(85+t, 650, 40, 40);
  ellipse(95+t, 655, 20, 20);
  ellipse(105+t, 655, 40, 30);
  ellipse(120+t, 660, 20, 10);
  ellipse(65+t, 655, 25, 20);
  ellipse(130+t, 660, 10, 5);
  ellipse(140+t, 660, 5, 2);
 
   fill(255);
  noStroke();
  ellipse(-60+t, 50, 40, 40);
  ellipse(-70+t, 55, 20, 20);
  ellipse(-80+t, 55, 40, 30);
  ellipse(-95+t, 60, 20, 10);
  ellipse(-40+t, 55, 25, 20);
  ellipse(-105+t, 60, 10, 5);
  ellipse(-115+t, 60, 5, 2);
  
  fill(255);
  noStroke();
  ellipse(380+t, 650, 60, 60);
  ellipse(410+t, 655, 40, 40);
  ellipse(360+t, 660, 60, 50);
  ellipse(335+t, 660, 40, 30);
  ellipse(430+t, 655, 20, 15);
  ellipse(315+t, 655, 30, 10);
  ellipse(450+t, 660, 10, 5);
  
    fill(255);
  noStroke();
  ellipse(-85+t, 650, 40, 40);
  ellipse(-95+t, 655, 20, 20);
  ellipse(-105+t, 655, 40, 30);
  ellipse(-120+t, 660, 20, 10);
  ellipse(-65+t, 655, 25, 20);
  ellipse(-130+t, 660, 10, 5);
  ellipse(-140+t, 660, 5, 2);
  
    fill(255);
  noStroke();
  ellipse(-170+t, 200, 100, 100);
  ellipse(-120+t, 220, 80, 80);
  ellipse(-180+t, 210, 100, 90);
  ellipse(-230+t, 225, 60, 50);
  ellipse(-90+t, 235, 60, 40);
  ellipse(-260+t, 240, 50, 30);
  ellipse(-60+t, 240, 30, 10);
  
    fill(255);
  noStroke();
  ellipse(-120+t, 20, 100, 100);
  ellipse(-70+t, 40, 80, 80);
  ellipse(-130+t, 30, 100, 90);
  ellipse(-180+t, 45, 60, 50);
  ellipse(-40+t, 55, 60, 40);
  ellipse(-210+t, 80, 50, 30);
  ellipse(-10+t,80, 30, 10);
  
  fill(255);
  noStroke();
  ellipse(185+t, 750, 40, 40);
  ellipse(195+t, 755, 20, 20);
  ellipse(205+t, 755, 40, 30);
  ellipse(220+t, 760, 20, 10);
  ellipse(165+t, 755, 25, 20);
  ellipse(230+t, 760, 10, 5);
  ellipse(240+t, 760, 5, 2);
  
   fill(255);
  noStroke();
  ellipse(480+t, 650, 60, 60);
  ellipse(510+t, 655, 40, 40);
  ellipse(460+t, 660, 60, 50);
  ellipse(435+t, 660, 40, 30);
  ellipse(530+t, 655, 20, 15);
  ellipse(415+t, 655, 30, 10);
  ellipse(550+t, 660, 10, 5);
 
}
 
  




