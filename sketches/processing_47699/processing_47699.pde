
PImage imgs;

void setup(){
  size(700,500);
  smooth();
  imgs = loadImage("star.png");
    PFont f = createFont("Times New Roman", 43);
  textFont(f, 48);
      //fill(0);
      String a = ("A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.");
    
      PGraphics pg = createGraphics(700, 500, JAVA2D);
      pg.beginDraw();
      pg.textFont(f, 48);
      pg.fill(255,0,0);
      pg.text(a, 0,0, 500,500);
      pg.endDraw();
      image (pg, 0,0);
      background (pg);
      fill(255,255,0);
      background(0,0,random(100,255));
      
   
  
}
void draw(){
  PFont f = createFont("Times New Roman", 43);
  textFont(f, 48);
      fill(0);
      String a = ("A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.");
      a = a.toUpperCase();
      PGraphics pg = createGraphics(700, 500, JAVA2D);
      pg.beginDraw();
      pg.textFont(f, 48);
      pg.fill(random(250,255),0,0);
      pg.text(a, 0,0, 500,500);
      pg.stroke(255,0,0);
      pg.strokeWeight(5);
      pg.endDraw();
      image (pg, 0,0);
      //background (pg);
      
      

  //String a = ("A well regulated Militia, being necessary to the security of a free State, the right of the people to keep and bear Arms, shall not be infringed.");
  //textSize(43);
  //text (a,20,20,500,500);
  //fill(255,0,0);
   //textSize(50);
  //fill(255,0,0);
  //fill(255,random(255),random(255));
  //blend(0, 0, 500, 500, 0, 0, 500, 500, SOFT_LIGHT);
  
  image (imgs,random (0,500),random(0,400),random(5,40),random(5,40));
  stroke(255,0,0);
  blend(0, 0, 500, 500, 0, 0, 500, 500, HARD_LIGHT);
  image (imgs,random (0,500),random(0,400),random(5,40),random(5,40));

  
}

