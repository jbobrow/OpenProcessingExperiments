
void setup(){
  size(600,600);
  background(0);
  noStroke();
  for(int i=0;i<50;i++){
    fill(250,255-i*5,0);
    rect(0.0,height*i/50,width,height/50);
  }
  fill(0);
  dragon();
}
float aimite(float x1,float x2,float y1,float y2,float m1,float m2,float x){
  float a1,a2,b1,b2,h,y;
  h=x1-x2;
  a1=pow((x-x2)/h,2)*(1+2*(x1-x)/h);
  a2=pow((x1-x)/h,2)*(1+2*(x-x2)/h);
  b1=pow((x-x2)/h,2)*(x1-x);
  b2=pow((x1-x)/h,2)*(x-x2);
  y=a1*y1+a2*y2-b1*m1+b2*m2;
  return y;
}
void finger(){
  fill(255,255,0);
  stroke(0);
  ellipse(-10,0,30,25);
  ellipse(-40,0,40,25);
  ellipse(-70,0,30,25);
  beginShape();
  for(int i=0;i<10;i++){
    vertex(-70+40*cos(-PI/2-i*PI/20),12.5+25*sin(-PI/2-i*PI/20));
  }
  vertex(-100,12.5);
  vertex(-70,12.5);
  endShape();
}
void foot(){
  stroke(0);
  fill(255,255,0);
  pushMatrix();
  rotate(-PI/6);
  beginShape();
  for(int i=-20;i<=0;i++){
    vertex(100*cos(i*PI/40),100+100*sin(i*PI/40));
  }
  for(int i=20;i<=40;i++){
    vertex(100+100*cos(i*PI/40),100*sin(i*PI/40));
  }
  endShape();
  popMatrix();
  pushMatrix();
  translate(100*sqrt(2)*cos(PI/12),100*sqrt(2)*sin(PI/12));
  rotate(5*PI/9);
  beginShape();
  for(int i=-20;i<=0;i++){
    vertex(100*cos(i*PI/40),100+100*sin(i*PI/40));
  }
  for(int i=20;i<=40;i++){
    vertex(100+100*cos(i*PI/40),100*sin(i*PI/40));
  }
  endShape();
  popMatrix();
  noStroke();
   pushMatrix();
  translate(40,120);
  scale(-1,1);
  finger();
  popMatrix();
   pushMatrix();
  translate(40,120);
  rotate(PI/9);
  finger();
  popMatrix();
  pushMatrix();
  translate(40,120);
  rotate(PI/18);
  finger();
  popMatrix();
  pushMatrix();
  translate(40,120);
  finger();
  popMatrix();
}
void knot(){
  pushMatrix();
  scale(0.8);
  fill(255,0,0);
  beginShape(TRIANGLES);
  vertex(0,-50);
  vertex(50,-75);
  vertex(50,-50);
  endShape();
  fill(255,255,0.0);
    noStroke();
  beginShape();
  vertex(0,-50);
  vertex(50,-50);
  for(int i=-10;i<=10;i++){
    vertex(50+50*cos(i*PI/20),50*sin(i*PI/20));
  }
  vertex(0,50);
  endShape();
  stroke(0);
 for(int k=0;k<5;k++){
   if(k%2==0){
   for(int j=0;j<5;j++)
     for(int i=-5;i<5;i++){
       line(k*10+10*cos(i*PI/10),-40+j*20+10*sin(i*PI/10),k*10+10*cos((i+1)*PI/10),-40+j*20+10*sin((i+1)*PI/10));
     }
   }
   else{
     for(int i=0;i<5;i++){
       line(k*10+10*cos(i*PI/10),-50+10*sin(i*PI/10),k*10+10*cos((i+1)*PI/10),-50+10*sin((i+1)*PI/10));
     }
      for(int j=0;j<4;j++)
     for(int i=-5;i<5;i++){
       line(k*10+10*cos(i*PI/10),-30+j*20+10*sin(i*PI/10),k*10+10*cos((i+1)*PI/10),-30+j*20+10*sin((i+1)*PI/10));
     }
      for(int i=-5;i<0;i++){
       line(k*10+10*cos(i*PI/10),50+10*sin(i*PI/10),k*10+10*cos((i+1)*PI/10),50+10*sin((i+1)*PI/10));
     }
   }
 }
  for(int k=0;k<4;k++)
        for(int j=0;j<4-k;j++)
          for(int i=-10;i<10;i++){
            line(50+k*10+10*cos(i*PI/20),-30+k*10+j*20+10*sin(PI*i/20),50+k*10+10*cos((i+1)*PI/20),-30+k*10+j*20+10*sin(PI*(i+1)/20));
          }
popMatrix();
}
void eye(){
  pushMatrix();
  scale(0.5);
  fill(255);
  stroke(0);
  ellipse(0,0,50,50);
  fill(0);
  ellipse(-10,0,30,30);
  popMatrix();
}
void dragon(){
  int i,j;
        //foot3
     pushMatrix();
     translate(450,370);
     foot();
     popMatrix();
      //foot2
     pushMatrix();
     translate(200,370);
     foot();
     popMatrix();
     //knot19
     pushMatrix();
     translate(590,330);
     rotate(-PI/3);
     knot();
     popMatrix();
     //knot18
     pushMatrix();
     translate(560,370);
     rotate(-PI/3);
     knot();
     popMatrix();
  //knot17
     pushMatrix();
     translate(550,410);
     rotate(-PI/2);
     knot();
     popMatrix();
  //knot16
     pushMatrix();
     translate(520,440);
     rotate(-PI/4);
     knot();
     popMatrix();
  //knot16
     pushMatrix();
     translate(480,440);
     knot();
     popMatrix();
  //knot16
     pushMatrix();
     translate(455,410);
     rotate(PI/4);
     knot();
     popMatrix();
  //knot15
     pushMatrix();
     translate(455,370);
     rotate(PI/2);
     knot();
     popMatrix();
   //knot14
     pushMatrix();
     translate(460,320);
     rotate(5*PI/9);
     knot();
     popMatrix();
  //knot13
     pushMatrix();
     translate(480,270);
     rotate(2*PI/3);
     knot();
     popMatrix();
  //knot12
     pushMatrix();
     translate(480,230);
     rotate(PI/2);
     knot();
     popMatrix();
  //knot12
     pushMatrix();
     translate(450,200);
     rotate(PI/4);
     knot();
     popMatrix();
  //knot11
     pushMatrix();
     translate(410,180);
     rotate(PI/6);
     knot();
     popMatrix();
  //knot11
     pushMatrix();
     translate(370,200);
     rotate(-PI/6);
     knot();
     popMatrix();
  //knot11
     pushMatrix();
     translate(340,230);
     rotate(-PI/3);
     knot();
     popMatrix();
  //knot10
     pushMatrix();
     translate(340,270);
     rotate(-PI/2);
     knot();
     popMatrix();
  //knot9
     pushMatrix();
     translate(340,320);
     rotate(-PI/2);
     knot();
     popMatrix();
  //knot8
     pushMatrix();
     translate(340,370);
     rotate(-PI/2);
     knot();
     popMatrix();
  //knot7
     pushMatrix();
     translate(320,420);
     rotate(-PI/3);
     knot();
     popMatrix();
  //knot6
     pushMatrix();
     translate(280,420);
     knot();
     popMatrix();
  //knot5
     pushMatrix();
     translate(240,400);
     rotate(PI/6);
     knot();
     popMatrix();
    //knot4
     pushMatrix();
     translate(240,360);
     rotate(PI/2);
     knot();
     popMatrix();
         //foot1
     pushMatrix();
     translate(250,430);
     foot();
     popMatrix();
           //foot4
     pushMatrix();
     translate(470,430);
     foot();
     popMatrix();
      //knot3
     pushMatrix();
     translate(240,310);
     rotate(PI/2);
     knot();
     popMatrix();
       //knot2
     pushMatrix();
     translate(165+50*cos(PI/6),245+50*sin(PI/6));
     rotate(PI/4);
     knot();
     popMatrix();
    //knot1
    pushMatrix();
     translate(165,245);
     rotate(PI/6);
     knot();
     popMatrix();
     noStroke();
    fill(255,255,0);
     beginShape(QUADS);
     //face
     for(i=0;i<10;i++){
     float y1=aimite(100,75,175,200,-1,-1/2,75+i*2.5);
    float y2=aimite(100,75,175,200,-1,-1/2,77.5+i*2.5);
    vertex(75+i*2.5,y1);
    vertex(77.5+i*2.5,y2);
    vertex(177.5+i*2.5,y2);
    vertex(175+i*2.5,y1);
  }
    for(i=0;i<5;i++){
     float y1=aimite(75,85,200,230,-1/3,1,75+2*i);
     float y2=aimite(75,85,200,230,-1/3,1,77+2*i);
    vertex(75+2*i,y1);
    vertex(77+i*2,y2);
    vertex(187+i*2,y2);
    vertex(185+2*i,y1);
    }
     for(i=0;i<10;i++){
     float y1=aimite(45,85,250,230,-1,-1,45+4*i);
     float y2=aimite(45,85,250,230,-1,-1,49+4*i);
      vertex(45+4*i,y1);
      vertex(49+i*4,y2);
      vertex(159+i*4,y2);
      vertex(155+4*i,y1);
     }
      vertex(45,250);
      vertex(45,265);
      vertex(165,265);
      vertex(165,250);
      endShape();
      //out lip
      beginShape(QUADS);
       for(i=0;i<10;i++){
       float y1=aimite(85,60,270,300,-3,-1,60+i*2.5);
       float y2=aimite(85,60,270,300,-3,-1,62.5+i*2.5);
       vertex(60+i*2.5,y1);
       vertex(62.5+i*2.5,y2);
       vertex(72.5+i*2.5,y2);
       vertex(70+i*2.5,y1);
     }
     endShape();
     beginShape();
     for(i=0;i<=10;i++){
       float y1=aimite(60,115,300,320,1,-0.5,60+i*5.5);
      vertex(60+i*5.5,y1);
     }
     for(i=0;i<10;i++){
       float y1=aimite(115,170,320,255,-1,-1.5,115+i*5.5);
       vertex(115+i*5.5,y1);
     }
    vertex(170,255);
    vertex(170,240);
    vertex(60,300);
    endShape();
     //mouth
     beginShape();
     //up
     fill(255,0,0);
     for(i=0;i<10;i++){
       float y1=aimite(125,150,265,235,-1,-2,125+i*2.5);
       vertex(125+i*2.5,y1);
     }
     //down
     for(i=10;i>=0;i--){
       float y1=aimite(150,115,235,300,-3,-1,115+i*3.5);
      vertex(115+i*3.5,y1);
     }
     //down lip
     for(i=0;i<=10;i++){
       float y1=aimite(115,65,300,300,0.5,-0.5,65+i*5);
       vertex(65+i*5,y1);
     }
     //...
     for(i=0;i<=10;i++){
       float y1=aimite(90,65,275,300,-3,-1,65+i*2.5);
       vertex(65+i*2.5,y1);
     }
      endShape();
      fill(255,255,0);
       //up lip1
       beginShape(QUADS);
     for(i=0;i<5;i++){
       float y1=aimite(45,80,265,265,1,-1,45+i*3.5);
       float y2=aimite(45,80,265,265,1,-1,48.5+i*3.5);
       float y3=aimite(45,80,265,265,1,-1,80-i*3.5);
       float y4=aimite(45,80,265,265,1,-1,76.5-i*3.5);
       vertex(45+i*3.5,y1);
       vertex(48.5+i*3.5,y2);
       vertex(76.5-i*3.5,y4);
       vertex(80-i*3.5,y3);
     }
       for(i=0;i<5;i++){
       float y1=aimite(80,125,265,265,1,-1,80+i*9);
       float y2=aimite(80,125,265,265,1,-1,89+i*9);
       float y3=aimite(80,125,265,265,1,-1,125-i*9);
       float y4=aimite(80,125,265,265,1,-1,116-i*9);
       vertex(80+i*9,y1);
       vertex(89+i*9,y2);
       vertex(116-i*9,y4);
       vertex(125-i*9,y3);
     }
     endShape();
     fill(255,0,0);
     //side fur
     beginShape();
     for(i=0;i<10;i++){
       float y=aimite(175,225,175,125,0,-sqrt(3),175+i*5);
       vertex(175+i*5,y);
     }
     for(i=10;i>0;i--){
       float y=aimite(225,175,125,185,-3,0,175+i*5);
       vertex(175+i*5,y);
     }
     endShape();
     beginShape();
     for(i=0;i<5;i++){
       float y=aimite(180,235,185,120,0,-sqrt(3),180+i*11);
       vertex(180+i*11,y);
     }
     for(i=5;i>0;i--){
       float y=aimite(235,180,120,195,-3,0,180+i*11);
       vertex(180+i*11,y);
     }
     endShape();
     beginShape();
     for(i=0;i<10;i++){
       float y=aimite(180,245,190,130,0,-sqrt(3),180+i*6.5);
       vertex(180+i*6.5,y);
     }
     for(i=10;i>0;i--){
       float y=aimite(245,180,130,205,-3,0,180+i*6.5);
       vertex(180+i*6.5,y);
     }
     endShape();
     beginShape();
     for(i=0;i<10;i++){
       float y=aimite(180,240,205,180,0,-1,180+i*6);
       vertex(180+i*6,y);
     }
     for(i=10;i>0;i--){
       float y=aimite(240,180,180,215,-1.5,0,180+i*6);
       vertex(180+i*6,y);
     }
     endShape();
     //the first horn
     fill(0);
     beginShape();
  for(i=0;i<10;i++){
    float y1=aimite(100,200,175,100,-1,0,100+i*10);
    vertex(100+i*10,y1);
  }
    for(i=10;i>0;i--){
     float y1=aimite(125,200,175,100,-sqrt(3),0,125+i*7.5);
    vertex(125+i*7.5,y1);
  }
  endShape();
  fill(250,0.0,0.0);
  beginShape();
  fill(255,0,0);
  //fist head fur
    for(i=0;i<5;i++){
      float y1=aimite(125,150,175,150,-1,0,125+i*5);
      vertex(125+5*i,y1);
    }
    for(i=5;i>0;i--){
      float y1=aimite(150,140,150,175,0,-sqrt(3),140+i*2);
      vertex(140+i*2,y1);
    }
    endShape();
     //second head fur
   beginShape();
        for(i=0;i<5;i++){
      float y1=aimite(135,180,175,125,-1,0,135+i*9);
      vertex(135+i*9,y1);
    }
    for(i=5;i>0;i--){
      float y1=aimite(180,155,125,180,0,-sqrt(3),155+i*5);
      vertex(155+i*5,y1);
    }
   endShape();
     fill(0.0);
  //the second horn from x-150~200 y-100~200
  beginShape();
    for(i=5;i<25;i++){
    float y1=aimite(150,250,175,100,-1,0,125+i*5);
    vertex(125+i*5,y1);
  }
    for(i=20;i>5;i--){
     float y1=aimite(175,250,175,100,-sqrt(3),0,150+i*5);
    vertex(150+i*5,y1);
  }
  endShape();
  pushMatrix();
  translate(130,220);
  eye();
  popMatrix();
    pushMatrix();
  translate(90,220);
  eye();
  popMatrix();
}
    
  
  

