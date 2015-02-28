
int card = 0; 
PImage a,b,c,d,e,f,g,h,i,j,k,l,m,n,o;

void setup() {
  size(700,500);
  smooth();
  noStroke();
  a= loadImage("11.png");
  b= loadImage("111.PNG");
  c= loadImage("22.png");
  d= loadImage("222.PNG");
  e= loadImage("3.png");
  f= loadImage("dd.PNG");
  g= loadImage("4-1.png");
  h= loadImage("4-2.png");
  i= loadImage("444.PNG");
  j= loadImage("5.png");
  k= loadImage("555.PNG");
  l= loadImage("6.png");
  m= loadImage("gg.PNG");
  n= loadImage("sd1.png");
  o= loadImage("000.png");
  
}

//셑업




void draw() { 
  if (card == 0) {
    background(0);
    image(b,0,0,700,500);  
    cup1(320,220,0.5);
  }

  else if (card ==1) {
    background(0);
    image(d,0,0,700,500);
    cup2(430,80,0.35);
  }

  else if (card ==2) {
    background(255);
    image(f,300,220,300,200);
    image(o,0,0,700,500);
    cup3(-40,50,0.8);
  }

  else if (card ==3) {
    background(0);
    image(i,0,0,700,500);
    cuple(1,56,0.6);
    cup4(170,100,0.6);
  }
  else if (card ==4) {
    background(0);
    image(k,0,0,700,500);  
    rect(400,450,300,200);
    cup5(465,290,0.4);
  }
  else if (card ==5) {
    background(0);
    image(m,0,0,700,500);
    cup6(340,350,0.12);
    cup6(180,360,0.12);
    image(l,339,325,70,50);
    image(l,179,335,70,50);
  }
  else if (card ==6) {
    background(0);
    image(n,0,0,700,500);
  }
}

void mousePressed() {  

  if( card == 0 ) {
    if((mouseX> 392) && ( mouseX < 392+160) && (mouseY < 263+203)&& (mouseY > 263)) { // 사각형 버튼
      card = 1;
    }
    else card = 0;
  } 
  else if ( card == 1 ) {
    if((mouseX> 479) && ( mouseX < 479+123) && (mouseY < 105+149)&& (mouseY > 149)) { // 사각형 버튼
      card = 3;
    }
    else card = 0;
  } 
  else if ( card == 2 ) {
    if((mouseX> 70) && ( mouseX < 70+264) && (mouseY < 110+327)&& (mouseY > 327)) { // 사각형 버튼
      card = 1;
    }
    else card = 2;
  } 

  else if ( card == 3 ) {
    if((mouseX> 266) && ( mouseX < 266+187) && (mouseY < 147+250)&& (mouseY > 250)) { // 사각형 버튼
      card = 5;
    }
    else card = 4;
  } 
  else if ( card == 4 ) {
    if((mouseX> 493) && ( mouseX < 493+192) && (mouseY < 285+271)&& (mouseY > 271)) { // 사각형 버튼
      card = 3;
    }
    else card = 2;
  } //맥



  else if ( card == 5 ) {
    if((mouseX> 158) && ( mouseX < 158+266) && (mouseY < 306+713)&& (mouseY > 713)) { // 사각형 버튼
      card = 6;
    }
    else card = 6;
  }

  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}
//

void cup1(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);


  fill(255,140,155); 
  ellipse(430,300,200,260);
  fill(210);
  ellipse(430,300,132,196);
  fill(255,240,255);
  rect(155,140,290,300);
  fill(255,140,155);
  ellipse(300,140,290,90);
  fill(255,240,255);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(255);
  ellipse(300,160,200,40);
  image(a,155,140,290,350);
  popMatrix();
}


void cup2(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);

  fill(255,100,20); 
  ellipse(430,300,200,260);
  fill(147,134,141);
  ellipse(430,300,132,196);
  fill(255,240,180);
  rect(155,140,290,300);
  fill(255,100,20);
  ellipse(300,140,290,90);
  fill(255,240,180);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(255,190,210);
  ellipse(300,160,200,40);
  image(c,155,140,290,300);
  popMatrix();
} 


void cup3(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);

  fill(70); 
  ellipse(430,300,200,260);
  fill(255);
  ellipse(430,300,132,196);
  fill(240);
  rect(155,140,290,300);
  fill(70);
  ellipse(300,140,290,90);
  fill(240);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(200,225,255);
  ellipse(300,160,200,40);
  image(e,265,190,180,240);
  popMatrix();
} 
void cuple(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);

  fill(120,180,255); 
  ellipse(160,300,200,260);
  fill(246,168,210);
  ellipse(160,300,132,196);
  fill(250);
  rect(155,140,290,300);
  fill(120,180,255);
  ellipse(300,140,290,90);
  fill(250);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(255,120,160);
  ellipse(300,160,200,40);
  image(h,245,140,250,300);
  popMatrix();
} 

void cup4(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);

  fill(255,120,160); 
  ellipse(430,300,200,260);
  fill(238,228,239);
  ellipse(430,300,132,196);
  fill(250);
  rect(155,140,290,300);
  fill(255,120,160);
  ellipse(300,140,290,90);
  fill(250);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(244);
  ellipse(300,160,200,40);
  image(g,110,140,250,300);
  popMatrix();
} 
void cup5(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);
  fill(211); 
  ellipse(430,300,200,260);
  fill(227,223,123);
  ellipse(430,300,132,196);
  fill(235);
  rect(155,140,290,300);
  fill(211);
  ellipse(300,140,290,90);
  fill(235);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(236,198,76);
  rect(185,160,230,280);
  fill(123,73,0);  
  ellipse(220,300,32,200);
  ellipse(300,300,32,200);
  ellipse(380,300,32,200);
  fill(189,145,79);
  ellipse(300,440,230,50);
  image(j,125,0,370,270);
  popMatrix();
} 
void cup6(int x, int y,float s) { 
  pushMatrix();
  translate(x,y);
  scale(s);

  fill(255,100,20); 
  ellipse(430,300,200,260);
  fill(248);
  ellipse(430,300,132,196);
  fill(255);
  rect(155,140,290,300);
  fill(255,100,20);
  ellipse(300,140,290,90);
  fill(255);
  ellipse(300,440,290,90);
  fill(130);
  ellipse(300,140,280,80);
  fill(255,170,80);
  ellipse(300,160,200,40);


  popMatrix();
}
//컵함수넣는곳


