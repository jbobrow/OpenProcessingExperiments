
int card = 0;
float speed = 3;
float x;
float q = 0.0;
float t,t1,t2 = 5.0;
PImage a,b,c,d,e,f,g,h,i,j,k,l;

void setup() {
  size(400,400);
  a = loadImage("bg.jpg");
  b = loadImage("001.png");
  c = loadImage("r_1.png");
  d = loadImage("r_2.png");
  e = loadImage("r_3.png");
  f= loadImage("002.png");
  g = loadImage("003.png");
  h = loadImage("2r_1.png");
  i = loadImage("2r_2.png");
  j = loadImage("2r_3.png");
  k = loadImage("sweat.png");
  l = loadImage("2eye.png");

  smooth();
}

void draw() {

  if (card == 0) {
    wig();
    normaleye(100,65);
  }
  else if (card == 1) { 

    strokeWeight(7);
    image(a,0,0);
    image(b,10,50);
    line(140,306,400,261);

    v(x,0);
    x += random(-speed,speed);
  }
  else if (card  == 2) {  
    wig();
    motion();
    t = t + 1; //speed
    if (t >= 32) {  
      t=32;
    }
    r(0,t);
  }
  else if (card  == 3) { 
    wig();
    motion();
    t1 = t1 + 1; //speed
    if (t1 >= 32) {  
      t1=32;
    }
    r2(0,t1);
  }
  else if (card  == 4) {  
    wig();
    motion();
    t2 = t2 + 1; //speed
    if (t2 >= 32) {  
      t2=32;
    }
    r3(0,t2);
  } 
  else if (card  == 5) {  
    wig();
    image(l,167,135);
    image(f,10,50);
  } 
  else if (card == 6) {  


    q = q + 0.2; //speed


    if (q >= 15) { 
      q=15;
    }
    vv(0,-q);

    //bigeye


    fill(255);
    ellipse(180,115,20,20);
    bird(102,30,1);
    //wig
    strokeWeight(7);
    line(140,275,400,230);
    strokeWeight(5);
    line(168,97,175,110);
    line(180,95,180,105);
    line(192,97,185,110);
    //un-moving
  }
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 0;
    t = 5.0;
    t1 =  5.0;
    t2 = 5.0;
  }
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







void wig() {
  image(a,0,0);
  bird(102,60,1);
  //wig
  strokeWeight(7);
  line(140,306,400,261);
}





void motion() {
  //effect
  line(352,210,360,220);
  line(360,205,372,210);
  //x eye
  strokeWeight(3);
  line(170,150,190,135);
  line(170,135,190,150);
  //
  image(b,10,50);
}


void v(float g, float h) {
  translate(g,h);

  bird(102,60,1);
  normaleye(100,65);
  image(k,100,80);
}


void normaleye(int v, int w) {
  translate(v,w);
  //eye
  strokeWeight(1);
  ellipse(78,82,10,10);
  //eyelid
  strokeWeight(3);
  line(75,64,83,64);
}

void r(float n1, float b1) {
  translate(n1,b1);
  image(c,345,190);
}
void r2(float nn1, float bb1) {
  translate(nn1,bb1);
  image(d,345,190);
}
void r3(float nnn1, float bbb1) {
  translate(nnn1,bbb1);
  image(e,345,190);
}
void vv(float r, float m) {
  translate(r,m);
  image(a,0,-50);
  image(k,215,115);
  baby(-55,100,1);
  baby(10,100,1);
  baby(75,100,1);
  image(g,2,100);
  image(h,10,340);
  image(i,78,340);
  image(j,145,340);
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


