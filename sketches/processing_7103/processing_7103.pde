
float x,y,xt,yt,xr,yr,delta,lambda;
PFont fontA;

void setup()
{
  size(400,400);
  smooth();
  fontA = loadFont("CourierNew36.vlw");
  textFont(fontA, 11);
  delta=0;                         //Rotate angle
  xt=width/2;                      //X translate
  yt=height/2;                     //Y translate 
  x=-35;                           //X of followning object in the Matrix 
  y=0;                             //Y of followning object in the Matrix 
  
}

void draw()
{
  background(0);
  fill(255);
  textFont(fontA, 14);
  text("Following a translate/rotate objet ",15,20);
  text("in Standard X,Y coordonate",15,40);
  text("translate("+xt+","+yt+");",15,60);
  text("rotate("+delta+");",15,80);
  text("in Matrix x: "+x+" | y: "+y,15,100); 
  pushMatrix();
  translate(xt,yt);
  rotate(delta);
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect(0,0,40,40);
  rect(x,y,10,10);
  popMatrix();
  
  /*
  *Calcule of distance beetwen translate origine and following object coordonate
  *and  calcule of angle
  */
  
  float dis = dist(0,0,x,y);
  if(y>=0)  lambda= acos(x/dis)+PI;
  else lambda= -acos(x/dis)+PI;
  
  /*
  *Calcule of Standard coordonate 
  */
  
  
  xr= xt+dis*cos(delta+lambda+PI);
  yr= yt+dis*cos(delta+lambda+HALF_PI);
  
  fill(255,0,0);
  rect(xr,yr,8,8);
 
 text("X: "+(xr),15,height-40);
 text("Y: "+(yr),15,height-20);
  
  
  
}


void keyPressed()
{
  if(keyCode==LEFT) delta -= 0.1;
  if(keyCode==RIGHT) delta += 0.1;
   if(keyCode==UP) y += 1;
  if(keyCode==DOWN) y -= 1;
  if(key=='a') x += 1;
  if(key=='z') x -= 1;
  
}

