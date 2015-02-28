

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
  textAlign(CENTER);
  imageMode(CENTER);
  smooth();
}

void draw() {
  noStroke();
  if (card == 0) 
  {
    background(255);
    image(text1,400,110);
    file(540,160,-1.05,1.05,255);
    file(440,150,-1.05,1.05,255);
    file(640,170,-1.05,1.05,255);
    fill(0);
    textFont(f);
    text("1kb",300,240);
    text("1kb",400,250);
    text("1kb",500,260);
    image(go,410,500);
  }  
  else if (card == 1)
  {  
    background(255);
    imageMode(CENTER);
    image(sea,450,340,620,460);
    image(text2,400,100);

    pushMatrix();
    scale(0.98,0.98);
    translate(-170,-25);
    file(540,160,-1,1,255);
    file(440,150,-1,1,255);
    file(640,170,-1,1,255);
    fill(0);
    textFont(f);
    textAlign(CENTER);
    text("1kb",300,240);
    text("1kb",400,250);
    text("1kb",500,260);
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
    text("Drop one friend",250,440,350,250);
  } 

  else if (card  == 2)
  {  
    background(255);
    imageMode(CENTER);
    image(text3,410,120);
    image(trashcan,610,340);
    file(200,60,-0.35,1.75,255);
    file(303,70,-0.35,1.75,255);
    textAlign(CENTER);
    textFont(f);
    fill(0);
    text("1kb",130,220);
    text("1kb",230,230);
    textFont(fon);
    text("!",195,320);    
    text("!?",300,330);
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
    text("Noooooooo",450,195);
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
}


void mousePressed() 
{  
  if (card == 0) 
  {  
    card = 1;
  } 

  else if (card == 1) 
  {  
    card = 2;
  }   
  else if (card == 2) 
  {
    card = 3;
  }
  else if (card == 3) 
  {
    card = 4;
  }  
  else if (card == 4) 
  {
    card = 5;
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


