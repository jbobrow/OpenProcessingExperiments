
int MODE;

MenuText back;

/* @pjs font="Arial.ttf"; */

PFont titleF;
PFont menuItemF;
String[] menuItemsNames={"START","INSTRUCTIONS","CREDITS"};  //Creates the array that will be passed to the Menu class for forming individual MenuText objects.
Menu menu;

Paddle paddleLeft;
Paddle paddleRight;

Ball pongBall;
Ball pongScreenBall;
Ball pongCreditsBall;

Score tpScore;

Field field;

void setup(){
  size(640,480);
  background(255);
  smooth();
  noStroke();
  
  titleF=createFont("Arial");
  menuItemF=createFont("Arial");
  menu=new Menu("PONG",menuItemsNames,titleF,menuItemF,0,255,color(183,152,50),0,color(50,155,61));
  
  back=new MenuText("BACK",menuItemF,width/2,height/1.5+100,24,color(255),color(183,152,50),color(0),color(50,155,61));
  
  paddleLeft=new Paddle(width/48,height/5,color(183,152,50),0);
  paddleRight=new Paddle(width/48,height/5,color(183,152,50),1);
  
  pongBall=new Ball(10,color(255),5);
  pongScreenBall=new Ball(10,color(255),4);
  pongCreditsBall=new Ball(10,color(255),10);
  
  tpScore=new Score(10,createFont("Arial"),32,0,255,0,40,height-40,width-40,height-40);
  
  field=new Field(color(255),color(50,155,61),color(255));
  
  MODE=0;
}

void draw(){
  background(50,155,61);
  
  
  
  if(MODE==0){
    pongScreenBall.update();
    pongScreenBall.render();
    pongScreenBall.wallCollision();
    
    menu.render();    
    
    switch(menu.whichItem()){
      case 0:
      MODE=1;
      menu.passTo(menu.whichItem());
      break;
      
      case 1:
      MODE=2;
      menu.passTo(menu.whichItem());
      break;
      
      case 2:
      MODE=3;
      menu.passTo(menu.whichItem());
      break;
      
      default:
      break;
    }
  }
  else  if(MODE==1){
    field.render();
    tpScore.render();
    
    paddleLeft.render();
    paddleRight.render();
    paddleLeft.update();
    paddleRight.update();
    
    pongBall.wallCollision(paddleLeft);
    pongBall.paddleCollision(paddleLeft);
    pongBall.paddleCollision(paddleRight);
    
    pongBall.update();
    pongBall.render();
    
    if(pongBall.getSideHit()!=2){
      tpScore.update(pongBall.getSideHit());
      pongBall.setSideHit(2);
      pongBall.reset();
      pongBall.updateV(5);
      if(tpScore.hasMaxed()!=0){
        MODE=4;        
      }
    }
    
  }
  else if(MODE==2){
    background(50,155,61);
    
    textFont(createFont("Arial"));
    textSize(75);
    fill(255);
    text("INSTRUCTIONS",width/2-textWidth("INSTRUCTIONS")/2,height/4);
    
    textFont(menuItemF);
    textSize(20);
    text("Welcome to Pong, a 2 Player, 2 Dimensional Tabble-Tennis Game",width/2-textWidth("Welcome to Pong, a 2 Player, 2 Dimensional Tabble-Tennis Game")/2,height/2-38);
    text("Press W and S to control the Left Paddle",width/2-textWidth("Press W and S to control the Left Paddle")/2,height/2-10);
    text("Press UP and DOWN to control the Right Paddle",width/2-textWidth("Press UP and DOWN to control the Right Paddle")/2,height/2+18);
    text("Winner decided when one player amasses 10 points",width/2-textWidth("Winner decided when one player amasses 10 points")/2,height/2+46);
    
    back.update();
    back.render();
    
    if(back.getClicked()){
      MODE=0;
      back.unClick();
    }
  }
  else if(MODE==4){
    pongScreenBall.update();
    pongScreenBall.render();
    pongScreenBall.wallCollision();
    
    background(50,155,61);
    
    textFont(titleF);
    textSize(95);
    fill(255);
    text("GAME OVER",width/2-textWidth("GAME OVER")/2,height/2-(104/3));
    
    textFont(createFont("Arial"));
    textSize(32);
    text("Player "+str(tpScore.hasMaxed())+" WON!",width/2-textWidth("Player "+str(tpScore.hasMaxed())+" WON!")/2,height/2+25);    
    
    textFont(menuItemF);
    textSize(48);
    text("Thank You For Playing...",width/2-textWidth("Thank You For Playing...")/2,height/2+85);
    
    back.update();
    back.render();
    
    if(back.getClicked()){
      MODE=0;
      back.unClick();
      tpScore.reset();
    }
    
  }
  else if(MODE==3){
    background(50,155,61);
    
    pongCreditsBall.update();
    pongCreditsBall.render();
    pongCreditsBall.wallCollision();
    
    fill(255);
    textFont(createFont("Arial"));
    textSize(32);
    text("coded by",width/2-textWidth("coded by")/2,height/3);
    
    textFont(menuItemF);
    textSize(45);
    text("Jack",width/2-textWidth("Jack")/2,height/2);
    
    back.update();
    back.render();
    
    if(back.getClicked()){
      MODE=0;
      back.unClick();
    }
  }
}

