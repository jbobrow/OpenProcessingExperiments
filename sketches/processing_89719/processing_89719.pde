
int[] x=new int[10];
int[] y=new int[10];

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
  
frameRate(30);
  size(400,600,P2D);
 colorMode(RGB); 
  background(255);
 noCursor();
for(int z=0;z<10;z++){

ya[z]=600+(z*90);
x[z]=int(random(width-50));
y[z]=610+(z*90);
end=y[z];
} 

}

void draw(){


  if(start==false){
  //START SCREEN
  background(255);
    textSize(20);
  fill(250,0,180);
  
  text("avoid lines to progress",40,50);
  text("if a line hits the top, you get points",40,70);
  text("move mouse to top of screen, then",40,90);
  text("right click to start",40,110);
  }else if (gameover==true){
 //GAME OVER FREEZE
 
     textSize(20);
  fill(250,0,180);
  text("Game Over. Final score: "+score,0,30);
  text("Click to play again",0,50);
  }
  else{
 //ACTUAL GAME
  noStroke();
  background(255);
 
for(int i=0;i<10;i++){
//LEFT SIDE COLLISION
if(mouseX>=0 && mouseX<=x[i] && mouseY>=ya[i] && mouseY<=y[i]){
 //LEFT SIDE COLLISION
  fill(255,0,0);
gameover=true;
}
else if(mouseX>=x[i]+gap && mouseX<=width && mouseY>=ya[i] && mouseY<=y[i]){
 //RIGHT SIDE
  fill(255,0,0);
  gameover=true;
} else 
//DRAW ALL THOSE PLATFORMS
fill(0,0,0);
quad(0,ya[i],0,y[i],x[i],y[i],x[i],ya[i]);
quad(x[i]+gap,ya[i],x[i]+gap,y[i],width,y[i],width,ya[i]);
ya[i]-=5;
y[i]-=5;
if(y[i]<=0){
//WHEN A PLATFORM REACHES THE END, MAKE ANOTHER AND ADD SCORE
ya[i]=end+space;
x[i]=int(random(width-50));
y[i]=end+thick+space;
end=y[i];
set++;
score+=thick;
}

}
end-=5;
if(set==10){
//EVERY 10 PLATFORMS MAKE THEM THICKER AND GAP SMALLER
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
  //COLOR TRAIL BEHIND MOUSE
  strokeWeight(5);
    stroke(random(255),random(255),random(255));
 line(pmouseX,pmouseY,mouseX,mouseY);
}

void keyPressed(){
  
saveFrame("asdf.png");

  
}

void mousePressed(){
//START GAME ON RIGHT CLICK, RESTART GAME ON LEFT CLICK
 if (start==false && mouseButton==RIGHT)
start=true; 
 if(gameover==true && mouseButton==LEFT){
   score=0;
   thick=10;
   gap=80;
   space=90;
   set=0;
  for(int z=0;z<10;z++){

ya[z]=600+(z*90);
x[z]=int(random(width-50));
y[z]=600+(z*90)+thick;
end=y[z];
} 
gameover=false;
 } 
}
