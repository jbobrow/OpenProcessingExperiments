

int card = 0; 
PFont f;
PFont fo;
PFont fon;
PFont font;
PFont fonta;
PFont fontb;
PFont fontc;
PImage sea;
PImage folderside;
PImage folderside1;
PImage trashcan;
PImage go;
PImage text1;
PImage text2;
PImage text3;
PImage text4;
PImage text5;
PImage text6;
PImage text7;
PImage text8;
PImage zipfile;
int a;
int b;
int sp;
int sp2;
int c; 
int cp;
int frame;
int framep;
void setup() 
{
  size(800,600);
  f = loadFont("MalgunGothicRegular-22.vlw");
  fo=loadFont("MalgunGothicBold-60.vlw");
  fon=loadFont("MalgunGothicBold-38.vlw");
  font=loadFont("MalgunGothicBold-68.vlw");
  fonta=loadFont("MalgunGothicBold-48.vlw");
  fontb=loadFont("MalgunGothicRegular-32.vlw");
  fontc=loadFont("MalgunGothicBold-26.vlw");
  sea=loadImage("sea.png");
  folderside=loadImage("folderside.png");
  folderside1=loadImage("folderside1.png");
  trashcan=loadImage("trashcan.png");
  go=loadImage("go.png");
  text1=loadImage("text1.png");
  text2=loadImage("text2.png");
  text3=loadImage("text3.png");
  text4=loadImage("text4.png");
  text5=loadImage("text5.png");
  text6=loadImage("text6.png");
  text7=loadImage("text7.png");
  text8=loadImage("text8.png");
  zipfile=loadImage("zipfile.png");
  sp = 3;
  sp2 = 30;
  textAlign(CENTER);
  imageMode(CENTER);
  smooth();
  println(mouseX);
  println(mouseY);
}

