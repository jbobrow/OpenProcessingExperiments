
int card=0;
PImage b;
PImage c;
PFont wow;

void setup() {
  size(600,400);
  smooth();
}

void draw() {
  background(255);
  noStroke();

  if(card==0) {
    lion(0,30,0.5);
  }
  else if(card==1) {
    mouthopen(0,30,0.5);
  }
  else if(card==2) {
    lion(0,30,0.5);
  }
  else if(card==3) {
    mouthopen(0,30,0.5);
  }
  else if(card==4) {
    lion(0,30,0.5);
  }
  else if(card==5) {
    lion(0,30,0.5);
    lioness(500,30,0.5);
  }
  else if(card==6) {
    lion(0,30,0.5);
    lioness(400,30,0.5);
  }
  else if(card==7) {
    lion(0,30,0.5);
    lioness(300,30,0.5);
  }
  else if(card==8) {
    lion(0,30,0.5);
    lioness(300,30,0.5);
  }
  else if(card==9) {
    lion(0,30,0.7);
    lioness(400,30,0.7);
  }
  else if(card==10) {
    lion(-30,-10,1);
    lioness(550,50,1);
  }
  else if(card==11) {
    lion(-150,-90,1.5);
  }
  else if(card==12) {
    lion(-350,-200,2.2);
  }
  else if(card==13) {
    closeUp(0,0);

    boolean k= true;
    b=loadImage("love.png");
    image(b,70,180,70,60);
    image(b,470,180,70,60);
  }
  else if(card==14) {
    closeUp(0,0);

    boolean k= true;
    b=loadImage("love.png");
    image(b,30,150,140,120);
    image(b,430,150,140,120);
  }
  else if(card==15) {
    closeUp(0,0);

    boolean k= true;
    b=loadImage("love.png");
    image(b,0,120,280,240);
    image(b,300,120,280,240);
  }
  else if(card==16) {
    closeUp(0,0);

    boolean k= true;
    b=loadImage("love.png");
    image(b,-50,50,560,480);
    image(b,150,50,560,480);
  }
  else if(card==17) {
    closeUp(0,0);
    
    boolean k= true;
    b=loadImage("love.png");
    image(b,-180,-200,1000,900);
  }
  else if(card==18) {
    mouthopen(0,30,0.5);
    lioness(300,30,0.5);

    wow = loadFont("ARCARTER-48.vlw");
    textFont(wow,48);

    text("Will you marry me?",30,330);
    fill(0);
  }
  else if(card==19) {
    lion(0,30,0.5);
    lioness(300,30,0.5);

    wow = loadFont("ARCARTER-48.vlw");
    textFont(wow,48);

    fill(237,7,114);
    text("YES",350,330);
    rect(310,300,30,30);

    fill(29,108,181);
    text("NO",500,330);
    rect(460,300,30,30);
  }


  else if(card==20) {
    lion(0,30,0.5);
    lioness(300,30,0.5);
    lionCub(215,200,0.3);
  }
  else if(card==21) {
    mouthopen(0,30,0.5);
    lionessOpen(300,30,0.5);
    lioncubOpen(215,200,0.3);
  }
  else if(card==22) {
    lion(0,30,0.5);
    lioness(300,30,0.5);
    lionCub(215,200,0.3);
  }
  else if(card==23) {
    mouthopen(0,30,0.5);
    lionessOpen(300,30,0.5);
    lioncubOpen(215,200,0.3);
  }
  else if(card==24) {
    boolean k= true;
    b=loadImage("love.png");
    image(b,250,150,100,90);
  }
  else if(card==25) {
    background(180);
    lioness(300,30,0.5);
    heartbroken(0,30,0.5);
  }
  else if(card==26) {
    background(180);
    heartbroken(0,30,0.5);
    lioness(400,30,0.5);
  }
  else if(card==27) {
    background(180);
    heartbroken(0,30,0.5);
    lioness(500,30,0.5);
  }
  else if(card==28) {
    background(180);
    heartbroken(0,30,0.5);
  }
  else if(card==29) {
    background(180);
    heartbroken(0,30,0.5);
    wow = loadFont("ARCARTER-48.vlw");
    textFont(wow,48);

    text("What a lonely Christmas...",30,330);
    fill(0);
  }
  else if(card==30) {
    background(180);

    boolean k= true;
    c=loadImage("broken.png");
    image(c,250,150,100,90);
  }
}

void lion(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);

  //body 
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //face

    ellipse(300,200,250,250);

  for(int i=0; i<12;i++) {
    pushMatrix();
    translate(300,200);  
    rotate(radians(40*i));
    fill(160,81,35);
    ellipse(100,100,100,100);
    popMatrix();
  }

  //eyes & mouth & nose
  fill(0);
  ellipse(250,180,20,20);
  ellipse(350,180,20,20);
  //fill(241,86,51);
  //triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);

  popMatrix();
}

void mouthopen(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);

  //body 
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //face

    ellipse(300,200,250,250);

  for(int i=0; i<12;i++) {
    pushMatrix();
    translate(300,200);  
    rotate(radians(40*i));
    fill(160,81,35);
    ellipse(100,100,100,100);
    popMatrix();
  }

  //eyes & mouth & nose
  fill(0);
  ellipse(250,180,20,20);
  ellipse(350,180,20,20);
  fill(241,86,51);
  triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);

  popMatrix();
}

