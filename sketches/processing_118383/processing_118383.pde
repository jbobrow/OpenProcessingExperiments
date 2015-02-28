
size(510,510);

background(255,255,255);
noStroke();
float color1,color2;

int box_size = 6;

for(int i = box_size;i < 510 - box_size;i += box_size*2) {
  for(int j = box_size;j < 510- box_size;j += box_size*2) {
  //fill(random(155)+100,random(155)+100,random(155)+100);
  color1 = (float)i / 510 * 255;
  color2 = (float)j / 510 * 255;
  fill(color1,color2,255);
  rect(i,j,box_size,box_size);
  }
} 

fill(0,101,255,100); 
ellipse(65, 65, 120, 120);

fill(0, 131, 255,90);
ellipse(130, 130, 100, 100);

fill(192,3,255,90);
ellipse(390, 100, 120, 120);

fill(0, 191, 255,90);
ellipse(100, 370, 220, 220);

fill(192,3,255,90);
ellipse(210,40, 30, 30);

fill(0,170,255,100);
ellipse(20, 250, 40, 40);

fill(255, 100, 200,100);
ellipse(450, 250, 80, 80);

fill(0,101,255,100);
rect(60,125, 6 , 100);

fill(0, 131, 255,90);
rect(132, 180, 6, 80);

fill(0, 131, 255,90);
rect(108, 174, 6, 50);

fill(192,3,255,90);
rect(384, 160, 6, 300);

fill(192,3,255,90);
rect(372, 158, 6, 200);

fill(0, 191, 255,90);
rect(132, 472, 6, 50);

fill(0, 191, 255,90);
rect(144, 470, 6, 30);

fill(0, 191, 255,90);
rect(168, 453, 6, 30);

fill(0, 191, 255,90);
rect(192, 425, 6, 90);

fill(0, 191, 255,90);
rect(60, 472, 18, 100);

fill(255, 100, 200,100);
rect(468, 280, 6, 170);

fill(255, 100, 200,100);
rect(444, 286, 6, 30);

fill(255, 100, 200,100);
rect(432, 286, 6, 45);

fill(192,3,255,90);
rect(408, 150, 6, 47);

fill(132,104,238,100);
ellipse(285,235,90,90);

fill(132,104,238,100);
rect(276,280,6,180);

fill(132,104,238,100);
rect(300,271,6,100);

fill(192,3,255,90);
rect(348, 141, 6, 47);