void draw() {

  noStroke();
  if (card == 0) 
  {
    background(255);
    image(text1,400,110);
b=0;
    a = a+2;
    if((a>750))
    {
      a = 0;
    }
    file(340+a,160,-1.05,1.05,255);
    file(240+a,150,-1.05,1.05,255);
    file(440+a,170,-1.05,1.05,255);
    fill(0);
    textFont(f);
    text("1kb",100+a,240);
    text("1kb",200+a,250);
    text("1kb",300+a,260);
    image(go,410,500);
  }  
  else if (card == 1)
  {  
    background(255);
    imageMode(CENTER);
    image(sea,450,340,620,460);
    image(text2,400,100);

    pushMatrix();
    scale(0.98);
    translate(-170,-25);
    b = b+sp;
    if(b>200)
    {
      sp=0;
    }
    file(340+b,160,-1,1,255);
    file(240+b,150,-1,1,255);
    file(440+b,170,-1,1,255);
    fill(0);
    textFont(f);
    textAlign(CENTER);
    text("1kb",100+b,240);
    text("1kb",200+b,250);
    text("1kb",300+b,260);
    popMatrix();
    pushMatrix();
    scale(0.9,0.9);
    translate(205,80);
    image(folderside,450,300);
    image(folderside1,429,325);
    textAlign(CENTER);
    textFont(fon);
    text("2kb",455,180);
    popMatrix();
    textAlign(CENTER);
    textFont(fo);
    text("Drop one friend",80,450,350,250);
    text("Zip 3files in 2kb", 420,450,310,250);
  } 

  else if (card  == 2)
  {  
    background(255);
    imageMode(CENTER);
    image(text3,410,120);
    b = b + sp2;
    if (b>500)
    {
      sp2=0;
      textFont(fon);
      text("!",195,320);    
      text("!?",300,330);
    }
    image(trashcan,610,-175+b);
    file(200,60,-0.35,1.75,255);
    file(303,70,-0.35,1.75,255);
    textAlign(CENTER);
    textFont(f);
    fill(0);
    text("1kb",130,220);
    text("1kb",230,230);
    textFont(font);
    text("Run!!",400,520);
  }

  else if (card  == 3) 
  { 
    background(255);
    imageMode(CENTER);
    image(sea,450,340,620,460);
    image(text4,360,100);
    pushMatrix();
    scale(0.98,0.98);
    translate(-170,-25);
    file(490,210,-1,1,255);
    popMatrix();
    pushMatrix();
    scale(0.9,0.9);
    translate(205,80);
    image(folderside,450,300);
    popMatrix();
    pushMatrix();
    translate(135,130);
    rotate(radians(-60));
    file(0,0,0.2,1.5,255);
    popMatrix();
    pushMatrix();
    scale(0.75,0.75);
    translate(620,380);
    rotate(radians(-30));
    image(trashcan,0,0);
    popMatrix();
    pushMatrix();
    scale(0.9,0.9);
    translate(205,80);
    image(folderside1,429,325);
    popMatrix();
    textAlign(CENTER);
    fill(0);
    textFont(font);
    text("Run!!!!",400,520);
    textFont(fonta);
    text("OMG",180,260);
    textFont(fontb);
    cp= 1;
    c = c+cp;
    if ((-1<c)&&(c<2)) {
      text("N",450,195);
    }
    if ((1<c)&&(c<4)) {
      text("No",450,195);
    }
    if ((3<c)&&(c<6)) {
      text("Noo",450,195);
    }
    if ((5<c)&&(c<8)) {
      text("Nooo",450,195);
    }
    if ((7<c)&&(c<10)) {
      text("Noooo",450,195);
    }
    if ((9<c)&&(c<12)) {
      text("Nooooo",450,195);
    }
    if ((11<c)&&(c<14)) {
      text("Noooooo",450,195);
    }
    if ((13<c)&&(c<16)) {
      text("Nooooooo",450,195);
    }
    if (c>15) {
      text("Noooooooo",450,195);
    }
  }

  else if (card  == 4) 
  {  
    background(255);
    imageMode(CENTER);
    image(text5,295,85);
    image(sea,450,340,620,460);
    pushMatrix();
    scale(0.9,0.9);
    translate(205,80);
    image(folderside,450,300);
    image(folderside1,429,325);
    textAlign(CENTER);
    textFont(fon);
    text("2kb",455,180);
    popMatrix();
    pushMatrix();
    scale(0.75,0.75);
    translate(380,380);
    image(trashcan,0,0);
    popMatrix();
    textAlign(CENTER);
    textFont(fo);
    text("The end",380,520);
    textFont(fontc);
    text("(go first)",380,550);
  }

  else if (card == 5)
  {
    framep = 1;
    frame = frame+framep;
    background(255);
    image(sea,450,340,620,460);
    image(text6,380,100);
    image(zipfile,200,300);
    pushMatrix();
    scale(0.9,0.9);
    translate(205,80);
    image(folderside,450,300);
    popMatrix();
    if (frame>30)
    {
      pushMatrix();
      scale(0.75,0.75);
      translate(620,400);
      image(trashcan,0,0);
      popMatrix();
    }
    if (frame>60)
    {
      fill(0);
      textFont(fon);
      text("Hi",460,200);
    }
    if ((frame>80)&&(frame<119))
    {
      fill(0);
      textFont(fon);
      text("?",260,200);
    }
    if (frame>120)
    {
      fill(0);
      textFont(fon);
      text("?!",260,200);
    }
    pushMatrix();
    scale(0.9,0.9);
    translate(205,80);
    image(folderside1,429,325);
    textAlign(CENTER);
    textFont(fon);
    text("2kb",455,180);
    popMatrix();
    if (frame>160)
    {
      textFont(fo);
      text("Fight Against",width/2,530);
    }
  }
  else if (card==6)
  {
    background(255);
    image(sea,650,340,620,460);
    image(text7,315,90);
    image(zipfile,200,300);
    pushMatrix();
    scale(0.9,0.9);
    translate(405,80);
    image(folderside,450,300);
    popMatrix();
    pushMatrix();
    scale(0.75,0.75);
    translate(720,430);
    image(trashcan,0,0);
    popMatrix();
    pushMatrix();
    scale(0.9,0.9);
    translate(405,80);
    image(folderside1,429,325);
    popMatrix();
    pushMatrix();
    rotate(radians(90));
    file(200,100,0.3,0.3,255);
    popMatrix();
    fill(255);
    noStroke();
    rect(760,0,100,600);
    fill(0);
    textFont(font);
    text("?!",400,520);
  }
  else if (card==7)
  {
    background(255);
    image(sea,650,340,620,460);
    image(text8,210,90);
    pushMatrix();
    tint(255,45);
    translate(295,300);
    rotate(radians(-15));
    image(zipfile,0,0);
    popMatrix();
    tint(255,255);
    pushMatrix();
    scale(0.9,0.9);
    translate(405,80);
    image(folderside,450,300);
    popMatrix();
    pushMatrix();
    scale(0.75,0.75);
    rotate(radians(-23));
    translate(335,620);
    image(trashcan,0,0);
    popMatrix();
    pushMatrix();
    scale(0.9,0.9);
    translate(405,80);
    image(folderside1,429,325);
    popMatrix();
    fill(0);
    textAlign(CENTER);
    textFont(fo);
    text("The end",380,520);
    textFont(fontc);
    text("(go first)",380,550);
    textFont(fontb);
    text("Nooooooooo",190,170);
    fill(255);
    noStroke();
    rect(760,0,100,600);
  }
}