void lioness(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //body
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //ear
  fill(255,222,0);
  ellipse(220,120,80,80);
  ellipse(380,120,80,80);
  fill(255);
  ellipse(220,120,40,40);
  ellipse(380,120,40,40);

  //face  
  fill(255,222,0);
  ellipse(300,200,230,230);


  //eyes & mouth & nose
  fill(0);
  ellipse(250,180,20,20);
  ellipse(350,180,20,20);
  //fill(241,86,51);
  //triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);
  popMatrix();
}

void lionessOpen(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //body
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //ear
  fill(255,222,0);
  ellipse(220,120,80,80);
  ellipse(380,120,80,80);
  fill(255);
  ellipse(220,120,40,40);
  ellipse(380,120,40,40);

  //face  
  fill(255,222,0);
  ellipse(300,200,230,230);


  //eyes & mouth & nose
  fill(0);
  ellipse(250,180,20,20);
  ellipse(350,180,20,20);
  fill(241,86,51);
  triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);
  popMatrix();
}

void closeUp(int x, int y) {
  pushMatrix();
  translate(x,y);
  fill(255,222,0);
  ellipse(300,300,900,900);
  fill(0);
  ellipse(100,200,80,80);
  ellipse(500,200,80,80);
  fill(255);
  ellipse(200,450,300,300);
  ellipse(400,450,300,300);

  fill(82,57,18);
  ellipse(300,300,200,100);
  popMatrix();
}

void lionCub(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //body
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //ear
  fill(255,222,0);
  ellipse(220,120,80,80);
  ellipse(380,120,80,80);
  fill(255);
  ellipse(220,120,40,40);
  ellipse(380,120,40,40);

  //face  
  fill(255,222,0);
  ellipse(300,200,230,230);


  //eyes & mouth & nose
  stroke(0);
  strokeWeight(7);
  line(230,180,270,180);
  line(330,180,370,180);
  //fill(241,86,51);
  //triangle(270,255,330,255,300,290);
  noStroke();
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);
  popMatrix();
}

void lioncubOpen(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);
  //body
  fill(255,222,0);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //ear
  fill(255,222,0);
  ellipse(220,120,80,80);
  ellipse(380,120,80,80);
  fill(255);
  ellipse(220,120,40,40);
  ellipse(380,120,40,40);

  //face  
  fill(255,222,0);
  ellipse(300,200,230,230);


  //eyes & mouth & nose
  stroke(0);
  strokeWeight(7);
  line(230,180,270,180);
  line(330,180,370,180);

  noStroke();
  fill(241,86,51);
  triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(82,57,18);
  ellipse(300,210,50,30);
  popMatrix();
}

void heartbroken(int x, int y, float s) {
  pushMatrix();
  translate(x,y);
  scale(s);

  //body 
  fill(185,229,251);
  beginShape();
  vertex(200,300);
  vertex(400,300);
  vertex(350,500);
  vertex(310,500);
  vertex(310,410);
  vertex(290,410);
  vertex(290,500);
  vertex(250,500);
  endShape();

  //face

    ellipse(300,200,250,250);

  for(int i=0; i<12;i++) {
    pushMatrix();
    translate(300,200);  
    rotate(radians(40*i));
    fill(0,81,137);
    ellipse(100,100,100,100);
    popMatrix();
  }

  //eyes & mouth & nose
  fill(0);
  ellipse(250,180,20,20);
  ellipse(350,180,20,20);
  //fill(241,86,51);
  //triangle(270,255,330,255,300,290);
  fill(255);
  ellipse(270,240,70,70);
  ellipse(330,240,70,70);
  fill(21,34,78);
  ellipse(300,210,50,30);

  popMatrix();
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
    card = 7;
  }
  else if (card == 7) {
    card = 8;
  }
  else if (card == 8) {
    card = 9;
  }
  else if (card == 9) {
    card = 10;
  }
  else if (card == 10) {
    card = 11;
  }
  else if (card == 11) {
    card = 12;
  }
  else if (card == 12) {
    card = 13;
  }
  else if (card == 13) {
    card = 14;
  }
  else if (card == 14) {
    card = 15;
  }
  else if (card == 15) {
    card = 16;
  }
  else if (card == 16) {
    card = 17;
  }
  else if (card == 17) {
    card = 18;
  }
  else if (card == 18) {
    card = 19;
  }
  else if (card == 19) {
    if((mouseX > 310) && (mouseX < 340) && (mouseY > 300) && (mouseY < 330)) {
      card = 20;
    }
    else if((mouseX> 460) && (mouseX<490)&& (mouseY > 300) && (mouseY < 330)) {
      card = 25;
    }
  }  
  else if (card == 20) {
    card = 21;
  }
  else if (card == 21) {
    card = 22;
  }
  else if (card == 22) {
    card = 23;
  }
  else if(card==23) {
    card=24;
  }
  else if(card==24) {
    card=0;
  }
  else if(card==25) {
    card=26;
  }
  else if(card==26) {
    card=27;
  }
  else if(card==27) {
    card=28;
  }
  else if(card==28) {
    card=29;
  }
  else if(card==29) {
    card=30;
  }
  else if(card==30) {
    card=0;
  }
}


