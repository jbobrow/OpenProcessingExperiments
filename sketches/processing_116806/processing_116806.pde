
//rumskib
PImage rumskib;
float rumskibStartX = 585;
float rumskibStartY = 650;
float rumskibFart = 5;
//bombe
float bombeX = random(5,995);
float bombeY = random(-1000,-5);
float bombeX1 = random(5,995);
float bombeY1 = random(-1000,-5);
float bombeX2 = random(5,995);
float bombeY2 = random(-1000,-5);
float bombeX3 = random(5,995);
float bombeY3 = random(-1000,-5);
float bombeX4 = random(5,995);
float bombeY4 = random(-1000,-5);
float bombeX5 = random(5,995);
float bombeY5 = random(-1000,-5);
float bombeX6 = random(5,995);
float bombeY6 = random(-1000,-5);
float bombeX7 = random(5,995);
float bombeY7 = random(-1000,-5);
float bombeX8 = random(5,995);
float bombeY8 = random(-1000,-5);
float bombeHastighed = 10;

void setup()
{
  size(1000,700);
  rumskib = loadImage("rumskib.jpg");
  
}

void draw()
{
  background(255,255,255);
  //overflade (jord)
  fill(0,255,0);
  rect(0,680,1000,20);
  
  //rumskib
  imageMode(CENTER);
  image(rumskib,rumskibStartX,rumskibStartY,30,45);
  
  //rumskib der flytter sig
   if (keyPressed) {
    if (keyCode == LEFT || key == LEFT) {
      rumskibStartX = rumskibStartX-rumskibFart;
    }
  }
  if (keyPressed) {
    if (keyCode == RIGHT || key == RIGHT) {
      rumskibStartX = rumskibStartX+rumskibFart;
    }
  }
  if(rumskibStartX<=-15)
  {
  rumskibStartX=999;
  }
  if(rumskibStartX>=1000)
  {
  rumskibStartX=-14;
  }
 //tilfældige bomber
 fill(0,0,0);
   ellipseMode(CENTER);
   ellipse(bombeX,bombeY,5,5);
   ellipse(bombeX1,bombeY1,5,5);
   ellipse(bombeX2,bombeY2,5,5);
   ellipse(bombeX3,bombeY3,5,5);
   ellipse(bombeX4,bombeY4,5,5);
   ellipse(bombeX5,bombeY5,5,5);
   ellipse(bombeX6,bombeY6,5,5);
   ellipse(bombeX7,bombeY7,5,5);
   ellipse(bombeX8,bombeY8,5,5);
   bombeY = bombeY+random(2,7);
   bombeY1 = bombeY1+random(2,7);
   bombeY2 = bombeY2+random(2,7);
   bombeY3 = bombeY3+random(2,7);
   bombeY4 = bombeY4+random(2,7);
   bombeY5 = bombeY5+random(2,7);
   bombeY6 = bombeY6+random(2,7);
   bombeY7 = bombeY7+random(2,7);
   bombeY8 = bombeY8+random(2,7);
   
   
 if(bombeY>=1190)
 {
   bombeX=random(5,995);
   bombeY=random(-1000,-5);
 }
  if(bombeY1>=1190)
 {
   bombeX1=random(5,995);
   bombeY1=random(-1000,-5);
 }
  if(bombeY2>=1190)
 {
   bombeX2=random(5,1195);
   bombeY2=random(-1000,-5);
 }
  if(bombeY3>=1190)
 {
   bombeX3=random(5,995);
   bombeY3=random(-1000,-5);
 }
  if(bombeY4>=1190)
 {
   bombeX4=random(5,995);
   bombeY4=random(-1000,-5);
 }
  if(bombeY5>=1190)
 {
   bombeX5=random(5,995);
   bombeY5=random(-1000,-5);
 }
  if(bombeY6>=1190)
 {
   bombeX6=random(5,995);
   bombeY6=random(-1000,-5);
 }
  if(bombeY7>=1190)
 {
   bombeX7=random(5,995);
   bombeY7=random(-1000,-5);
 }
  if(bombeY8>=1190)
 {
   bombeX8=random(5,995);
   bombeY8=random(-1000,-5);
 }
 
 
}