void mouseClicked(){
  if(MODE==0){
    menu.passTo(mouseX,mouseY);
  }
  else if(MODE==3 || MODE==2 || MODE==4){
    back.mClicked(mouseX,mouseY);
  }
}

void keyReleased(){
  if(MODE==1){
    if(key==CODED){
      if(keyCode==UP){
        paddleRight.updateMve(0);
      }
      else if(keyCode==DOWN){
        paddleRight.updateMve(0);
      }
    }
    else{
      if(key=='W' || key=='w'){
        paddleLeft.updateMve(0);
      }
      else if(key=='S' || key=='s'){
        paddleLeft.updateMve(0);
      }
    }
  }
}
    

void keyPressed(){
  if(MODE==1){
    if(key==CODED){
      if(keyCode==UP){
        paddleRight.updateMve(-2);
      }
      else if(keyCode==DOWN){
        paddleRight.updateMve(2);
      }
    }
    else{
      if(key=='W' || key=='w'){
        paddleLeft.updateMve(-2);
      }
      else if(key=='S' || key=='s'){
        paddleLeft.updateMve(2);
      }
    }
    if(key=='p' || key=='P'){
      noLoop();
    }
    if(key=='r' || key=='R'){
      loop();
    }
  }
}

class Ball
{
  float radius;
  float bX;
  float bY;
  
  float vBase;
  float vX;
  float vY;

  color bColor;
  int sideHit;
  
  Ball(float radius,color bColor,float vBase){
    this.radius=radius;
    this.bColor=bColor;
    this.vBase=vBase;
    
    bX=width/2;
    bY=height/2;
    
    float rnd=random(0,3);
    if(rnd<0){vX=-sqrt(sq(vBase)/2); vY=sqrt(sq(vBase)/2);}
    else if(rnd>=0 && rnd<1){vX=-sqrt((vBase*vBase)/2); vY=-sqrt(sq(vBase)/2);}
    else if(rnd>=1 && rnd<2){vX=sqrt(sq(vBase)/2); vY=sqrt(sq(vBase)/2);}
    else{vX=sqrt(sq(vBase)/2); vY=-sqrt(sq(vBase)/2);}
    
    sideHit=2;
  }
  
  void render(){
    stroke(0);
    fill(bColor);
    
    ellipse(bX,bY,radius*2,radius*2);
  }
  
  void update(){
    bX+=vX;
    bY+=vY;
  }
  
  void reset(){
    bX=width/2;
    bY=height/2;
    vX=sqrt(sq(vBase)/2); 
    vY=sqrt(sq(vBase)/2);
  }
  
  void updateV(float V){
    vBase=V;
  }
  
  void accelerate(float V){
    vBase+=V;
  }
  
  int getSideHit(){
    return sideHit;
  }
  
  void setSideHit(int hit){
    sideHit=hit;
  }
  
  void wallCollision(Paddle p){
    if(bX>=(width-radius-p.getWidth()/2)){
      sideHit=1;         
    }
    else if(bX<=radius+p.getWidth()/2){
      sideHit=0;
    }
    
    if(bY>=(height-radius) || bY<=radius){
      vY*=-1;
    }
  }
  
  void wallCollision(){
    if(bX>=(width-radius) || bX<=radius){
      vX*=-1;
    } 
    if(bY>=(height-radius) || bY<=radius){
      vY*=-1;
    }
  }
  
