
import controlP5.*;
StartMenu startMenu;
Controller controller;
Game game;

public void setup(){
  startMenu = new StartMenu(this);
  controller = new Controller();
  size(500,268);//*40 for scale
  smooth();
}

public void draw(){
  background(0);
  if(game != null){
    game.run();
  }
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  String s = theEvent.getController().getName();
  
  if(s == "           STAND"){
    STAND();
  }
  if(s == "           WALK"){
    WALK();
  }
  if(s == "          ATTACK"){
    ATTACK();
  }
  if(s == "          ATTACK2"){
    ATTACK2();
  }
  if(s == "           BLOCK"){
    BLOCK();
  }
  if(s == "START"){
    START();
  }
}
public void STAND(){
  selectInput("choose a stand animation","loadStand");
}
public void WALK(){
  selectInput("choose a walk animation","loadWalk");
}
public void ATTACK(){
  selectInput("choose an attack animation","loadAttack");
}
public void BLOCK(){
  selectInput("choose a block animation","loadBlock");
}
public void ATTACK2(){
  selectInput("choose a attack2 animation","loadAttack2");
}
public void loadStand(File s){
  String a = s.getAbsolutePath();
  int cropLength = extractNumber(a);
  
  checkingloop:
  for(int i=0; i<6; i++){
    a = a.substring(0, Math.min(a.length(),cropLength)); 
  }
  println(getSequenceLength(a));
  startMenu.stand = loadAnimation(a,getSequenceLength(a));
  startMenu.addStandPreview();
}

public void loadWalk(File s){
  String a = s.getAbsolutePath();
  int cropLength = extractNumber(a);
  
  checkingloop:
  for(int i=0; i<6; i++){
    a = a.substring(0, Math.min(a.length(),cropLength)); 
  }
  startMenu.walk = loadAnimation(a,getSequenceLength(a));
  startMenu.addWalkPreview();
}

public void loadAttack(File s){
  String a = s.getAbsolutePath();
  int cropLength = extractNumber(a);
  
  checkingloop:
  for(int i=0; i<6; i++){
    a = a.substring(0, Math.min(a.length(),cropLength)); 
  }
  startMenu.attack = loadAnimation(a,getSequenceLength(a));
  startMenu.addAttackPreview();
}
public void loadAttack2(File s){
  String a = s.getAbsolutePath();
  int cropLength = extractNumber(a);
  
  checkingloop:
  for(int i=0; i<6; i++){
    a = a.substring(0, Math.min(a.length(),cropLength)); 
  }
  startMenu.attack2 = loadAnimation(a,getSequenceLength(a));
  startMenu.addAttack2Preview();
}
public void START(){
  game = new Game(startMenu.stand,startMenu.walk,startMenu.attack,startMenu.block,startMenu.attack2);
  game.setInfo(startMenu.speed,startMenu.hp,startMenu.ap,startMenu.team,startMenu.player_name_textfield.getText());
  println("name = "+startMenu.player_name_textfield.getText());
  startMenu.cp5.hide();
}
public void loadBlock(File s){
  String a = s.getAbsolutePath();
  int cropLength = extractNumber(a);
  
  checkingloop:
  for(int i=0; i<6; i++){
    a = a.substring(0, Math.min(a.length(),cropLength)); 
  }
  startMenu.block = loadAnimation(a,getSequenceLength(a));
  startMenu.addBlockPreview();
}
  
  void keyPressed(){
    
    if(keyCode == 17){
      controller.ctrl = true;
    }
    if(keyCode == 32){
      controller.space = true;
    }
    if(keyCode == 39){
      controller.right = true;
    }
    if(keyCode == 37){
      controller.left = true;
    }
    if(keyCode == 38){
      controller.up = true;
    }
    if(keyCode == 40){
      controller.down = true;
    }
  }
  void keyReleased(){
    
    if(keyCode == 17){
      controller.ctrl = false;
    }
    if(keyCode == 32){
      controller.space = false;
    }
    if(keyCode == 39){
      controller.right = false;
    }
    if(keyCode == 37){
      controller.left = false;
    }
    if(keyCode == 38){
      controller.up = false;
    }
    if(keyCode == 40){
      controller.down = false;
    }
  }
class Controller {
  boolean space;
  boolean left;
  boolean right;
  boolean up;
  boolean down;
  boolean ctrl;
  
  Controller(){
  }
}
class Game {
  PImage[] stand,walk,attack,attack2,block,current;
  int speed,health=100,attackpoints,team,direction=1,count=0,actualHeight;
  float realCount=0;
  PVector position,target;
  String name;
  boolean hit=false;
  
  Game(PImage[] a,PImage[] b,PImage[] c,PImage[] d,PImage[] e){
    stand = a;
    walk = b;
    attack = c;
    block = d;
    attack2 = e;
    position = new PVector(random(100),random(100));
    target = new PVector(position.x,position.y);
    current = stand;
  }
  
