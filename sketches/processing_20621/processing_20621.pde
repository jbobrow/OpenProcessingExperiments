
int TeteX = 0;
int TeteY = 100;
int TailleTete = 100;
int CorpsX = 0;
int CorpsY = 250;
float easing = 0.1;
float easing2 = 0.01;
int LargeurCorps = 80;
int HauteurCorps = 100;
int CentreRoue1 = 0;
color c;


void setup ()
{
  size(720,480);
  background(255);
  smooth();
  c = color(0);
  int CentreRoue1 = LargeurCorps;

  
}
void draw()
{
  background(255);
  strokeWeight(20);
  //line(0,380,720,380);
  float weight = dist(mouseX,mouseY,pmouseX,pmouseY)/2;
  float targetX = mouseX;
  TeteX += (targetX - TeteX)*easing;
  float targetY = mouseY;
  TeteY += (targetY - TeteY)*easing;
  CorpsX += (targetX - CorpsX )*easing2;
  CentreRoue1 += (targetX - CentreRoue1 )*easing2; 
  //COU
  strokeWeight(2);
  line(TeteX,TeteY,CorpsX+40,CorpsY);
  line(TeteX+10,TeteY,CorpsX+50,CorpsY);
  line(TeteX-10,TeteY,CorpsX+30,CorpsY);
  //CORPS
  strokeWeight(2);
  fill(80);
  ellipse(CentreRoue1 ,HauteurCorps+250,60,60);
  ellipse(CentreRoue1 +80 ,HauteurCorps+250,60,60);
  fill(c);
  rect(CorpsX,CorpsY,LargeurCorps,HauteurCorps);
  fill(255);
 
     //ANTENNES
  strokeWeight(2);
  fill(255);
  line(TeteX,TeteY,TeteX-50,TeteY-75);
  ellipse(TeteX-50,TeteY-75,5,5);
  line(TeteX,TeteY,TeteX+20,TeteY-90);
  ellipse(TeteX+20,TeteY-90,5,5);
  //TETE
  fill(c);
  ellipse(TeteX,TeteY,TailleTete,TailleTete);
  strokeWeight(weight);
  fill(255);
  ellipse(TeteX+15,TeteY-10,20,20);
  fill(c);
  ellipse(TeteX+15,TeteY-10,2,2);
  fill(255);
  ellipse(TeteX-15,TeteY-10,20,20);
  fill(c);
  ellipse(TeteX-15,TeteY-10,2,2);
  strokeWeight(2);
  arc(TeteX,TeteY+20,30,30,0,PI);
  if(mousePressed)
  c = color(255,0,0);
  else
  c = color(0);
  if(keyPressed)  
  if(key == 'q')
  HauteurCorps  = 150;
   if(keyPressed)  
  if(key == 'w')
  HauteurCorps  = 100;
  else
  HauteurCorps = 200;
 
  
 
  
  
 
}
