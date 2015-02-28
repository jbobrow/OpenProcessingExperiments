



class crys{
  
//GLOBAL VARIABLES
  Vec3D loc = new Vec3D(0,0,0);
  Vec3D vel = new Vec3D(0,0,0);
  Vec3D acc = new Vec3D(1,0,0);
  Vec3D grv = new Vec3D(0,0.09,0);
  float h1 = 25;
  float h2 = 50;
  float w  = 30;
  float wa = 8;
  float ha = 5;
  Vec3D loc2 = new Vec3D(0,0,0);
  float glow = 30;

color  c1 = #FF218D, c2 = #501532;

//BLEND, ADD, SUBTRACT, DARKEST, LIGHTEST, DIFFERENCE, EXCLUSION, MULTIPLY, SCREEN, OVERLAY, HARD_LIGHT, SOFT_LIGHT, DODGE, or BURN
  
//CONSTRUCTOR
  crys(Vec3D _loc){
    loc = _loc;
  }
  
  
//FUNCTIONS
void run(){
  display();
  move();
  bounce();
  gravity();
  followLeader();
 
  }
void display(){
  
//CRYSTAL OUTSIDE

 if(move<30){
   glow+=0.2; 
fill(c1,glow);
stroke(c2,glow);
 }else {
   //fill(50,50);
   glow=30;
   stroke(0,glow);
   fill(150,glow);
 }
quad(loc.x, loc.y-h1,    loc.x-(w/2), loc.y,    loc.x, loc.y+h2,    loc.x+(w/2), loc.y);
//VERTICAL LINES
if(move<30){
glow+=0.2; 

stroke(c2,glow);
 }else{
   
stroke(60,glow);

 }

line(loc.x, loc.y-h1, loc.x-wa, loc.y+ha);
line(loc.x, loc.y-h1, loc.x+wa, loc.y+ha);
line(loc.x, loc.y+h2, loc.x-wa, loc.y+ha);
line(loc.x, loc.y+h2, loc.x+wa, loc.y+ha);
//HORIZONTAL LINES
line(loc.x-wa, loc.y+ha, loc.x+wa, loc.y+ha);
line(loc.x-wa, loc.y+ha, loc.x-(w/2), loc.y);
line(loc.x+wa, loc.y+ha, loc.x+(w/2), loc.y);


  }

void move(){
  
  if(move >=30){
   vel.addSelf(acc);
  vel.limit(15);
  loc.addSelf(vel);
  acc = new Vec3D();
  }else if(move<=0){
    vel.addSelf(grv);
  
  }
} 

void bounce(){
    if(loc.x+(w/2) > width){
      move=30;
    vel.x *= -1;
  }
    if(loc.x-(w/2) < 0){
      move=30;
    vel.x *= -2;
  }
    if(loc.y+h2 > height){
      move=30;
    vel.y *= -10;
  }
    if(loc.y-h1 < 0){
      move=30;
    vel.y *= -1;
  }
}
 
 void gravity(){
   
   
   vel.addSelf(grv);
   
   
}

void followLeader(){
  

 if(toggle==-1){ 
  
//if(move == 30){
  move=30;
  
  Vec3D target = new Vec3D(mouseX+random(-100,100), mouseY+random(-100,100),0);
  Vec3D dif = target.sub(loc);
  float dis = dif.magnitude();
  dif.normalize();
  dif.scaleSelf(dis*10);
  acc.addSelf(dif);
}else{
  
 vel.addSelf(acc);
  vel.limit(15);
  loc.addSelf(vel);
  acc = new Vec3D();
  
}
  
  
  
  
}

}