void mousePressed() 
{  
  if (card == 0) 
  {  
    if((mouseX>335)&&(mouseX<480)&&(mouseY>470)&&(mouseY<518))
    {
      card = 1;
    }
    else card = 0;
  } 

  else if (card == 1) 
  {  
    if((mouseX>117)&&(mouseX<379)&&(mouseY>389)&&(mouseY<568))
    {
      card = 2;
    }
    else if((mouseX>440)&&(mouseX<695)&&(mouseY>450)&&(mouseY<570))
    {
      card = 5;
    }
    else card = 1;
  }   
  else if (card == 2) 
  {
    if((mouseX>320)&&(mouseX<480)&&(mouseY>470)&&(mouseY<520))
    {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) 
  {
    if((mouseX>300)&&(mouseX<500)&&(mouseY>470)&&(mouseY<520))
    {
      card = 4;
    }
    else if (card == 3);
  }  
  else if (card == 4) 
  {
    if((mouseX>265)&&(mouseX<490)&&(mouseY>470)&&(mouseY<520))
      card = 0;
  }
  else if (card == 5)
  {
    if((mouseX>210)&&(mouseX<590)&&(mouseY>485)&&(mouseY<545))
      card = 6;
  }
  else if (card == 6)
  {
    if((mouseX>375)&&(mouseX<420)&&(mouseY>470)&&(mouseY<525))
    {
      card = 7;
    }
    else card = 6;
  }
  else if (card==7)
  {
    if((mouseX>265)&&(mouseX<490)&&(mouseY>470)&&(mouseY<520))
    {
      card = 0;
    }
    else card = 7;
  }
}

void file(int x, int y, float sw, float sh, int t)
{
  pushMatrix();
  translate(x,y);
  scale(sw,sh);
  stroke(200,t);
  fill(240,t);
  quad(100,100,170,110,170,210,100,200);
  fill(230,t);
  stroke(170,t);
  beginShape();
  vertex(150,106);
  vertex(170,128);
  bezierVertex(163,124,157,122,152,130);
  bezierVertex(152,125,152,111,150,106);
  endShape();
  fill(255);
  noStroke();
  triangle(145,101,180,140,180,105);
  fill(0);
  ellipse(120,135,9,10);
  ellipse(150,138,8.5,10);
  stroke(70,t);
  fill(0,0);
  beginShape();
  vertex(120,165);
  bezierVertex(121,173,122,174,127,175);
  vertex(142,178);
  bezierVertex(147,180,148,184,149,188);
  endShape();
  popMatrix();
}


