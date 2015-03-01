
int eSize=10;
size(600, 300);
background(255);


for (int y=0; y<=height; y+=11) {   //左背景
  for (int x=0; x<=width; x+=11) {    
    fill(33, 170, 134, 300-x);  
    noStroke(); 
    rectMode(CENTER);
    rect(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);
  }
}

for (int y=0; y<=height; y+=11) {   //右背景
  for (int x=0; x<=width; x+=11) {    
    fill(108, 190, 227, x-315);  
    noStroke(); 
    rectMode(CENTER);
    rect(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);
  }
}

noStroke();
fill(104, 191, 48, 250);            //左下１
triangle(299, 300, 230, 150, 160, 300);
triangle(260, 300, 170, 120, 80, 300);
triangle(223, 300, 115, 80, 1, 300);

fill(88, 193, 129, 250);            //左上１
triangle(272, 0, 203, 127, 140, 0);
triangle(183, 0, 140, 90, 99, 0);
triangle(85, 0, -5, 200, -70, 0);
triangle(50, 0, -33, 200, -90, 0);

fill(126, 255, 176, 200);           //左下２
triangle(269, 300, 230, 200, 190, 300);
triangle(230, 300, 170, 170, 110, 300);
triangle(193, 300, 115, 130, 30, 300);

fill(24, 147, 72, 180);            //左上２
triangle(242, 0, 203, 83, 167, 0);
triangle(160, 0, 140, 50, 119, 0);
triangle(55, 0, -5, 145, -50, 0);


fill(113, 185, 255, 250);          //右円背面
ellipse(530, 230, 150, 150);

fill(31, 130, 214, 250);           
ellipse(420, 300, 210, 210);

fill(59, 145, 255, 250);
ellipse(550, 5, 210, 210);

fill(23, 106, 211, 250);
ellipse(590, 120, 130, 130);


fill(41, 235, 240, 240);          //右円大
ellipse(400, 250, 60, 60);
ellipse(590, 95, 80, 80);
ellipse(580, 190, 95, 95);
ellipse(575, 290, 130, 130);
ellipse(490, 290, 90, 90);
ellipse(490, 80, 60, 60);
ellipse(530, 55, 55, 55);
ellipse(345, 270, 45, 45);
ellipse(440, 130, 35, 35);
ellipse(430, 55, 25, 25);

fill(198, 254, 255, 240);         //右円小
ellipse(400, 250, 30, 30);
ellipse(590, 95, 50, 50);
ellipse(580, 190, 65, 65);
ellipse(575, 290, 100, 100);
ellipse(490, 290, 60, 60);
ellipse(490, 80, 30, 30);
ellipse(530, 55, 25, 25);
ellipse(345, 270, 25, 25);
ellipse(440, 130, 15, 15);
ellipse(430, 55, 10, 10);



