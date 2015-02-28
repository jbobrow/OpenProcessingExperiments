
float x = 400;
float y = 300;
float grav = 5;
float xdir = 1;
float ydir = 1;
float xspeed =4;
int score = 0;
int level = 1;
float s1 = 20;
float s2 = 20;
void setup(){
  size(500,500);
}
void draw(){
  background(0);
 if(level != 4){
  x += (xspeed *xdir);
  y += (grav * ydir);
  if(mouseX > x - 10 && mouseX < x + 10 && mouseY > y -10 && mouseY < y + 10 && mousePressed == true){
    score ++;
   
 if(level == 2){
      x = random(500);
      y = random(500);
     } 
  
   }

   if( level != 1 && level!= 2){
    if(y> 450){
     grav *= -1;
   }else{
     grav = grav - -0.4;
   }
   }
if(x > 500 - s1 || x < 0 + s1){
  xdir *= -1;
}
if (level == 1){   

if(y > 500 - s2 || y < 0 + s2){
  ydir *= -1;
}
}
if(score > 29 && score < 59){
  level = 2;
xspeed = 0;
grav = 0;
}
if(score>59 && score < 89){
  level = 3;
xspeed = 5;
ydir = 1;
}
if(score > 89){
  level = 4;
}
  
ellipse(x,y,s1,s2);
textSize(50);
text("score:",50,50);
text(score,200,50);
text(level,50,450);

 }
if(level == 4){
  text("YOU WIN!",200,200);
}
}
