
int x_Side = 375*2;
int y_Side = 285*2;

void setup(){
  size(x_Side, y_Side);
  background(250,252,211);
}

void draw(){
  noFill();
  //yellow stripes
  strokeWeight(2);
  stroke(239,166,41);
  //bottom left corner
  arc(-190, 285, 720, 680, PI/8, PI/2);
  arc(-170, 285, 640, 680, PI/8, PI/2);
  arc(-150, 285, 550, 680, PI/7, PI/2);
  arc(-130, 285, 460, 680, PI/6, PI/2);
  arc(-110, 285, 370, 680, PI/6, PI/2);
  arc(-90, 285, 280, 680, PI/6, PI/2);
  arc(-70, 285, 190, 680, PI/5.5, PI/2);
  //bottom right corner
  arc(940, 285, 720, 680,PI/2, PI- PI/8);
  arc(920, 285, 640, 680, PI/2, PI- PI/8);
  arc(900, 285, 550, 680, PI/2, PI- PI/7);
  arc(880, 285, 460, 680, PI/2, PI- PI/6);
  arc(860, 285, 370, 680, PI/2, PI- PI/6);
  arc(840, 285, 280, 680, PI/2, PI- PI/6);
  arc(820, 285, 190, 680, PI/2, PI- PI/5.5);
  //top left corner
  arc(-190, 285, 720, 680,PI+PI/2, TWO_PI-PI/8);
  arc(-170, 285, 640, 680,PI+PI/2, TWO_PI-PI/8);
  arc(-150, 285, 550, 680, PI+PI/2, TWO_PI-PI/7);
  arc(-130, 285, 460, 680, PI+PI/2, TWO_PI-PI/6);
  arc(-110, 285, 370, 680, PI+PI/2, TWO_PI-PI/6);
  arc(-90, 285, 280, 680, PI+PI/2, TWO_PI-PI/6);
  arc(-70, 285, 190, 680, PI+PI/2, TWO_PI-PI/5.5);
  //Top Right corner
  arc(940, 285, 720, 680, PI+PI/8, PI+PI/2);
  arc(920, 285, 640, 680, PI+PI/8, PI+PI/2);
  arc(900, 285, 550, 680, PI+PI/7, PI+PI/2);
  arc(880, 285, 460, 680, PI+PI/6, PI+PI/2);
  arc(860, 285, 370, 680, PI+PI/6, PI+PI/2);
  arc(840, 285, 280, 680, PI+PI/6, PI+PI/2);
  arc(820, 285, 190, 680, PI+PI/5.5, PI+PI/2);
  //around center circle
  //bottom
  arc(375, 285, 355, 355, PI/12, PI-PI/12);
  arc(375, 285, 335, 335, PI/9, PI-PI/9);
  arc(375, 285, 315, 315, PI/6, PI-PI/6);
  arc(375, 285, 295, 295, PI/5, PI-PI/5);
  arc(375, 285, 275, 275, PI/4, PI-PI/4);
  arc(375, 285, 255, 255, PI/3, PI-PI/3);
  //top
  arc(375, 285, 355, 355,  PI+PI/12, TWO_PI-PI/12);
  arc(375, 285, 335, 335, PI+PI/9, TWO_PI-PI/9);
  arc(375, 285, 315, 315, PI+PI/6, TWO_PI-PI/6);
  arc(375, 285, 295, 295, PI+PI/5, TWO_PI-PI/5);
  arc(375, 285, 275, 275, PI+PI/4, TWO_PI-PI/4);
  arc(375, 285, 255, 255, PI+PI/3, TWO_PI-PI/3);
  //stripes bottom left
  arc(375, 80, 875, 750, HALF_PI+PI/14, PI);
  arc(375, 110, 875, 650, HALF_PI+PI/12, PI);
  arc(375, 140, 875, 550, HALF_PI+PI/10, PI);
  arc(375, 170, 875, 450, HALF_PI+PI/8, PI);
  arc(375, 200, 875, 350, HALF_PI+PI/8, PI);
  arc(375, 225, 875, 250, HALF_PI+PI/8, PI);
  arc(375, 250, 875, 150, HALF_PI+PI/8, PI);
  arc(375, 275, 875, 50, HALF_PI+PI/7, PI);
  //stripes bottom right
  arc(375, 80, 875, 750, 0, HALF_PI-PI/14);
  arc(375, 110, 875, 650, 0, HALF_PI-PI/12);
  arc(375, 140, 875, 550, 0, HALF_PI-PI/10);
  arc(375, 170, 875, 450, 0, HALF_PI-PI/8);
  arc(375, 200, 875, 350, 0, HALF_PI-PI/8);
  arc(375, 225, 875, 250, 0, HALF_PI-PI/8);
  arc(375, 250, 875, 150, 0, HALF_PI-PI/8);
  arc(375, 275, 875, 50, 0, HALF_PI-PI/7);
  //stripes top left
  arc(375, 490, 875, 750, PI, PI+HALF_PI-PI/14);
  arc(375, 460, 875, 650, PI, PI+HALF_PI-PI/12);
  arc(375, 430, 875, 550, PI, PI+HALF_PI-PI/10);
  arc(375, 400, 875, 450, PI, PI+HALF_PI-PI/8);
  arc(375, 375, 875, 350, PI, PI+HALF_PI-PI/8);
  arc(375, 350, 875, 250, PI, PI+HALF_PI-PI/8);
  arc(375, 325, 875, 150, PI, PI+HALF_PI-PI/8);
  arc(375, 300, 875, 50, PI, PI+HALF_PI-PI/7);
  //stripes top right
  arc(375, 490, 875, 750, PI+HALF_PI+PI/14, TWO_PI);
  arc(375, 460, 875, 650, PI+HALF_PI+PI/12, TWO_PI);
  arc(375, 430, 875, 550, PI+HALF_PI+PI/10, TWO_PI);
  arc(375, 400, 875, 450, PI+HALF_PI+PI/8, TWO_PI);
  arc(375, 375, 875, 350, PI+HALF_PI+PI/8, TWO_PI);
  arc(375, 350, 875, 250, PI+HALF_PI+PI/8, TWO_PI);
  arc(375, 325, 875, 150, PI+HALF_PI+PI/8, TWO_PI);
  arc(375, 300, 875, 50, PI+HALF_PI+PI/7, TWO_PI);
  //circles
  strokeWeight(10);
  stroke(48,13,165);
  ellipse(375, 285, 370, 370); //Large center circle
  ellipse(375, -45, 285, 285);
  ellipse(375, 615, 285, 285);
  ellipse(0, 285, 355, 355);
  ellipse(750, 285, 355, 355);
  ellipse(375, 285, 235, 235); //Medium center circle
  ellipse(375, 285, 100, 100); //Small center circle
  ellipse(260, 285, 125, 125);
  ellipse(490, 285, 125, 125);
  ellipse(-190,  285, 750, 690);
  ellipse(940, 285, 750, 690);
  ellipse(375, 285, 750, 630); //Xtra Large Center Circle
  ellipse(750, 285, 650, 775);
  ellipse(0, 285, 650, 775);
  ellipse(100, 285, 650, 775);
  ellipse(650, 285, 650, 775);
  ellipse(230, 285, 650, 775);
  ellipse(520, 285, 650, 775);
  ellipse(375, 100, 850, 750);
  ellipse(375, 470, 850, 750);
  arc(375, 425, 480, 510, PI+QUARTER_PI,TWO_PI - QUARTER_PI);
  arc(375, 145, 480, 510, QUARTER_PI,PI - QUARTER_PI);
  
  //smaller circles
  strokeWeight(1);
  for (int i = 100; i < 235; i = i + 25){
    ellipse(375, 285, i, i);
  }
  for (int i = 0; i< 285; i = i + 25){
    ellipse(375, -45, i, i);
  }
  for(int i = 0; i < 285; i = i + 25){
    ellipse(375, 615, i, i);
  }
  for (int i = 0; i < 355; i = i + 25){
    arc(0, 285, i, i, QUARTER_PI, HALF_PI);
    arc(0, 285, i, i, PI+HALF_PI, TWO_PI - QUARTER_PI);
    arc(750, 285, i, i, HALF_PI, PI-QUARTER_PI);
    arc(750, 285, i, i, PI+QUARTER_PI, PI+HALF_PI);
  }
    //bottom left arcs
    arc(375, 285, 720, 600, HALF_PI+PI/7.5, PI-PI/4.25);
    arc(375, 285, 700, 570, HALF_PI+PI/7.5, PI-PI/4.25);
    arc(375, 285, 680, 540, HALF_PI+PI/8, PI-PI/4.25);
    arc(375, 285, 660, 510, HALF_PI+PI/8.5, PI-PI/4.25);
    arc(375, 285, 640, 480, HALF_PI+PI/9, PI-PI/4.25);
    arc(375, 285, 620, 450, HALF_PI+PI/11, PI-PI/4.25);
    arc(375, 285, 600, 420, HALF_PI+PI/12.5, PI-PI/5.5);
    //bottom right arcs
    arc(375, 285, 720, 600, PI/4.25, HALF_PI-PI/7.5);
    arc(375, 285, 700, 570, PI/4.25, HALF_PI-PI/7.5);
    arc(375, 285, 680, 540, PI/4.25, HALF_PI-PI/8);
    arc(375, 285, 660, 510, PI/4.25, HALF_PI-PI/8.5);
    arc(375, 285, 640, 480, PI/4.25, HALF_PI-PI/9);
    arc(375, 285, 620, 450, PI/4.25, HALF_PI-PI/11);
    arc(375, 285, 600, 420, PI/4.5, HALF_PI-PI/12.5);
    //top left arcs
    arc(375, 285, 720, 600, PI + PI/4.25, PI + HALF_PI-PI/7.5);
    arc(375, 285, 700, 570, PI+ PI/4.25, PI + HALF_PI-PI/7.5);
    arc(375, 285, 680, 540, PI + PI/4.25,PI + HALF_PI-PI/8);
    arc(375, 285, 660, 510, PI + PI/4.25,PI + HALF_PI-PI/8.5);
    arc(375, 285, 640, 480, PI + PI/4.25,PI + HALF_PI-PI/9);
    arc(375, 285, 620, 450, PI + PI/4.25,PI + HALF_PI-PI/11);
    arc(375, 285, 600, 420, PI + PI/4.5,PI + HALF_PI-PI/12.5);
    //top right arcs
    arc(375, 285, 720, 600,PI + HALF_PI+PI/7.5, TWO_PI-PI/4.25);
    arc(375, 285, 700, 570,PI + HALF_PI+PI/7.5, TWO_PI-PI/4.25);
    arc(375, 285, 680, 540,PI +  HALF_PI+PI/8, TWO_PI-PI/4.25);
    arc(375, 285, 660, 510,PI + HALF_PI+PI/8.5, TWO_PI-PI/4.25);
    arc(375, 285, 640, 480,PI + HALF_PI+PI/9, TWO_PI-PI/4.25);
    arc(375, 285, 620, 450,PI + HALF_PI+PI/11, TWO_PI-PI/4.25);
    arc(375, 285, 600, 420,PI + HALF_PI+PI/12.5, TWO_PI-PI/4.5);
    
    // bottom left
    arc(-170, 285, 750, 690, PI/4.35, PI/2);
    arc(-150, 285, 750, 690, PI/4.25, PI/2);
    arc(-130, 285, 750, 690, PI/4.10, PI/2);
    arc(-110, 285, 750, 690, PI/3.9, PI/2);
    arc(-90, 285, 750, 690, PI/3.7, PI/2);
    arc(-70, 285, 750, 690, PI/3.6, PI/2);
    arc(-50, 285, 750, 690, PI/3.5, PI/2);
    arc(-30, 285, 750, 690, PI/3.4, PI/2);
    //top left
    arc(-170, 285, 750, 690,PI*1.5, 2*PI- PI/4.35);
    arc(-150, 285, 750, 690,PI*1.5, 2*PI-  PI/4.25);
    arc(-130, 285, 750, 690,PI*1.5, 2*PI-  PI/4.10);
    arc(-110, 285, 750, 690,PI*1.5, 2*PI-  PI/3.9);
    arc(-90, 285, 750, 690,PI*1.5, 2*PI-  PI/3.7);
    arc(-70, 285, 750, 690,PI*1.5, 2*PI-  PI/3.6);
    arc(-50, 285, 750, 690,PI*1.5, 2*PI-  PI/3.5);
    arc(-30, 285, 750, 690,PI*1.5, 2*PI-  PI/3.4);    
    //
    arc(940, 285, 750, 690,PI+ PI/4.5, PI*1.5);
    arc(920, 285, 750, 690,PI+  PI/4.5, PI*1.5);
    arc(900, 285, 750, 690,PI+  PI/4.25, PI*1.5);
    arc(880, 285, 750, 690,PI+  PI/4, PI*1.5);
    arc(860, 285, 750, 690,PI+  PI/3.9, PI*1.5);
    arc(840, 285, 750, 690,PI+  PI/3.8, PI*1.5);
    arc(820, 285, 750, 690,PI+ PI/3.6, PI*1.5);
    arc(800, 285, 750, 690,PI+  PI/3.5, PI*1.5);  
    //    
    arc(940, 285, 750, 690,PI/2,PI- PI/4.5);
    arc(920, 285, 750, 690, PI/2,PI-  PI/4.5);
    arc(900, 285, 750, 690, PI/2,PI-  PI/4.25);
    arc(880, 285, 750, 690, PI/2,PI-  PI/4);
    arc(860, 285, 750, 690, PI/2,PI-  PI/3.9);
    arc(840, 285, 750, 690, PI/2,PI-  PI/3.8);
    arc(820, 285, 750, 690, PI/2,PI- PI/3.6);
    arc(800, 285, 750, 690, PI/2,PI-  PI/3.5);
    
    arc(258, 285, 170, 30, PI/2, PI);
    arc(258, 285, 170, 50, PI/2, PI);
    arc(258, 285, 170, 70, PI/2, PI);
    arc(258, 285, 170, 90, PI/2, PI);
    arc(258, 285, 170, 30, PI, PI*1.5);
    arc(258, 285, 170, 50, PI, PI*1.5);
    arc(258, 285, 170, 70, PI, PI*1.5);
    arc(258, 285, 170, 90, PI, PI*1.5);
    arc(248, 285, 30, 30, PI/2, PI*1.5);
    arc(233, 285, 30, 30, PI/2, PI*1.5);

    arc(492, 285, 170, 30, PI+PI/2, TWO_PI);
    arc(492, 285, 170, 50, PI+PI/2, TWO_PI);
    arc(492, 285, 170, 70, PI+PI/2, TWO_PI);
    arc(494, 285, 170, 90, PI+PI/2, TWO_PI);
    arc(492, 285, 170, 30, 0, PI*.5);
    arc(492, 285, 170, 50, 0, PI*.5);
    arc(492, 285, 170, 70, 0, PI*.5);
    arc(492, 285, 170, 90, 0, PI*.5);
    arc(502, 285, 30, 30, 0, PI/2);
    arc(502, 285, 30, 30, PI*1.5, TWO_PI);
    arc(517, 285, 30, 30, 0, PI/2);
    arc(517, 285, 30, 30, PI*1.5, TWO_PI);
  //  
  //orange stripes and circles
  stroke(239,166,41);
  strokeWeight(7);
  for (int i = 15; i < 100; i = i + 35){
    ellipse(375, 285, i, i);
  }
  
}


