
float vy,vx,x,y,frictiony,frictionx,gravity,random,q,a;
int mode = 0;
PImage play;
PImage win;



 
 
void setup(){
  size(800,600);
  background(255);
  vy = 0;
  vx = 2;
  x = 10;
  y = 200;
  frictiony = -.6;
  frictionx = 1;
  gravity=.04;
  a = random(width);
  q = random(height);
  play = loadImage("play.jpg");
  win = loadImage("win.jpg");
 smooth();
}

void draw(){
if(mode == 0){
  startScreen();
} else if(mode == 1){
 fun(); 
if(mode == 2){
  winScreen();
 }
} 
}





void mouseReleased(){
    vy -= 1;
}

void startScreen(){
image(play,100,100); 
  if(mouseX>0 && mouseY > 0){
   fun();
  }
}




void fun(){
  background(255);
    vy += gravity;
  vx *= frictionx;
  x += vx;
  y += vy;

  
  if (y > height){
    y = height;
    vy *= frictiony;
  }
  noStroke();
  fill(y,20,x,70);
  ellipse(x,y,10,10);
  
  if(x>width){
    x = 0; }
  
  fill(20,y,x,20);
  ellipse(a,q,190,190);
  
  fill(y,145,145,20);
  ellipse(30,a,150,150);
  
    
  fill(x,y,200,20);
  ellipse(300, q*5, 250,250);
  
   fill(y,x,7,70);
  ellipse(300,q,310,310);
  
   fill(x,y,200,20);
  ellipse(200, a/2, 250,250);
  
   fill(y,x,7,70);
  ellipse(300,a*6,310,310);
  
  fill(20,y,x,20);
  ellipse(a,150,100,100);
  
  fill(y,145,145,20);
  ellipse(q,200,150,150);
  
   fill(0);
  ellipse(720,320,60,60);
  
  fill(0);
  rect(700,300,40,40);
  
  if(x > 700 && x < 740 && y>300 && y<340){
    winScreen();
     }
  
}

void winScreen(){
background (255);
image(win,100,100);



}