  void paddleCollision(Paddle p){
    if(p.getOrient()==0){
      if(bY>=(p.getY()-p.getHeight()/2) && bY<=(p.getY()+p.getHeight()/2)){
        if((bX-radius)<=p.getWidth()){
          float varier=map(p.getY()-bY,0,p.getHeight()/2,0.1,1);
          
          vY=sqrt(sq(vBase)/2)*varier*-1;
          vX=sqrt(sq(vBase)/2)*sqrt(2-sq(varier))*(-1*(vX/abs(vX)));
          
          accelerate(0.2);
          
          //println(vX+" "+vY+" "+" "+sqrt(sq(vBase)/2)+" "+varier);
        }
      }
    }
    else if(p.getOrient()==1){
      if(bY>=(p.getY()-p.getHeight()/2) && bY<=(p.getY()+p.getHeight()/2)){
        if((bX+radius)>=width-p.getWidth()){
          float varier=map(p.getY()-bY,0,p.getHeight()/2,0.1,1);
          
          vY=sqrt(sq(vBase)/2)*varier*-1;
          vX=sqrt(sq(vBase)/2)*sqrt(2-sq(varier))*(-1*(vX/abs(vX)));
          
          accelerate(0.2);
          
          //println(vX+" "+vY+" "+sqrt(sq(vBase)/2)+" "+varier);
        }
      }
    }
  }
}

class Field
{
  color fEdge;
  color fFloor;
  color fNet;
  
  Field(color fEdge,color fFloor,color fNet){
    this.fEdge=fEdge;
    this.fFloor=fFloor;
    this.fNet=fNet;
  }
  
  void render(){
    rectMode(CENTER);
    
    fill(fFloor);
    noStroke();
    rect(width/2,height/2,width,height);
    
    noFill();
    stroke(fEdge);
    rect(width/2,height/2,width-10,height-10);
    
    stroke(fNet);
    for(int i=9;i<=height-10;i+=(height-10)/100){
      ellipse(width/2,i,1,1);
    }
  }
}
//Menu class uses the objects from the MenuText and forms a menu with a title and a list of MenuText objects.

class Menu{
  String titleT;
  
  PFont titleF;
  PFont menuItem;
  
  color titleC;
  
  float spacer;    //This is used to define the space between successive MenuText objects.
  float iniY=height/2.5;
  
  MenuText[] menuItems;
  
  Menu(String titleT,String[] menuItemsNames,PFont titleF,PFont menuItemF,color titleC,color menuItemC,color menuBackC,color itemHoverC,color backHoverC){
    this.titleT=titleT;
    this.titleF=titleF;
    this.titleC=titleC;
    
    menuItems=new MenuText[menuItemsNames.length];  //Initializes the MenuText objects depending on the array passed to it. This makes the menu system very flexible.
    spacer=48;
    for(int i=0;i<menuItemsNames.length;i++){      
      menuItems[i]=new MenuText(menuItemsNames[i],menuItemF,width/2,iniY+(spacer*i),24,menuItemC,menuBackC,itemHoverC,backHoverC);
    }
  }

  void render(){
    textFont(titleF);
    textSize(92);
    fill(titleC);
    text(titleT,width/2-(textWidth(titleT)/2),height/3.8);
    
    for(int i=0;i<menuItems.length;i++){
      menuItems[i].update();
      menuItems[i].render();
    }
  }
  
  void passTo(float mX,float mY){    //This accepts the X,Y mouse coords when the mouse is clicked and passes it to the relevant MenuText object to check if the click occurs on that object.
    for(int i=0;i<menuItems.length;i++){
      menuItems[i].mClicked(mX,mY);
    }
  }
  
  void passTo(int item){
    menuItems[item].unClick();
  }
  
  int whichItem(){  //Checks each time if the clicked state of any MenuText object is true. If it is, returns the array position of the relevant object.
    for(int i=0;i<menuItems.length;i++){
      if(menuItems[i].getClicked()){
        return i;
      }
    }
    return menuItems.length;
  }
}
//MenuText holds the attributes and methods relating to each single item on the menu. Thus each item is treated as a separate object.
//Each MenuText object comprises mainly of a foreground text and a background object. 

class MenuText{
  
  String menuItem;
  PFont menuFont;
  float itemX;
  float itemY;
  float itemSize;
  color itemColor;
  color backColor;
  color pressedColor;
  color pressedBack;
  
  color presentItem;
  color presentBack;
  
  float tWidth;
  
  boolean clicked=false;  //This vairable is used to check the clicked state of the menu item. If the mouse is clicked over the menu item, this variable becomes true.
  
  MenuText(String menuItem,PFont menuFont,float itemX,float itemY,float itemSize,color itemColor,color backColor,color pressedColor,color pressedBack){
    this.menuItem=menuItem;
    this.menuFont=menuFont;
    this.itemX=itemX;
    this.itemY=itemY;
    this.itemSize=itemSize;
    this.itemColor=itemColor;
    this.backColor=backColor;
    this.pressedColor=pressedColor;
    this.pressedBack=pressedBack;
  }
  
