
int page = 1;
PFont font;
float speed =3;
float x;
float tt,tt1,tt2,qq = 5.0;
PImage a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u;
//dd
int x1= 10;
int y1 = 100;
int w1 = 80;
int h1 = 80;

int x2= 10;
int y2 = 100;
int w2 = 80;
int h2 = 80;


int x3= 20;
int y3 =335;
int w3 =70;
int h3 = 25;

int x4= 135;
int y4 =335;
int w4 =120;
int h4 = 25;


int x5= 290;
int y5 =335;
int w5 =93;
int h5 = 25;

//r
int x6= 10;
int y6 = 220;
int w6 = 80;
int h6 = 80;

int x7= 10;
int y7 = 115;
int w7 = 72;
int h7 =55;

int x8= 10;
int y8 = 180;
int w8 = 72;
int h8 = 46;

int x9= 10;
int y9 = 240;
int w9 = 72;
int h9 = 46;

int x10= 73;
int y10 = 170;
int w10= 70;
int h10 = 130;

int x11= 180;
int y11 = 150;
int w11= 160;
int h11 = 160;

int x20= 307;
int y20 = 0;
int w20= 93;
int h20 = 20;

void setup() {
  size(400,400);
  smooth();
  font = loadFont("HelveticaRounded-Bold-26.vlw");
  textFont(font);
  a=loadImage("bg.jpg");
  b=loadImage("sweat.png");
  c=loadImage("001.png");
  d=loadImage("004.png");
  e=loadImage("mos.png");
  f=loadImage("qr.png");
  g=loadImage("r_1.png");
  h=loadImage("r_2.png");
  i=loadImage("r_3.png");
  j=loadImage("q.png");
  k =loadImage("b2r_1.png");
  l =loadImage("b2r_2.png");
  m =loadImage("b2r_3.png");
  n=loadImage("2eye.png");
  o =loadImage("ar_1.png");
  p =loadImage("ar_2.png");
  q =loadImage("ar_3.png");
  r=loadImage("d1.png");
  s =loadImage("d2.png");
  t =loadImage("d3.png");
  u= loadImage("002.png");
  smooth();
}


void draw()
{
  if (page == 1) {
    page1();
  } 
  else if (page == 2) {

    page2();
  } 
  else if (page == 3) {
    page3();
  }
  else if (page == 4) {
    page4();
  }
  else if (page == 5) {
    page5();
  }
  else if (page == 6) {
    page6();
  }
  else if (page == 7) {
    page7();
  }
  else if (page == 8) {
    page8();
  }
  else if (page == 9) {
    page9();
  }
  else if (page == 10) {
    page10();
  }
  else if (page == 11) {
    page11();
  }
  else if (page == 12) {
    page12();
  }

  else if (page == 13) {
    page13();
  }
  else if (page == 14) {
    page14();
  }
  else if (page == 15) {
    page15();
    
  }
}



void mousePressed() {

  if (page == 1) {
    if (overButton (x1, y1, w1, h1) == true) {
      page = 2;
    }
    if (page == 1) {
      if (overButton (x6,y6,w6,h6) == true) {
        page = 6;
      }
    }
  }

  else if (page == 2) {
    if (overButton (x3, y3, w3, h3) == true) {
      page = 3;
tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
    if(overButton (x4,y4,w4,h4) == true) {
      page = 4;
tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
    if(overButton (x5,y5,w5,h5) == true) {
      page = 5;
tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
  }



  else if (page == 6) {
    if (overButton (x7, y7, w7, h7) == true) {
      page = 7;
    }
    if(overButton (x8,y8,w8,h8) == true) {
      page = 8;
    }
    if(overButton (x9,y9,w9,h9) == true) {
      page = 9;
    }
  }



  else if (page == 7) {
    if (overButton (x10, y10, w10, h10) == true) {
      page = 10;
      tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
    if(overButton (x11,y11,w11,h11) == true) {
      page = 11;
      tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
  }

  else if (page == 8) {
    if (overButton (x10, y10, w10, h10) == true) {
      page = 12;
      tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
    if(overButton (x11,y11,w11,h11) == true) {
      page = 13;
      tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
  }

  else if (page == 9) {
    if (overButton (x10, y10, w10, h10) == true) {
      page = 14;
      tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
    if(overButton (x11,y11,w11,h11) == true) {
      page = 15;
      tt = 5.0;
tt1 = 5.0;
tt2 = 5.0;
qq = 5.0;
    }
  }


  else if (page == 9) {
    if (overButton (x10, y10, w10, h10) == true) {
      page = 10;
    }
    if(overButton (x11,y11,w11,h11) == true) {
      page = 11;
    }
  }

  else if (page ==3) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;

    }
  }
  
    else if (page ==4) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==5) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==10) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==11) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==12) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==13) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==14) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    else if (page ==15) {
    if (overButton (x20, y20, w20, h20) == true) {
      page = 1;
    }
  }
    

}






boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true;
  } 
  else {
    return false;
  }
}




void page1() {
  image(a,0,0);
  image(c,10,120);
  image(d,10,220);
  textSize(26);
  text("Q. Why the bird quaking?",45,65);

  v(x,0);
  x += random(-speed,speed);
}




void page2() {
  image(a,0,0);
  image(c,10,120);


  noStroke();
  fill(24,173,241);
  quad(0,340,400,340,400,360,0,360);

  fill(255);
  textSize(26);
  text("Q. What shape do you want?",20,65);
  textSize(16);
  text("1 Coiled          2 Disconnected        3 Downright",30,355);
  v(-20,0); 

  tt= tt + 1; //speed
  if (tt>= 32) {  
    tt=32;
  }
  ddd(-50,tt);
}







void page3() {
   pushMatrix();  

  dp();
  tt1 = tt1 + 1; //speed
  if (tt1 >= 32) {  
    tt1=32;
  }
  d1(-50,tt1);
  popMatrix();
}
void page4() {
  dp();
  tt1 = tt1 + 1; //speed
  if (tt1 >= 32) {  
    tt1=32;
  }
  d2(-50,tt1);
}



void page5() {
  dp();
  tt1 = tt1 + 1; //speed
  if (tt1 >= 32) {  
    tt1=32;
  }
  d3(-50,tt1);
}

void page6() {
  image(a,0,0);
  noStroke();
  fill(24,173,241);
  quad(0,133,60,133,60,148,0,148);
  quad(0,195,60,195,60,210,0,210);
  quad(0,255,60,255,60,270,0,270);
  image(g,40,120);
  image(h,40,180);
  image(i,40,240);
  fill(255); 
  textSize(26);
  text("Q. What egg do you want?",35,65);
  textSize(15);
  text("1",20,145);
  text("2",18,208);
  text("3",18,268);

  v(-20,15);


  tt1 = tt1 + 1; //speed
  if (tt1 >= 32) {  
    tt1=32;
  }
  rrr(-50,tt1);
}



void page7() {
  way(0,0);
}
void page8() {
  way(0,0);
}
void page9() {
  way(0,0);
}
void page10() {
  pushMatrix();
  qq = qq + 0.9; //speed
  if (qq >= 70) { 
    qq=70;
  }
  baby1(0,-qq);
    popMatrix();
  Restart();
}
void page11() {
  pushMatrix(); 
  qq = qq + 0.9; //speed
  if (qq >= 70) { 
    qq=70;
  }
  ar1(0,-qq);
  popMatrix();
  Restart();
}

void page12() {
  pushMatrix();
  qq = qq + 0.9; //speed
  if (qq >= 70) { 
    qq=70;
  }
  baby2(0,-qq);
    popMatrix();
  Restart();
}

void page13() {
  pushMatrix();  

  qq = qq + 0.9; //speed
  if (qq >= 70) { 
    qq=70;
  }
  ar2(0,-qq);
  popMatrix();
  Restart();
}
void page14() {
pushMatrix();
  qq = qq + 0.9; //speed
  if (qq >= 70) { 
    qq=70;
  }
  baby3(0,-qq);
    popMatrix();
  Restart();
}
void page15() {
  pushMatrix();  
  qq = qq + 0.9; //speed
  if (qq >= 70) { 
    qq=70;
  }
  ar3(0,-qq);
  popMatrix();
  Restart();
}




void bird(int x, int y, float s) {
  pushMatrix();
  scale(s);
  translate(x,y);


  stroke(255);
  strokeWeight(5);
  noFill();
  //head
  arc(100,100,100,120,PI,TWO_PI);

  //mouse
  triangle(30,79,50,100,56,70);
  //body
  arc(150,100,200,200,0,PI);


  //leg
  line(130,198,130,225);
  line(130,225,115,225);

  line(180,195,180,220);
  line(180,220,165,218);

  //tail
  beginShape();
  vertex(150, 100);
  bezierVertex(260, 100, 245, 30, 250, 100);
  endShape();
  //tail2
  beginShape();
  vertex(250, 105);
  bezierVertex(280, 110, 285, 100, 243, 140);
  endShape();
  //wing
  beginShape();
  vertex(150, 100);
  bezierVertex(200, 130, 215, 80, 210, 120);
  bezierVertex(206, 130, 200, 167, 148, 155);
  endShape();

  popMatrix();
}