  void run(){
    control();
    displaySprite();
    animate();
    alignY();
    showStats();
  }
  void control(){
    PVector velocity = new PVector(0,0);
    if(controller.right){
      velocity.x = 1;
      direction = -1;
      if(!controller.space){
        changeSprite(walk);
      }
    }
    if(controller.left){
      velocity.x = -1;
      direction =  +1;
      if(!controller.space){
        changeSprite(walk);
      }
    }
    if(controller.up){
      velocity.y = -1;
      if(!controller.space){
        changeSprite(walk);
      }
    }
    if(controller.down){
      velocity.y = 1;
      if(!controller.space){
        changeSprite(walk);
      }
    }
    if(controller.space){
      if(!controller.down && !controller.up && !controller.left && !controller.right){
        velocity.set(0,0);
        changeSprite(attack);
      } else {
        changeSprite(attack2);
      }
    }
    if(controller.ctrl){
      velocity.set(0,0);
      changeSprite(block);
    }
    if(!controller.space && !controller.right && !controller.left && !controller.up && !controller.down && !controller.ctrl){
      changeSprite(stand);
    }
    velocity.setMag(speed);
    position.add(velocity);
  }
  
  void setInfo(int s,int h,int a, int t, String n){ 
    speed = s;
    health = h+100;
    attackpoints = a;
    team = t;
    name = n;
  }
  
  void displaySprite(){
    PImage temp = current[count];
    pushMatrix();
    imageMode(CENTER);
    translate(position.x,position.y);
    scale(direction,1);
    image(current[count],0,-(current[count].height/2),current[count].width,current[count].height);
    popMatrix();
  }
  void animate(){
    if(realCount<current.length-0.5){
      realCount+=0.15;
      count = (int)realCount;
    } else {
      realCount = 0;
    }
  }
  void changeSprite(PImage[] a){
    if(current != a){
      count = 0;
      current=a;
    }
  }
  void showStats(){
    pushMatrix();
    translate(5,10);
    fill(255);
    textSize(10);
    textAlign(LEFT);
    text(name+"\n"+"HEALTH: "+health+"%",0,0);
    popMatrix();    
  }
  void getHit(int a,int b){
    if(hit){
      int damage = (int)random(a,b);
      health -= damage;
      hit=false;
    }
  }
  void alignY(){
    PVector velocity = new PVector();
    
    position.add(velocity);
    println(position);
  }
}
public PImage[] loadAnimation(String s, int n){
  PImage[] a = new PImage[n];
  for(int i=0; i<n; i++){
    a[i] = croppedImage(loadImage(s+i+".gif"));
  }
  return a;
}

public int getSequenceLength(String a){
  
  checkingloop:
  for(int i=0; i<50; i++){
    if(loadImage(a+i+".gif")==null){//ignore the error it just happens because there is not try and catch, program is O.K.;        result = i-1;
        return i;
    }
  }
  return 0;
}

public int extractNumber(String a){
  int result=0;
  
  checkingloop:
  for(int i =a.length()-1; i>0; i--){
    char b = a.charAt(i);
    
    if(isNumber(b)){
      result = i;
      while(isNumber(a.charAt(i-1))){
        result = i-1;
        i--;
      }
      break checkingloop;
    }
  }
  return result;
}

public boolean isNumber(char b){
  boolean result = false;
  if(b == '0' ||
       b == '1' ||
       b == '2' ||
       b == '3' ||
       b == '4' ||
       b == '5' ||
       b == '6' ||
       b == '7' ||
       b == '8' ||
       b == '9'){
      result = true;
    }
    return result;
}

public PImage croppedImage(PImage a){
  PImage b = createImage(a.width,a.height,ARGB);
  ArrayList colouredPixels = new ArrayList();
  b.loadPixels();
  a.loadPixels();
  int colCounter=0, rowCounter=0;
  PVector[] counter = new PVector[a.width*a.height];
  
  for(int i=0; i<a.pixels.length; i++){
    colCounter++;
    if(colCounter==a.width){
      colCounter = 0;
      rowCounter++;
    }
    counter[i] = new PVector(colCounter,rowCounter);
    
    if(a.pixels[i] != -1){
       b.pixels[i] = a.pixels[i];
       colouredPixels.add(i);
    }
  }
  a.updatePixels();
  b.updatePixels();
  
  return b;
}

