
int appX = floor(random(1,20))*10;
int appY = floor(random(1,20))*10;
int l = 1;
int i,mi,nmi,li;
int snkX[] =new int [l];
int snkY[]=new int [l];
int spX,spY;

char direction;
int nextX,nextY;

void setup(){
  size(200,200);
  background(255);
  snkX[0]=20;
  snkY[0]=20;
}

void draw(){  
  frameRate(10);
  background(255);
 
 //food to eat
  fill(0);
  rect(appX,appY,10,10);
  

  if(direction=='W'){
    spX=0;
    spY=-10;
}
    else if (direction=='S'){
    spX=0;
    spY=10;
}
    else if (direction=='A'){
    spX=-10;
    spY=0;
}
    else if (direction=='D'){
    spX=10;
    spY=0;
  }
  nextX = (int)snkX[0]+spX;
  nextY = (int)snkY[0]+spY;
//end game
if ((nextX<0)||(nextX>200)||(nextY<0)||(nextY>200)){
  background(255);
  textSize(30);
  fill(#FA0000);
  text("you LOSE",30,100);
  textSize(10);
  noLoop();
  



}
if(l == 2){
 // textSize(10); 
fill(0);
 text("FIRST BLOOD",50,60);

}

//draw snake 
  fill(180,0,0);
  for (li=l+1;li>1;li--){
   rect(snkX[li-2],snkY[li-2],10,10);
  }
//check if the snake eat the food.
  if ((nextX == appX)&&(nextY == appY)){

  snkX =expand(snkX,l+1);
  snkY=expand(snkY,l+1);
  for (mi=l+1;mi>1;mi--){
  snkX[mi-1]=snkX[mi-2];
  snkY[mi-1]=snkY[mi-2];  
}
  snkX[0] = nextX;
  snkY[0] = nextY;
  l=l+1;
 appX= (int)(random(1,20))*10;
 appY = (int)(random(1,20))*10;

 } else {
// move only 
  for (nmi=l;nmi>1;nmi--){
  snkX[nmi-1]=snkX[nmi-2];
  snkY[nmi-1]=snkY[nmi-2];  
}
  snkX[0] = nextX;
  snkY[0]=nextY;
 }





}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
     direction = 'W';
    } else if (keyCode == DOWN) {
      direction = 'S';
    } else if (keyCode == LEFT) {
      direction = 'A';
    } else if (keyCode == RIGHT) {
     direction = 'D';
    } 
}
}
