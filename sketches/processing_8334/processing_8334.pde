
import processing.opengl.*;

PImage titlePageImg;
boolean atTitlePage;
PImage endImg;
PImage bg;
float xpos;
float ypos;
float oldmouseX;
float oldmouseY;

Drawer[] drawers;
PImage drawerImg;
PImage drawerwlImg;

Drawer pullout;
PImage pulloutImg;
boolean oldMouse;

Lighter lighter;
boolean hasLighter;
PImage lighterLitImg;
PImage lighterUnlitImg;

Typewriter tw;

Article article;
PImage articleImg;

keyHole lock;
boolean hasKey;
DrawerKey key;
PImage keyImg;
boolean unlocked;
boolean pageRevealed;
PImage bigRevealImg;

Reveal bigReveal;
boolean gameOver;

void setup(){
  size(650,450,P3D);
  //size(1024,768,P2D);
  gameOver = false;

  titlePageImg=loadImage("instructionc.jpg");
  atTitlePage = true;
  xpos = 0;
  ypos = 0;
  oldmouseY=mouseY;
  oldmouseX=mouseX;
  bg = loadImage("background.jpg");
  pulloutImg = loadImage("pullout.gif");
  pullout = new Drawer(513,507,203,12,pulloutImg);
  drawerImg = loadImage("drawer.gif");
  drawerwlImg = loadImage("drawerwl.gif");  
  drawers = new Drawer[] {
    new Drawer(511, 523, 0,0, drawerImg),
    new Drawer(511,599,0,0,drawerImg),
    new Drawer(512,673,0,0,drawerwlImg)               };

  lock = new keyHole(743,500,20, 15);
  hasKey = false;
  keyImg = loadImage("key.gif");
  hasLighter = false;
  lighterLitImg = loadImage("ltrlit.gif");
  lighterUnlitImg = loadImage("ltrunlit.gif");
  oldMouse = false;  //use for detecting clicks that span multiple draw()'s  
  tw = new Typewriter(647,277, 10,18);
  articleImg = loadImage("articlet.gif");
  article = new Article(341, 383, 120, 40);
  keyImg = loadImage("key.gif");
  key = new DrawerKey(513,507,keyImg.width,keyImg.height);
  lighter = new Lighter(0,0,lighterUnlitImg.width, lighterUnlitImg.height);
  pageRevealed = false;
  bigRevealImg=loadImage("ltrbigreveal.gif");
  bigReveal=new Reveal(630,100, bigRevealImg.width, bigRevealImg.height);  
}

