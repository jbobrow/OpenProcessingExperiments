


PImage a,b,d,bg,plate,source;
int card = 0; 
//strawberry
float c=25.0;
float e=25.0;


//
int radius = 40;
float sp = 40;
float speed = 3.5;
int direction = 1;
//

PFont f; 
int x = 630;
int y = 250;
int w = 50;
int h = 50;


void setup() {
  smooth();
  noStroke();
  size(720, 500);
  f = loadFont("Helvetica63-ExtendedMedium-28.vlw");
  textFont(f);
  smooth();
}


void draw() {
  noStroke();

  if (card == 0) { 
    fill(255,0,0);
    background(255);
    //background
    bg = loadImage("bckgu.png");
    image(bg,0,0);
    //plate
    a = loadImage("zupsi.GIF");
    image(a,0,-30);
    //cheese
    cheese(70,100,1);
    text("Bake a cheese cake!",400,400);
    rect (x,y,w,h);
  }  

  else if (card  == 1) {  
    background(0);
    //background
    bg = loadImage("bckgu.png");
    image(bg,0,0);
    //plate
    plate = loadImage("sl1.png");
    image(plate,0,-30);
    //cheese
    cheese(70,100,1);
    fill(#55A6E3);
    text("start with crim",400,400);

    ellipse(x, y, 40, 40);
  }
  else if (card  == 2) { 
    background(255); 
    image(bg,0,0);

    //plate
    plate = loadImage("sl1.png");
    image(plate,0,-30);

    //cheese
    cheese(70,100,1);


    //crim
    b = loadImage("crim.png");
    image(b,90,140);
    fill(#55A6E3);

    text("Ready to decorate?",400,400);


    ellipse(x, y, 40, 40);
  }
  
  else if (card  == 3) { 
    background(255); 
    image(bg,0,0);

    //plate
    plate = loadImage("sl1.png");
    image(plate,0,-30);

    //cheese
    cheese(70,100,1);


    //crim
    b = loadImage("crim.png");
    image(b,90,140);
    //deco
    d=loadImage("deco.gif");

    image(d,345,115);
    image(d,385,145);
    image(d,420,175);
    image(d,460,205);

    fill(#55A6E3);
    ellipse(x, y, 40, 40);
    text("crim decoration",400,400);

  }
    else if (card  == 4) { 
    background(255); 
    image(bg,0,0);

    //plate
    plate = loadImage("sl1.png");
    image(plate,0,-30);

    //cheese
    cheese(70,100,1);


    //crim
    b = loadImage("crim.png");
    image(b,90,140);
    
    //sourece
    
    source = loadImage("source.png");
    image(source,145,160,300,180);
    //deco
    d=loadImage("deco.gif");

    image(d,345,115);
    image(d,385,145);
    image(d,420,175);
    image(d,460,205);

    fill(#55A6E3);
    ellipse(x, y, 40, 40);
    text("syrup deco",400,400);

  }
  
  else if (card  == 5) { 
    background(255); 
    image(bg,0,0);

    //plate
    plate = loadImage("sl1.png");
    image(plate,0,-30);

    //cheese
    cheese(70,100,1);


    //crim
    b = loadImage("crim.png");
    image(b,90,140);
      //sourece
    
    source = loadImage("source.png");
    image(source,145,160,300,180);
    //deco
    d=loadImage("deco.gif");

    image(d,345,115);
    image(d,385,145);
    image(d,420,175);
    image(d,460,205);

    fill(#55A6E3);
    ellipse(x, y, 40, 40);
    text("Strawberry on it",400,400);
    //tetris
    tetris(1,160,3,180,0);
    tetris(0.8,160,3,200,0);
    tetris(2,160,3,-50,0);



  }

  else if (card  == 6) { 
    background(0);
    image(bg,0,0);

    //plate
    plate = loadImage("sl1.png");
    image(plate,0,-30);

    //cheese
    cheese(70,100,1);


    //crim
    b = loadImage("crim.png");
    image(b,90,140);
    //deco
    d=loadImage("deco.gif");

    image(d,345,115);
    image(d,385,145);
    image(d,420,175);
    image(d,460,205);
        fill(#55A6E3);
    text("more process in project5",300,400);

    ellipse(x, y, 40, 40);
  }
  else if (card  == 7) { 
    background(0); 
    fill(255);
    text("more process in project5",300,400);

  }
  
}

void mousePressed() {  

  if (card == 0) {  

    if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 2;
    }
    else card = 1;
  }   
  else if (card == 2) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 3;
    }
    else card = 2;
  }
  else if (card == 3) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 4;
    }
    else card = 3;
  }
  else if (card == 4) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 5;
    }
    else card = 4;
  }
  else if (card == 5) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 6;
    }
    else card = 5;
  }
  else if (card == 6) {

    float d = dist(mouseX, mouseY, x, y);
    if (d < 20) {
      card = 7;
    }
    else card = 6;
  }
}