public PImage returnInverse(PImage a){
  PImage b = createImage(a.width,a.height,ARGB);
  
  a.loadPixels();
  PVector[] listToCoords = new PVector[a.width*a.height];
  int[][] coordsToList = new int[a.width][a.height];
  
  int row=0,column=0;
  
  for(int i=0; i<a.width*a.height; i++){
    listToCoords[i] = new PVector(column,row);
    coordsToList[a.width-column][row] = i;
    
    column++;
    if(column == a.width){
      row++;
      column = 0;
    }
  }
  
  b.loadPixels();
  PVector[] newlistToCoords = new PVector[a.width*a.height];
  int[][] newcoordsToList = new int[a.width][a.height];
  
  row = 0;
  column = 0;
  
  for(int i=0; i<b.width*b.height; i++){
    b.pixels[i] = a.pixels[newcoordsToList[column][row]];
    
    column++;
    if(column == a.width){
      row++;
      column = 0;
    }
  }
  b.updatePixels();
  
  return b;
}
class StartMenu {
  ControlP5 cp5;
  String player_name;
  PFont default_font;
  int speed=1,hp,ap,team;
  public PImage[] stand,walk,attack,block,attack2;
  PImage stand_icon,walk_icon,attack_icon,block_icon,attack2_icon;
  color default_colour;
  Group startMenuGroup;
  Textfield player_name_textfield;
  Button stand_preview,attack2_preview,walk_preview,attack_preview,block_preview,stand_icon_button,walk_icon_button,attack_icon_button,block_icon_button;
  
  StartMenu(PApplet pa){
    default_font = createFont("Small Fonts",10);
    cp5 = new ControlP5(pa);
    startMenuGroup = new Group(cp5,"startMenuGroup");
    //default_colour = new color(255,0,0);
    
    stand_icon = loadImage("stand_icon.png");
    walk_icon = loadImage("walk_icon.png");
    attack_icon = loadImage("attack_icon.png");
    block_icon = loadImage("block_icon.png");
    
    
    createUI();
  }
  
  public void controlEvent(ControlEvent theEvent) {
    println(theEvent.getController().getName());
  }
  
  public void createUI(){
    
    player_name_textfield = cp5.addTextfield("player_name")
       .setPosition(8,8)
       .setSize(116,40)
       .setFont(default_font)
       //.setText("PLAYER'S NAME")
       .setColor(color(255,255,255));
    
    cp5.addButton("STATS:")
     .setValue(1)
     .setPosition(8,64)
     .setSize(116,29)
     .setColorValue(color(148,0,0));
    
    cp5.addButton("SPEED")
     .setValue(1)
     .setPosition(8,95)
     .setSize(116,29);
   
    cp5.addButton("HP")
     .setValue(1)
     .setPosition(8,126)
     .setSize(116,29);
     
    cp5.addButton("AP")
     .setValue(1)
     .setPosition(8,157)
     .setSize(116,29);
    
    cp5.addButton("TEAM")
     .setValue(1)
     .setPosition(8,188)
     .setSize(116,29);
     
   cp5.addButton("START")
     .setPosition(8,220)
     .setSize(116,40);
     
   cp5.addTextlabel("points_label")
       .setPosition(432,8)
       .setSize(60,60)
       .setFont(default_font)
       .setText("10")
       .setColor(default_colour);
  
  stand_icon_button = cp5.addButton("           STAND")//27 char's in a 71 pix box
       //.setValue(0)
       .setPosition(127,189)
       .setSize(71,71);
  
  walk_icon_button = cp5.addButton("           WALK")
       //.setValue(0)
       .setPosition(127+71+2,189)
       .setSize(71,71);
       
  attack_icon_button = cp5.addButton("          ATTACK")
       //.setValue(0)
       .setPosition(127+71+71+4,189)
       .setSize(71,71);
       
  block_icon_button = cp5.addButton("           BLOCK")
       //.setValue(0)
       .setPosition(127+71+71+71+6,189)
       .setSize(71,71);
  
  block_icon_button = cp5.addButton("          ATTACK2")
       //.setValue(0)
       .setPosition(127+71+71+71+71+8,189)
       .setSize(71,71);
       
  }
  
  public void player_name_function(String _player_name){    
  }
  public void addStandPreview(){
    //println(stand[0].toString());
    stand_preview = cp5.addButton("stand_sample")
       .setPosition(116+48-50,(height/2)-100)
       .setImages(stand[0],stand[0],stand[0])
       .updateSize();
  }
  public void addWalkPreview(){
    //println(stand[0].toString());
    walk_preview = cp5.addButton("walk_sample")
       .setPosition(116+48-50+71,(height/2)-100)
       .setImages(walk[0],walk[0],walk[0])
       .updateSize();
  }
  public void addAttackPreview(){
    //println(stand[0].toString());
    attack_preview = cp5.addButton("attack_sample")
       .setPosition(116+48-50+71+71,(height/2)-100)
       .setImages(attack[3],attack[3],attack[3])
       .updateSize();
  }
  public void addBlockPreview(){
    //println(stand[0].toString());
    block_preview = cp5.addButton("block_sample")
       .setPosition(116+48-50+71+71+71,(height/2)-100)
       .setImages(block[0],block[0],block[0])
       .updateSize();
  }
  public void addAttack2Preview(){
    //println(stand[0].toString());
    attack2_preview = cp5.addButton("attack2_sample")
       .setPosition(116+48-50+71+71+71+71,(height/2)-100)
       .setImages(attack2[0],attack2[0],attack2[0])
       .updateSize();
  }
  public void SPEED(int a){
    println("speed pressed");
  }
}


