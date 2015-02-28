
/* @pjs preload="anim/cupcake1.png"; */
/* @pjs preload="anim/cupcake2.png"; */
/* @pjs preload="anim/cupcake3.png"; */
/* @pjs preload="anim/cupcake4.png"; */
/* @pjs preload="anim/cupcake5.png"; */
/* @pjs preload="anim/cupcake6.png"; */
/* @pjs preload="anim/cupcake7.png"; */
/* @pjs preload="anim/cupcake8.png"; */

Cupcake[] cakes = new Cupcake[10];
Cupcake cake;
PImage[] images = new PImage[8];
void setup() {
  size(800, 600);
  for (int i=0;i< 8;i++) {
    images[i] = loadImage("anim/cupcake" + (i + 1) + ".png");
  }
  //cake = new Cupcake("Mr.cake",color(100,100,100),0,300,2,0,1,images);
  for(int i=0;i<cakes.length;i++){
    //cakes[i] = new Cupcake(images);
    cakes[i] = new Cupcake("Mr. Cake",color(random(0,255),random(0,255),random(0,255)),0,0,random(0.5,2),0,random(0.5,1),images);
  }
}

void draw() {
  frameRate(24);
  background(0);
  translate(width/2,height/2);
  //cake.update();
  //cake.drawMe();
  for(int i = 0;i<cakes.length;i++){
    cakes[i].update();
    
    //pushMatrix();
    
    rotate(PI/4);
    cakes[i].drawMe();
    //popMatrix();
  }
}

class Cupcake{
  String name;
  color shadow;
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  PImage[] images;
  int status = 0;
  
  void init(String name, color shadow,float x, float y, float xSpeed, float ySpeed, float size, PImage[] images){
    this.name = name;
    this.shadow = shadow;
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.size = size;
    this.images = images;
  }
  
  Cupcake(){
    this.images = new PImage[8];
    for(int i=0;i< 8;i++){
      images[i] = loadImage("anim/cupcake" + (i + 1) + ".png");
    }
    init("Mr. Cake",color(random(0,255),random(0,255),random(0,255)),random(200,width-200),random(200,height-200),random(-2,2),random(-2,2),random(0.5,1),images);
  }
  
  Cupcake(PImage[] images){
    init("Mr. Cake",color(random(0,255),random(0,255),random(0,255)),random(200,width-200),random(200,height-200),random(-2,2),random(-2,2),random(0.5,1),images);
  }
  
  Cupcake(String name, color shadow,float x, float y, float xSpeed, float ySpeed, float scale, PImage[] images){
    init(name, shadow,x, y, xSpeed, ySpeed, scale,images);
  }
  void update(){
    x = x + xSpeed;
    y = y + ySpeed;
    if(x > width - 50 || x < 0) xSpeed*=-1;
    if(y > height - 50 || y < 0) ySpeed*=-1;
    if(status == 7) status = 0;
    status = status + 1;
  }
  
  void drawMe(){
    tint(shadow);
    pushMatrix();
    scale(size);
    text(name,x,y);
    image(images[status],x,y);
    popMatrix();
  }
}


