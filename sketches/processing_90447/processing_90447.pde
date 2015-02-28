
/* @pjs preload="img.jpg";
 */
 

int[] x=new int[10];
int[] y=new int[10];
PImage img;
int[] ya=new int[10];
int numb;
int end;
int gap =80;
int space = 90;
int set=0;
int thick=10;
boolean gameover=false;
int score=0;
boolean start=false;

void setup() {
  img = loadImage("img.jpg");
frameRate(30);
  size(400,600,P2D);
 colorMode(RGB); 
  background(img);
 
for(int z=0;z<10;z++){

ya[z]=600+(z*90);
x[z]=int(random(width-50));
y[z]=610+(z*90);
end=y[z];
} 

}

void draw(){

//START SCREEN CHECK
  if(start==false){
  background(img);
    textSize(30);
  fill(250,200,180);
  
  text("avoid lines to progress",40,50);
  text("if a line hits the top, you get points",40,70);
  text("move mouse to top of screen, then",40,90);
  text("right click to start",40,110);
  }else if (gameover==true){
  //GAMEOVER CHECK
     textSize(20);
  fill(250,0,180);
  text("Game Over. Final score: "+score,0,30);
  text("Click to play again",0,50);
  }
  else{
  //THE GAME
  noStroke();
  background(img);
 
for(int i=0;i<10;i++){
//COLLISION RED BAR LEFT SIDE, GAMEOVER CONDITION
if(mouseX>=0 && mouseX<=x[i] && mouseY>=ya[i] && mouseY<=y[i]){
  fill(255,0,0);
gameover=true;
}
else if(mouseX>=x[i]+gap && mouseX<=width && mouseY>=ya[i] && mouseY<=y[i]){
 //RIGHT SIDE
  fill(255,0,0);
  gameover=true;
} else 
//IF IT IS NOT GAMEOVER OR START, DO THE GAME
fill(0,0,0);
//DRAW RECTANGLE
quad(0,ya[i],0,y[i],x[i],y[i],x[i],ya[i]);
quad(x[i]+gap,ya[i],x[i]+gap,y[i],width,y[i],width,ya[i]);
//MOVE UP SCREEN
ya[i]-=5;
y[i]-=5;
//MOVE TO BOTTOM IF HITS TOP, ADD SCORE
if(y[i]<=0){
ya[i]=end+space;
x[i]=int(random(width-50));
y[i]=end+thick+space;
end=y[i];
set++;
score+=thick;
}

}
end-=5;
//AFTER 10 BARS, GET THICKER AND SMALLER GAP
if(set==10){
 set=0;
 gap-=10;
 thick+=10;
 space-=10;

}
//SCORE TEXT
 textSize(20);
  fill(250,0,180);
  text(score,0,height);
  }
  strokeWeight(5);
    stroke(random(255),random(255),random(255));
 line(pmouseX,pmouseY,mouseX,mouseY);
}

void keyPressed(){
  //KEYS ARE DUMB THIS IS USELESS CODE

  
}

void mousePressed(){
//RIGHT CLICK 2 START
 if (start==false && mouseButton==RIGHT)
start=true; 
//RESET GAME WITH LEFT CLICK
 if(gameover==true && mouseButton==LEFT){
   score=0;
   thick=10;
   gap=80;
   space=90;
   set=0;
   //RESET BAR POSITION CODE
  for(int z=0;z<10;z++){

ya[z]=600+(z*90);
x[z]=int(random(width-50));
y[z]=600+(z*90)+thick;
end=y[z];
} 
gameover=false;
 } 
}



