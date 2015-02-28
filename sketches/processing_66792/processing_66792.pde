
float x;
float y;
float x2;
float y2;
float xr;
float yr;
float xr2;
float yr2;
int divisions;
int thisroll = 150;
boolean enabled = true;
boolean shooting = false;
float currX;
float currY;
int totalPeople = 100;
int[] peopleX = new int[totalPeople];
int[] peopleY = new int[totalPeople];
boolean caught = false;
int[] caughtXY = new int[2];
int totalCaught = 0;
PImage bk;
PFont title;
String state = "init";

void setup(){
  size(600,600);
  stroke(255);
  background(0);
  for(int i=0;i<totalPeople;i++){
    peopleX[i]=(int)random(-width,0);
    peopleY[i]=(int)random(100, height);
  }
  title = loadFont("BowlbyOneSC-Regular-48.vlw");
  textFont(title, 48);
  text("AlienSpiderMonsterBuffet", 0, 40);
  text("uffetAlienSpiderMonsterBuffet", 0, 80);
  text("sterBuffetAlienSpiderMonsterBuffet", -25, 120);
  text("MonsterBuffetAlienSpiderMonsterBuffet", -5, 160);
  text("piderMonsterBuffetAlienSpiderMonsterBuffet", -10, 200);
  text("lienSpiderMonsterBuffet", -15, 240);
  text("ffetAlienSpiderMonsterBuffet", -25, 280);
  text("erBuffetAlienSpiderMonsterBuffet", -20, 320);
  text("onsterBuffetAlienSpiderMonsterBuffet", -12, 360);
  text("derMonsterBuffetAlienSpiderMonsterBuffet", -10, 400);
  text("enSpiderMonsterBuffetAlienSpiderMonsterBuffet", -25, 440);
  text("etAlienSpiderMonsterBuffet", -10, 480);
  text("erBuffetAlienSpiderMonsterBuffet", -57, 520);
  text("onsterBuffetAlienSpiderMonsterBuffet", -47, 560);
  text("derMonsterBuffetAlienSpiderMonsterBuffet", -55, 600);
  fill(0);
  noStroke();
  rect(width/2-115, height-160, 198, 47);
  textFont(title, 60);
  fill(150,0,0);
  text("Start", width/2-115, height-117);
  bk = loadImage("greece2.jpg");
}

void draw(){
  
  if(state == "game"){
    if(totalCaught<totalPeople){
      image(bk, 0, 0);
      fill(0);
      text(totalCaught, width/2-2, 52);
      fill(255);
      text(totalCaught, width/2, 50);
      person(peopleX, peopleY);
      if(shooting == true){
        if(thisroll>0){
          thisroll-=4;
          stroke(255);
          spider(thisroll, currX, currY);
        } else {
          thisroll = 150;
          shooting = false;
          enabled = true;
        }
      }
    } else {
      state = "game-over";
    }
  }
  if(state == "game-over") {
    background(255);
    fill(0);
    text("You ate all", 100, 70);
    text("the delicious", 100, 110);
    text("humans. Yum.", 100, 150);
  }
}

void mouseReleased(){
  if(state == "init"){
    if(mouseX > width/2-115 && mouseX < (width/2-115+198) && mouseY > height-160 && mouseY < height-113){
      state = "game";
    }
  }
  if(state == "game"){
    if(enabled){
      currX = mouseX;
      currY = mouseY;
      shooting = true;
      spider(thisroll, currX, currY);
      enabled = false;
    }
  }
}

void spider(float r, float mx, float my){
  for(int i=0; i<8; i++){
    x =  (float)(mx+(r*Math.sin((i+1)*(PI/4))));
    y =  (float)(my+(r*-Math.cos((i+1)*(PI/4))));
    x2 = (float)(mx+(r*Math.sin((i+2)*(PI/4))));
    y2 = (float)(my+(r*-Math.cos((i+2)*(PI/4))));
    divisions = 10;
    noFill();
    line(mx, my, x, y);
    for(int j=0; j<divisions; j++){
      xr = (float)(mx+((r/divisions)*j*Math.sin((i+1)*(PI/4))));
      yr =  (float)(my+((r/divisions)*j*-Math.cos((i+1)*(PI/4))));
      xr2 = (float)(mx+((r/divisions)*j*Math.sin((i+2)*(PI/4))));
      yr2 =  (float)(my+((r/divisions)*j*-Math.cos((i+2)*(PI/4))));      
      bezier(xr, yr, xr, yr, xr2, yr2, xr2, yr2);
    }
  }
}

void person(int[] arrX, int[] arrY){
  for(int i=0; i<arrX.length; i++){
    isCaught(thisroll, 50, arrX[i], arrY[i]);
    noStroke();
    fill(255,229,206);
    if(arrX[i] > width){
      arrX[i] = (int)random(-width,0);
      arrY[i] = (int)random(100,height);
    }
    if(caught){
      if(arrX[i] == caughtXY[0] && arrY[i] == caughtXY[1]){
        arrX[i] = -width-1;
        arrY[i] = -width-1;
        caught = false;
        totalCaught++;
        println(totalCaught);
      }
    }
    if((arrX[i] != (-width-1)) && (arrY[i] != (-width-1))){
      arrX[i]+=random(5);
      if (arrY[i]<=100){
        arrY[i]+=random(0, 10);
      } else {
        arrY[i]+=random(-5, 5);
      }
    }
    ellipse(arrX[i],arrY[i],10,10);
    noFill();
  }
}

void isCaught(int r, int l, float x, float y){
  if(r<=l){
    if((x <= currX+r && x >= currX-r) && (y <= currY+r && y >= currY-r)){
      caught = true;
      caughtXY[0] = (int)x;
      caughtXY[1] = (int)y;
    }
  }
}