void draw() {
  Pointer mouse = new Pointer(mouseX, mouseY, 10,10);
  if(atTitlePage){
    image(titlePageImg,0,0);
    if(mousePressed && mouseX>470 && mouseX<650 && mouseY>183 && mouseY<235) {
      atTitlePage = false;
     }
  }
  else if (mousePressed && !gameOver) {
    pan();
  }
  if(!atTitlePage && !gameOver) bgdraw();

  if(!gameOver && mousePressed && !oldMouse && lighter.lit && tw.turns == 3 &&Sprite.isCollision(mouse, new Sprite(686+xpos,271+ypos - tw.img[2].height,tw.img[2].width,tw.img[2].height))) {
    pageRevealed = true;  //revealpage
    hasLighter = false;
  }
  else 
    if(!gameOver && mousePressed && !oldMouse && Sprite.isCollision(mouse,new Drawer(pullout.x+xpos, pullout.y+ypos, pullout.width, pullout.height, pulloutImg))) {//use tmp object to use offset
    pullout.open = !pullout.open;
    if(pullout.open) {
      key.drop();
    }
  }    
  else if(!gameOver && !pullout.open && hasKey && mousePressed && !oldMouse && Sprite.isCollision(mouse, new keyHole(lock.x+xpos, lock.y+ypos, lock.width, lock.height))) {
    lock.onCollision(); //work lock
  }
  else if(!gameOver && mousePressed && !oldMouse && Sprite.isCollision(mouse, new Typewriter(tw.x+xpos, tw.y + ypos, tw.width, tw.height))){
    tw.turn(); //work tw knob to advance paper
  }
  else if(!gameOver && mousePressed && !oldMouse && Sprite.isCollision(mouse, new Article(article.x + xpos, article.y+ypos, article.width, article.height))){
    article.visible = !article.visible; //article thingy
  }
  else if(!gameOver && !hasLighter&& !hasKey && mousePressed && !oldMouse && Sprite.isCollision(mouse, new Sprite(key.x+xpos, key.y+ypos, key.width, key.height))) {
    hasKey = true;  //pickup key
  }
  else if(!gameOver && !hasKey && mousePressed && !oldMouse && drawers[2].open && Sprite.isCollision(mouse,new Sprite(515+xpos,676+ypos,708-515,743-676))) {
    //key.drop();//clicked on open drawer with lighter in it
    hasLighter = true;
  }
  else if(!gameOver && hasKey && mousePressed &&!oldMouse){
    key.drop();
    hasKey = false; //drop key //***
  }
  else if(!gameOver && hasLighter && mousePressed && !oldMouse) {
    lighter.lit = !lighter.lit; //toggle lighter fire
  }
  else if(!gameOver && lighter.lit && tw.turns == 3 &&Sprite.isCollision(mouse, new Sprite(686+xpos,271+ypos - tw.img[2].height,tw.img[2].width,tw.img[2].height))) { 
    tw.img[2] = loadImage("ltr3r.gif");  
  }
  else if(!gameOver && pageRevealed && mousePressed && !oldMouse && Sprite.isCollision(mouse, new Sprite(635+xpos, 303+ypos, 233,37))){
    //clicked eq.
      endImg = loadImage("end1.jpg");
//    image(end1Img,0,0);
    gameOver = true;
  }
  else if(!gameOver && pageRevealed && mousePressed && !oldMouse && Sprite.isCollision(mouse, new Sprite(635+xpos, 100+ypos, 245,192))){
    //clicked top
//    image(end2Img,0,0);  
    endImg = loadImage("end2.jpg");
    gameOver = true;
}
  //println(mouseX+":"+mouseY);
  //mouse.draw();

  drawers[0].draw();  
  drawers[1].draw();
  drawers[2].draw(); 
  pullout.draw();
  tw.draw();
  article.draw();
  oldMouse = mousePressed;  
  bigReveal.draw();
  key.draw();
  lighter.draw();
  if(gameOver) image(endImg,0,0);
}

void pan() { //uses lots of globals
  if(mousePressed) {
    xpos = xpos - (oldmouseX - mouseX);
    ypos = ypos - (oldmouseY - mouseY);
  }
}

void bgdraw() {
  if(xpos > 0) xpos = 0;
  if(ypos > 0) ypos = 0;
  if(xpos < width - bg.width) xpos = width - bg.width;
  if(ypos < height - bg.height) ypos = height - bg.height;

  image(bg,xpos,ypos);
  oldmouseX=mouseX;
  oldmouseY=mouseY;

}

class Pointer extends Sprite {
  Pointer(float _x,float _y, float _width, float _height) {
    this.x = _x; 
    this.y = _y;
    this.width = _width; 
    this.height = _height;
  }

  void draw() {
    rect(this.x, this.y, this.width, this.height);
  }
}

class Drawer extends Sprite {
  boolean open;
  PImage img;

  Drawer(float _x, float _y, float _width, float _height, PImage _img){
    this.open = false;
    this.x = _x; 
    this.y = _y;
    this.width = _width; 
    this.height = _height;
    this.img = _img;
  }
  void open()  { 
    this.open = true;
  }
  void close() {
    this.open = false;
  }

  void draw() {
    if(this.open) {
      image(this.img,this.x+xpos,this.y+ypos);
      //println("open");  
    }
    else { //do nothing
      //println("closed");  
    }
  }
}

