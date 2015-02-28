
PShape K, B;

color black =color(0,0,0);

int x=20;
int y=190;
int oX=250;
int oY=150;



int orbs=0;

void setup(){
  size(500,300);
 K=loadShape("Stage.svg");
 B=loadShape("Char.svg");
  smooth();
}

void draw(){
  background(255);
  shapeMode(CORNER);
  shape(K,0,0);
  collisions(x,y);
  orb();
}

void collisions(int cx, int cy){
  
  if(keyPressed)
  {
    if(key=='w')
    if(get(cx+20, cy-20)!=black && get(cx-20, cy-20)!= black)
    {
      y--;
    }
    
   if(key=='a')
   if(get(cx-20, cy-20)!=black && get(cx-20, cy-20)!= black)
    {
      x--;
    }
    
   if(key=='d')
   if(get(cx+20, cy-20)!=black && get(cx+20, cy+20)!= black)
    {
      x++;
    }
    
   if(key=='s')
   if(get(cx-20, cy+20)!=black && get(cx+20, cy+20)!= black)
    {
      y++;
    }
    
  } 
    
   
    shapeMode(CENTER);
    shape(B,x,y,50,50);
    
}

void orb()
{
  fill(255);
  text("Orbs =" + orbs, 10, 30);
  float oDist = dist(x,y,oX,oY);
  if(oDist<20)
    orbs =1;
   
   else if(oDist>20&&orbs !=1)
   {
     rectMode(CENTER);
     fill(random(255), random(255), random(255));
     rect(oX, oY, 30, 30);
   }
}


