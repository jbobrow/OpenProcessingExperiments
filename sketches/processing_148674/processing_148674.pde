
int i = 5;
stat playerHealth;
stat playerHunger;
stat playerThirst;
inventory playerInventory;
base playerBase;
gatherable[] collect = new gatherable[100];
location playerLocation;
int textSize = 12;
daysLeft playerLimit;
objective playerObjective;
int collectables;
int pause;

void setup(){
//  background(20);
  pause = 0;
  size(800,500);
  collectables=0;
  playerInventory = new inventory();
  playerHealth = new stat(10);
  playerHunger = new stat(5);
  playerThirst = new stat(5);
  playerBase = new base();
//  for(int i=0;i<100;i++){
//   tests[i] = new gatherable(floor(random(7)),random(500)+50,random(400)+50);
//  }
  playerLocation = new location();
  playerLimit = new daysLeft(15);
  playerObjective = new objective();
}

void draw(){
  background(200);
  inventoryGrid(600);
  playerHealth.displayHealth(0,0);
  playerHunger.displayHunger(0,30);
  playerThirst.displayThirst(0,60);
  playerInventory.display(600);
  if(pause==0){
    playerLocation.display();
    playerBase.display(300);
    playerLimit.display(0,90);
    for(int i=0;i<collectables;i++){
      collect[i].display();
    }
    playerObjective.check(playerHealth,playerHunger,playerThirst,playerLimit);
    playerObjective.win(playerInventory.objNum(7));
  }
  else if(pause==1){
    
  }
}

void mousePressed(){
  for(int i=0;i<collectables;i++){
    if(collect[i].click()==1){
      playerInventory.change(collect[i].value(),1);
    }
  }
//  playerInventory.craftTeli();
//  playerInventory.craftHammer();
  collectables = playerLocation.move(playerLimit, playerHealth, playerHunger, playerThirst, playerBase, collect);
  playerInventory.interact(playerHealth, playerHunger);
}