void v(float g, float h) {
  translate(g,h);
  bird(102,80,1);
  //xeye
  strokeWeight(3);
  line(170,170,190,155);
  line(170,155,190,170);
  image(b,210,170);
}

void r(float n1,float b1) {
  translate(n1,b1);
  image(f,10,280);
}



void normaleye(int v, int w) {
  translate(v,w);
  //eye
  strokeWeight(2);
  ellipse(172,170,10,10);
  //eyelid
  strokeWeight(3);
  line(168,150,180,150);
}


void baby(int x1, int y1, float s1) {
  pushMatrix();
  scale(s1);
  translate(x1,y1);


  fill(255,0,0);
  noStroke();
  triangle(93,221,105,221,92,205);
  triangle(95,221,110,205,108,221);
  //babyhead
  fill(255);
  ellipse(100,230,30,30);

  //babybody
  ellipse(100,255,40,40);
  //babyeye
  fill(0);
  ellipse(92,227,3,3);
  ellipse(108,227,3,3);
  popMatrix();
}
void rrr(float rr1,float rr2) {
  translate(rr1,rr2);
  image(f,380,240);
}

void ddd(float dd1,float dd2) {
  translate(dd1,dd2);
  image(e,390,240);
}

void d1(float ddd1,float ddd2) {
  translate(ddd1,ddd2);
  image(r,360,290);
}

void d2(float ddd1,float ddd2) {
  translate(ddd1,ddd2);
  image(s,360,310);
}

void d3(float ddd1,float ddd2) {
  translate(ddd1,ddd2);
  image(t,375,275);
}
void oldbird(int obx, int oby) {
  translate(obx,oby);
  bird(253,180,0.68);
}

void way(int xx,int yy) {
  translate(xx,yy);
  image(a,0,0);
  noStroke();
  fill(24,173,241);
  quad(80,280,150,280,150,310,80,310);
  quad(225,280,310,280,310,310,225,310);
  fill(255);
  textSize(26);
  text("Q. What do you want",65,65);
  text("to see the egg?",97,95);
  textSize(16);
  text("baby",95,300);
  text("1year later",230,300);
  baby(-15,-70,1.3);
  oldbird(0,0);
  fill(255,0,0);
  textSize(80);
  text("?",230,240);
}

void baby1(float br, float bm) {

  translate(br,bm);
  image(a,0,-100);
  image(a,0,0);
  baby(20,-10,1.6);
  image(k,125,349);
  textSize(26);
  fill(255);

    text("What's up!",130,170);

}

void baby2(float br, float bm) {

  translate(br,bm);
  image(a,0,-100);
  image(a,0,0);
  baby(20,-10,1.6);
  image(l,125,355);
  textSize(26);
  fill(255);
  text("Hello!!",160,170);

}


void baby3(float br, float bm) {
  translate(br,bm);
  image(a,0,-100);
  image(a,0,0);
  baby(20,-10,1.6);
  image(m,125,357);
  textSize(26);
  fill(255);
  text("Nice to meey you!!",80,170);
}

void ar1(float r, float m) {
  translate(r,m);
  image(a,0,-100);
  image(a,0,0);
  image(o,80,240);
  textSize(26);
  fill(255);
  text("Nice to meey you!!",80,170);
}

void ar2(float r, float m) {
  translate(r,m);
  image(a,0,-100);
  image(a,0,0);
  image(p,80,240);
  textSize(26);
  fill(255);
  text("Nice to meey you!!",80,170);
}

void ar3(float r, float m) {
  translate(r,m);
  image(a,0,-100);
  image(a,0,0);
  image(q,80,240);
  textSize(26);
  fill(255);
  text("Nice to meey you!!",80,170);
}


void dp() {
   pushMatrix();  
  image(a,0,-50);
  bird(102,60,1);
  image(u,10,80);
  image(n,165,140);
  //wig
  strokeWeight(7);
  line(140,306,400,261);
  Restart();
  popMatrix();
}

void Restart() {
   pushMatrix();  
  noStroke();
  fill(255,0,0);
  ellipse(317,15,17,17);
  fill(255);
  textSize(16);
  text("Restart",330,20);
  popMatrix();
}