class Pullout extends Drawer {
  Pullout(float _x, float _y, float _width, float _height,PImage _img){
    super(_x, _y, _width,_height, _img);
  }
  void onCollision(){
    open = !open;
    if(open && !hasKey) { //drop key
      key.drop();
    }
  }
}  


class keyHole extends Sprite {
  int turns;

  keyHole(float _x, float _y, float _width, float _height){

    super(_x,  _y, _width, _height);
    turns = 0;
  }
  void onCollision(){
    if(hasKey) {
      turns = (turns + 1)%6; //0->1->2->3->4->5->0->1->......
      switch (turns) {
      case 0: 
        drawers[2].close(); 
        break; //seems weird but needed to cycle through drawers. always clost on 1st run anyway.
      case 1: 
        drawers[0].open(); 
        break;
      case 2: 
        drawers[0].close(); 
        break;
      case 3: 
        drawers[1].open(); 
        break;
      case 4: 
        drawers[1].close(); 
        break;
      case 5: 
        drawers[2].open(); 
        //if(!hasLighter) hasLighter = true; 
        break;
      } //end switch
    }  //end if
  }  //end onCollision
} //end class

class Typewriter extends Sprite { 
  int turns;
  PImage[] img;
  Typewriter (float _x, float _y, float _width, float _height){
    super(_x, _y, _width, _height);
    turns=1;
    img = new PImage[] {
      loadImage("ltr1.gif"),loadImage("ltr2.gif"),loadImage("ltr3.gif"),loadImage("ltr4.gif")                                            };
  }
  void turn() {
    this.turns=min(this.turns+1, 3);
  }
  void draw() {
    image(img[this.turns -1], 686 + xpos,271+ypos-img[this.turns-1].height);
  }


}

class Article extends Sprite {
  PImage img;
  boolean visible;
  Article (float _x, float _y, float _width, float _height){
    super(_x,_y, _width, _height);
    this.img = loadImage("articlet.gif");
    this.visible = false;
  }
  void draw() {
    //  rect(this.x, this.y, this.width,this.height);
    if(visible) image(this.img, this.x+xpos, this.y+ypos);
  }

}

class Lighter extends Sprite {
  boolean lit;
  Lighter (float _x, float _y, float _width, float _height){
    super(_x,_y,_width,_height);
    lit = false;  
  }
  void draw() {
    if(hasLighter) {
      if(this.lit) {
        image(lighterLitImg,mouseX, mouseY-45);
      }
      else {
        image(lighterUnlitImg,mouseX,mouseY);
      }
    }
    else {

    }  
  }

}

class DrawerKey extends Sprite {
  boolean visible;
  int animation;
  float tmpX;
  float tmpY;

  DrawerKey (float _x, float _y, float _width, float _height){
    super(_x,_y,_width, _height);
    visible = false;
    animation = 0;
  }
  void drop() {
    animation = 15;
     //    this.x = 770;
    //    this.y = 690;
    tmpX = (770 - this.x)/15;
    tmpY = (690 - this.y)/15;
     visible = true;
    hasKey = false;  
  }
  void draw() {
     if (hasKey) {
      this.x = mouseX;
      this.y = mouseY;
      image(keyImg, this.x - keyImg.width+20,this.y-10);  
    }
    else if(visible && animation > 0 && animation <= 15){
      animation--;
      this.x+=tmpX;
      this.y+=tmpY;
      //println(this.x+"|"+this.y);
      image(keyImg, this.x-keyImg.width+20, this.y-10);  
    } //endif

    else if (visible){
      image(keyImg, this.x+xpos, this.y+ypos);
      //image(keyImg, this.x, this.y);
    }

  }//end draw()
}//end class

class Reveal extends Sprite {
  Reveal(float _x, float _y, float _width, float _height){
    super(_x, _y, _width, _height);
  }
  void draw() {
    if(pageRevealed) {
      image(bigRevealImg,this.x + xpos ,this.y+ypos );
    }
    else { //do nothing
    }

  }

}