int spawn(gatherable[] thing, int location){
  int i=0;
  if(location==1){
    if(random(100)>50){
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(1,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(1,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(1,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(2,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(2,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(2,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
    }
  }
  if(location==2){
    if(random(100)>50){
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
    }
  }
  if(location==3){
    if(random(100)>75){
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(0,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(1,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(3,random(500)+50,random(400)+50);
      i++;
    }
  }
  if(location==4){
    if(random(100)>50){
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(4,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(5,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(5,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(5,random(500)+50,random(400)+50);
      i++;
    }
    if(random(100)>50){
      thing[i] = new gatherable(6,random(500)+50,random(400)+50);
      i++;
      thing[i] = new gatherable(6,random(500)+50,random(400)+50);
      i++;
    }
    else{
      thing[i] = new gatherable(6,random(500)+50,random(400)+50);
      i++;
    }
  }
  return i;
}

void inventoryGrid(float pos){
  PImage[] objPic = new PImage[10];
  objPic[0] = loadImage("Meat.png");
  objPic[1] = loadImage("Berries.png");
  objPic[2] = loadImage("Wood.png");
  objPic[3] = loadImage("Grass.png");
  objPic[4] = loadImage("Stone.png");
  objPic[5] = loadImage("Gold.png");
  objPic[6] = loadImage("Magicite.png");
  objPic[7] = loadImage("Teli.png");
  objPic[8] = loadImage("Hand.png");
  objPic[9] = loadImage("Armor.png");
  stroke(0);
  strokeWeight(2);
  fill(255,231,185);
  rect(pos, 0, width-pos-1, height-1);
  line(pos+200/2,0,pos+200/2,600);
  for(int i = 1;i<5;i++){
    line(pos,i*100,pos+200,i*100);
  }
   for(i=0;i<5;i++){
     for(int j=0;j<2;j++){
       image(objPic[j+i*2],j*100+600,i*100);
     }
   }
}

void drawHeart (float x, float y) {   //taken from http://www.openprocessing.org/sketch/52409
    smooth();
    noStroke();
    fill(255, 0, 0, 150);
    beginShape();
    vertex(50+x, 15+y);
    bezierVertex(50+x, -5+y, 95+x, 5+y, 50+x, 35+y);
    vertex(50+x, 15+y);
    bezierVertex(50+x, -5+y, 5+x, 5+y, 50+x, 35+y);
    endShape();
}

void drawDrumstick(float x, float y){
  strokeWeight(8);
  stroke(255,200);
  line(x+5,y-5,x+15,y-15);
  noStroke();
  fill(255,200);
  ellipse(x+14,y-20,10,10);
  ellipse(x+20,y-14,10,10);
  fill(250,180,90,200);
  ellipse(x,y,24,24);
}

void drawTear (float x, float y) {
    smooth();
    noStroke();
    fill(0, 0, 255, 120);
    beginShape();
    vertex(x+20, y);
    bezierVertex(x+25, 10+y, x+40, 28+y, x+20, y+30);
    vertex(x+20, y);
    bezierVertex(x+15, 10+y, x, 28+y, x+20, y+30);
    endShape();
}

class objective{
  int status;
  objective(){
    status=1;
  }
  int status(){
    return status;
  }
  void check(stat HP, stat hunger, stat thirst, daysLeft limit){
    if(HP.value()<0 || hunger.value()<0 || thirst.value()<0 || limit.when()<0){
      textSize(100);
      text("You lose :(",40,200);
      stop();
    }
  }
  
  void win(int tele){
    if(tele>9){
      textSize(100);
      text("You win :D",40,200);
      stop();
    }
  }
  
}

class daysLeft{
  int daysLeft;
  daysLeft(int num){
    daysLeft=num;
  }
  void display(float xPos, float yPos){
    fill(0);
    textSize(textSize);
    text("Days left:" , xPos + 5, yPos + 15);
    text(daysLeft,xPos+60, yPos+15);
  }
  int when(){
    return daysLeft;
  }
  void dayPass(stat HP, stat hunger, stat thirst, base home){
    daysLeft--;
    if(random(1)>.5){
      HP.change(-1);
    }
    hunger.change(-1);
    thirst.change(-1);
  }
}

class location{
  int loc; //0 base, 1 forest up, 2 river right, 3 plains down, 4 cave left
  PImage[] locPic = new PImage[4]; // 0 up, 1 right, 2 down, 3 left
  int numOfColl=0;
  location(){
    loc=0;
    locPic[0] = loadImage("Up.png");
    locPic[1] = loadImage("Right.png");
    locPic[2] = loadImage("Down.png");
    locPic[3] = loadImage("Left.png");
  }
  void goTo(int place){
    loc=place;
  }
  void display(){
    if(loc==0 || loc == 1){ //down
      image(locPic[2], 250, 450);
    }
    if(loc==0 || loc == 2){ //left
      image(locPic[3], 0, 200);
    }
    if(loc==0 || loc == 3){ //up
      image(locPic[0], 250, 0);
    }
    if(loc==0 || loc == 4){ //right
      image(locPic[1], 550, 200);
    }
    fill(0);
    if(loc==0){
      textSize(26);
      text("Base",80,20);
    }
    if(loc==1){
      textSize(26);
      text("Forest",80,20);
    }
    if(loc==2){
      textSize(26);
      text("River",80,20);
    }
    if(loc==3){
      textSize(26);
      text("Plain",80,20);
    }
    if(loc==4){
      textSize(26);
      text("Cave",80,20);
    }
    text(loc,300,300);
  }
  int where(){
    return loc;
  }  
 int move(daysLeft limit, stat HP, stat hunger, stat thirst, base home, gatherable[] thing){
    if (mouseX<350 && mouseX>250 && mouseY<500 && mouseY>450){ //down
      if(loc==0){
        tint(100);
        image(locPic[2], 250, 450);
        tint(255);
        loc=3;
        numOfColl = spawn(thing,loc);
        limit.dayPass(HP, hunger, thirst, home);
      }
      if(loc==1){
        tint(100);
        image(locPic[2], 250, 450);
        tint(255);
        loc=0;
        numOfColl=0;
      }
    }    
    if (mouseX<350 && mouseX>250 && mouseY<50 && mouseY>0){ //up
      if(loc==0){
        tint(100);
        image(locPic[0], 250, 0);
        tint(255);
        loc=1;
        numOfColl = spawn(thing,loc);
        limit.dayPass(HP, hunger, thirst, home);
      }
      if(loc==3){
        tint(100);
        image(locPic[0], 250, 0);
        tint(255);
        loc=0;
        numOfColl=0;
      }
    }
    if (mouseX<600 && mouseX>550 && mouseY<300 && mouseY>200){ //right
      if(loc==0){
        tint(100);
        image(locPic[1], 550, 200);
        tint(255);
        loc=2;
        numOfColl = spawn(thing,loc);
        limit.dayPass(HP, hunger, thirst, home);
        thirst.become(5);
      }
      if(loc==4){
        tint(100);
        image(locPic[1], 550, 200);
        tint(255);
        loc=0;
        numOfColl=0;
      }
    }
    if (mouseX<50 && mouseX>0 && mouseY<300 && mouseY>200){ //left
      if(loc==0){
        tint(100);
        image(locPic[3], 0, 200);
        tint(255);
        loc=4;
        numOfColl = spawn(thing,loc);
        limit.dayPass(HP, hunger, thirst, home);
      }
      if(loc==2){
        tint(100);
        image(locPic[3], 0, 200);
        tint(255);
        loc=0;
        numOfColl=0;
      }
    }
    return numOfColl;
  }
}

class gatherable{
  PImage[] objPics = new PImage[10];
  int obj;
  float xPos;
  float yPos;
  int status;
  gatherable(int type, float x, float y){
    obj = type;
    xPos = x;
    yPos = y;
    status=1;
    objPics[0] = loadImage("Meat.png");
    objPics[1] = loadImage("Berries.png");
    objPics[2] = loadImage("Wood.png");
    objPics[3] = loadImage("Grass.png");
    objPics[4] = loadImage("Stone.png");
    objPics[5] = loadImage("Gold.png");
    objPics[6] = loadImage("Magicite.png");
    objPics[7] = loadImage("Teli.png");
    objPics[8] = loadImage("Hand.png");
    objPics[9] = loadImage("Armor.png");
  }
  void display(){
    if(status==1){
      image(objPics[obj],xPos-50,yPos-50);
    }
  }
  int click(){
    if(mouseX<xPos+50 && mouseX>xPos-50 && mouseY<yPos+50 && mouseY>yPos-50 && status==1){
      status=0;
      return 1;
    }
    return -1;
  }
  int value(){
    return obj;
  }
  
}

class stat{
  int statP;
  float xPos;
  float yPos;
  stat(int num){
    statP=num;
  }
  int value(){
    return statP;
  }
  void change(int diff){
    statP=statP+diff;
  }
  void become(int value){
    statP=value;
  }
  void displayHealth(float iniXPos, float iniYPos){
    textSize(textSize);
    xPos = iniXPos;
    yPos = iniYPos;
    drawHeart(xPos-28,yPos-5);
    fill(0);
    text("HP:" , xPos + 5, yPos + 15);
    text(statP,xPos+ 27, yPos+15);
  }
  void displayHunger(float iniXPos, float iniYPos){
    textSize(textSize);
    xPos = iniXPos;
    yPos = iniYPos;
    drawDrumstick(xPos+28,yPos+15);
    fill(0);
    text("Hunger:" , xPos + 5, yPos + 15);
    text(statP,xPos+51, yPos+15);
  }
  void displayThirst(float iniXPos, float iniYPos){
    textSize(textSize);
    xPos = iniXPos;
    yPos = iniYPos;
    drawTear(xPos+7,yPos-5);
    fill(0);
    text("Thirst:" , xPos + 5, yPos + 15);
    text(statP,xPos+ 42, yPos+15);
  }
}

class inventory{
  int[] obj = new int[10];  //0 is meat, 1 is plant, 2 is wood, 3 is grass, 4 is stone,
                            //5 is magicite, 6 is gold, 7 is part.
                            //currently 8 is hand, 9 is armour.
                            //Not sure what to do about hand/armour yet.
  PImage hammer = loadImage("Hammer.png");
  inventory(){
    for(int i=0;i<10;i++){
      obj[i]=0;
    }
  }
  void change(int objectNumber, int diff){
    obj[objectNumber]=obj[objectNumber]+diff;
  }
  void become(int objectNumber, int value){
    obj[objectNumber]=value;
  }
  int objNum(int objectNumber){
    return obj[objectNumber];
  }
  void display(float pos){
    textSize(textSize);
    for(int i=0;i<5;i++){
      for(int j=0;j<2;j++){
        text(obj[i*2+j], pos+50+j*100-3, 50+i*100+3+44);  //want to add background pics to objects
      }
    }
    if(obj[8]>0){
      image(hammer,600,440);
    }
  }
  void interact(stat HP, stat hunger){
    if(mouseX<800 && mouseX>700 && mouseY<400 && mouseY>300 && obj[5]>0 && obj[6]>0){
      obj[5]=obj[5]-1;
      obj[6]=obj[6]-1;
      obj[7]=obj[7]+1;
    }
    if(mouseX<700 && mouseX>600 && mouseY<500 && mouseY>400 && obj[3]>0 && obj[4]>1 && obj[5]>0){
      obj[2]-=1;
      obj[3]-=2;
      obj[4]-=1;
      obj[8]++;
    }
    if(mouseX<700 && mouseX>600 && mouseY<100 && mouseY>0 && obj[0]>0){
      HP.change(1);
      hunger.change(2);
      obj[0]--;
    }
    if(mouseX<800 && mouseX>700 && mouseY<100 && mouseY>0 && obj[1]>0){
      HP.change(1);
      hunger.change(1);
      obj[1]--;
    }
  }
}

class base{
  int[] struct = new int[10];  //0 is fire (value: 1 built, 2 on), 1 is water?, 2 is bed, 3 is roof, 4 is weapon, 5 is armour,... ??
                               //Need a lot more for interesting things to do.
  base(){
    for(int i=0;i<10;i++){
      struct[i]=0;
    }
  }
  void display(float pos){
//    for(int i=0;i<5;i++){
//      for(int j=0;j<2;j++){
//        text(struct[i*2+j], pos+50+j*100-3, 50+i*100+3);
//      }
//    }
  }
  void create(int structNumber){
    struct[structNumber]=1;
  }
  void destroy(int structNumber){
    struct[structNumber]=0;
  }
  void craftBed(inventory inv){
    if(mouseX<700 && mouseX>600 && mouseY<500 && mouseY>400 && inv.objNum(3)>9 && struct[2]==0){ //not correct placement
      inv.change(3,-10);
      struct[2]=1;
    }
  }
  void craftFire(inventory inv){
    if(mouseX<700 && mouseX>600 && mouseY<500 && mouseY>400 && inv.objNum(2)>1  && inv.objNum(4)>7 && struct[0]==0){ //not correct placement //&& inv.objNum(3)>0
      inv.change(2,-2);
//      inv.change(3,-1);  grass?
      inv.change(4,-8);
      struct[0]=2;
    }
  }
  void moreFire(inventory inv){
    if(mouseX<700 && mouseX>600 && mouseY<500 && mouseY>400 && inv.objNum(2)>0 && struct[0]==1){ //not correct placement && inv.objNum(3)>0 && inv.objNum(4)>7 
      inv.change(2,-1);
//      inv.change(3,-1); more grass?
//      inv.change(4,-8); more rocks?
      struct[0]=2;
    }
  }
}

class slide{
  String[] line = new String[20];
  int i=0;
  int start = 1;
  slide(){
  }
  void display(int loc, int start){
    float perc = random(100);
    if(start==1){
      line[i] = "Oh no. It appears you didn't quite use your alchemy correctly."; //without weapon take damage
      i++;
      line[i] = "You made some teleportation stones, but are not where you wanted to go."; //with weapon take less damage
      i++;
      line[i] = "After looking around a bit, it looks like you are on an island."; //without weapon take damage
      i++;
      line[i] = "You set up a base and look for some materials to make more teleportation stones."; //with weapon take less damage
      i++;
    }
    else{
      if(loc==1){
        if(perc>25){
          fill(0);
          line[i] = "You walk into the forest and are met by a large bear."; //without weapon take damage
          i++;
          line[i] = "He slaps you. It really hurts."; //with weapon take less damage
          i++;
        }
        else{
          line[i] = "You see a rabbit and attempt to sneak up on it."; //without weapon leads you to berries
          i++;
          line[i] = "The rabbit sees you and runs away."; //with weapon kill rabbit for meat
          i++;
        }
      }
      if(loc==2){
        if(perc>25){
          fill(0);
          line[i] = "You see a fish. You try and grab the fish."; //without weapon hurts you.
          i++;
          line[i] = "It bites you and slips away. You don't feel so good."; //with weapon kill fish for meat.
          i++;
        }
        else{
          line[i] = "You see something glimmering in the water."; //50% gold
          i++;
          if(perc>12){
            line[i] = "Its gold!"; //50% magicite
            i++;
          }
          else{
            line[i] = "Its magicite!"; 
            i++;
          }
        }
      }
      if(loc==3){
        // What happens at the plains?
      }
    }
    for(int j=0;j<i;j++){
      text(line[j],100,100+20*j);
    }
    text("click to continue", 100,400);
  }
}