  void render(){
    textFont(menuFont);
    textSize(itemSize);
    tWidth=textWidth(menuItem);
    
    stroke(0);
    fill(presentBack);
    rectMode(CENTER);
    rect(itemX,itemY,tWidth*1.3,itemSize*1.4,50);
    
    fill(presentItem);
    text(menuItem,itemX-tWidth/2,itemY+itemSize*.3);
  }
  
  void update(){             //Constatnly checks for the state of the object. If the mouse is over it a certain style is show and otherwise another style is shown.
    if(mouseX<(itemX+(tWidth*1.3)/2) && mouseX>(itemX-(tWidth*1.3)/2) && mouseY<(itemY+(itemSize*1.4)/2) && mouseY>(itemY-(itemSize*1.4)/2)){
     presentItem=pressedColor;
     presentBack=pressedBack;
    }
    else{
     presentItem=itemColor;
     presentBack=backColor;
    }
  }
  
  boolean getClicked(){    //Returns the clicked state of the object.
    return clicked;
  }
  
  void unClick(){
    clicked=false;
  }
  
  void mClicked(float mX,float mY){  //Changes the clicked state of the object depending on the position of the mouse as inputs.
    if(mX<(itemX+(tWidth*1.3)/2) && mX>(itemX-(tWidth*1.3)/2) && mY<(itemY+(itemSize*1.4)/2) && mY>(itemY-(itemSize*1.4)/2)){
      clicked=true;
      //println(menuItem);
    }
  }
}
class Paddle {

  float pWidth;
  float pHeight;
  color pColor;

  float pX;
  float pY;
  float pV;
  int mve;
  
  int pOrient;

  Paddle(float pWidth, float pHeight, color pColor, int pOrient){
    this.pWidth=pWidth;
    this.pHeight=pHeight;
    this.pColor=pColor;
    this.pOrient=pOrient;
    
    if (pOrient==0) {
      this.pX=(pWidth/2);
    }
    else {
      this.pX=width-(pWidth/2);
    }
    
    this.pY=height/2;
    this.pV=7;
    this.mve=0;
  }
  
  //Le Getters
  int getOrient(){
    return pOrient;
  }
  
  float getX(){
    return pX;
  }
  
  float getY(){
    return pY;
  }
  
  float getDiag(){
    return (float)(sqrt(pWidth*pWidth-pHeight*pHeight));
  }
  
  float getWidth(){
    return pWidth;
  }
  
  float getHeight(){
    return pHeight;
  }
  
  //Le Rendered & Updater
  void render() {
    rectMode(CENTER);
    fill(pColor);
    stroke(0);

    rect(pX, pY, pWidth, pHeight,pHeight/10);
  }
  
  void updateMve(int mve){
    this.mve=mve;
  }
  
  void update(){
    this.pY=constrain(this.pY+pV*mve, pHeight/2+10, height-(pHeight/2)-10);
  }
  
}
class Score{
  int p1;
  int p2;
  int maxScore;
  
  PFont pFont;
  int pSize;
  color pText;
  color pBack;
  color pStroke;
  
  float p1X;
  float p1Y;
  
  float p2X;
  float p2Y;
   
  Score(int maxScore,PFont pFont,int pSize,color pText,color pBack,color pStroke,float p1X,float p1Y,float p2X,float p2Y){
    p1=0;
    p2=0;
    this.maxScore=maxScore;
    this.pSize=pSize;
    
    this.pFont=pFont;
    this.pText=pText;
    this.pBack=pBack;
    this.pStroke=pStroke;
    
    this.p1X=p1X;
    this.p2X=p2X;
    
    this.p1Y=p1Y;
    this.p2Y=p2Y;
  }
  
  void render(){
    textFont(pFont);
    textSize(pSize);
    
    fill(pBack);
    stroke(pStroke);
    
    rectMode(CENTER);
    
    rect(p1X,p1Y,textWidth(str(p1))*1.3,pSize);
    rect(p2X,p2Y,textWidth(str(p2))*1.3,pSize);
    
    fill(pText);
    text(str(p1),p1X-(textWidth(str(p1))/2),p1Y+pSize*0.3);
    text(str(p2),p2X-(textWidth(str(p2))/2),p2Y+pSize*0.3);
  }
  
  void update(int p){
    if(p==0){
      p2+=1;
    }
    else if(p==1){
      p1+=1;
    }
  }
  
  void reset(){
    p1=0;
    p2=0;
  }
  
  int hasMaxed(){
    if(p1>=maxScore){
      return 1;
    }
    else if(p2>=maxScore){
      return 2;
    }
    else{
      return 0;
    }
  }
}


