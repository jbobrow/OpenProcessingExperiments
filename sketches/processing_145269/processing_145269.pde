
//Sergi Sillaurren
//paràmetres
float posX, posY, velX, velY;

void setup(){
size(500,500);
//pos inicial i velocitat
posX = width/2;
posY = height/2;
velX = random(3,6);
velY = random(3,6);
//XXX
}

void draw(){
background(0);
  //actualitzem posicions
  posX = posX+velX;
  posY = posY+velY;
stroke(150);
fill(150);
ellipse(posX-33,posY-50,20,45);
ellipse(posX+33,posY-50,20,45);
stroke(255);
fill(255);
ellipse(posX-30,posY-45,20,40);
ellipse(posX+30,posY-45,20,40);
ellipse(posX,posY,100,100);
stroke(100+posY);
fill(100+posY);
ellipse(posX,posY+20,70,50);
stroke(0+posY);
fill(0+posY);
ellipse(posX,posY+10,20,10);
noFill();
strokeWeight(1);
arc(posX,posY+25,20,20,0, PI,OPEN);
strokeWeight(2);
arc(posX-20,posY-20,15,25,PI, TWO_PI,OPEN);
arc(posX+20,posY-20,15,25,PI, TWO_PI,OPEN);

 //limits en X
if ((posX<55)||(posX>width-55))
{velX = -velX;} 
  //limits Y
if((posY<75)||(posY>height-50))
{velY = -velY;}}

void mousePressed(){
  //començar al centre
  posX=width/2;
  posY=height/2;
}