void cheese(int x, int y,float a) {

  pushMatrix();
  translate(x,y);
  scale(a);

  //inside : cake

  fill(#FFC74D);
  noStroke();
  triangle(280,60,440,170,30,240);
  triangle(280,160,440,270,30,340);
  fill(#F5B73B);
  quad(30,240,440,170,440,270,30,340);

  //cheese circle
  fill(#C17802);
  ellipse(400,230,30,30);
  ellipse(190,260,60,60);
  ellipse(140,250,30,30);
  ellipse(375,155,40,40);
  ellipse(295,110,30,30);
  ellipse(70,290,40,40);
  ellipse(260,200,40,40);
  arc(100,328,30,30,radians(170),radians(350));
  ellipse(140,190,30,30);
  ellipse(300,170,30,30);
  ellipse(290,110,40,40);
  ellipse(270,160,20,20);
  arc(210,110,40,40,radians(-35),radians(145));
  arc(300,294,60,60,radians(170),radians(350));
  popMatrix();
}
void arch2(float curvature,int movex, int movey, float s) 
{

  pushMatrix();
  translate(movex,movey);
  scale(s);






  float y = 120.0;
  strokeWeight(6);

  beginShape();
  fill(#FF3131);
  vertex(15.0, y);
  bezierVertex(15.0, y-curvature, 30.0, 55.0, 50.0, 55.0);
  bezierVertex(70.0, 55.0, 85.0, y-curvature, 85.0, y);
  endShape();

  //strawberry bottom
  arc(50,120,70,40,0,90);


  //strawberry seed
  fill(#391305);
  ellipse(60,80,5,5);
  ellipse(40,70,5,5);
  ellipse(70,120,5,5);
  ellipse(76,100,5,5);
  ellipse(50,90,5,5);
  ellipse(35,110,5,5);
  ellipse(45,130,5,5);
  ellipse(45,105,5,5);
  ellipse(28,90,5,5);


  popMatrix();
}

void grape(int movex, int movey, float s) {


  translate(movex, movey);
  scale(s);

  fill(#54298E);
  ellipse(50,100,80,80);

  fill(#623198);
  ellipse(47,97,70,70);

  fill(#D8B4FF);
  ellipse(35,85,30,30);

  ellipse(58,75,10,10);
}

//tetris
//int deco = 40;
//
//float sp = 40;
//float speed = 1.5;
//float direction = 1;


void tetris(float a,float hi, float curvature, int movex, int movey) {
  scale(a);
  translate(movex,movey);

  pushMatrix();
  //float sp = 40;
  //float speed = 1.5;
  //int direction = 1;;
  sp += speed; // Increase the value of x

  if ((sp >hi)) 
  {
    speed=0;
  }


  float y = 120.0;
  strokeWeight(6);

  beginShape();
  fill(#FF3131);
  vertex(15.0, y+sp);
  bezierVertex(15.0, y-curvature+sp, 30.0, 55.0+sp, 50.0, 55.0+sp);
  bezierVertex(70.0, 55.0+sp, 85.0, y-curvature+sp, 85.0, y+sp);
  endShape();

  //strawberry bottom
  arc(50,120+sp,70,40,0,90);
  //strawberry seed
  fill(#391305);
  ellipse(60,80+sp,5,5);
  ellipse(40,70+sp,5,5);
  ellipse(70,120+sp,5,5);
  ellipse(76,100+sp,5,5);
  ellipse(50,90+sp,5,5);
  ellipse(35,110+sp,5,5);
  ellipse(45,130+sp,5,5);
  ellipse(45,105+sp,5,5);
  ellipse(28,90+sp,5,5);
  popMatrix();
}


void arch(float curvature,int movex, int movey, float s) 
{

  pushMatrix();
  translate(movex,movey);
  scale(s);

  float y = 120.0;
  strokeWeight(6);

  beginShape();
  fill(#FF3131);
  vertex(15.0, y);
  bezierVertex(15.0, y-curvature, 30.0, 55.0, 50.0, 55.0);
  bezierVertex(70.0, 55.0, 85.0, y-curvature, 85.0, y);
  endShape();

  //strawberry bottom
  arc(50,120,70,40,0,90);


  //strawberry seed
  fill(#391305);
  ellipse(60,80,5,5);
  ellipse(40,70,5,5);
  ellipse(70,120,5,5);
  ellipse(76,100,5,5);
  ellipse(50,90,5,5);
  ellipse(35,110,5,5);
  ellipse(45,130,5,5);
  ellipse(45,105,5,5);
  ellipse(28,90,5,5);


  popMatrix();
}


