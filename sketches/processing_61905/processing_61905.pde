



class crys{
  
//GLOBAL VARIABLES
  Vec3D loc = new Vec3D(0,0,0);
  Vec3D vel = new Vec3D(0,0,0);
  Vec3D acc = new Vec3D(5,0,0);
  Vec3D grv = new Vec3D(0,5,0);
  float h1 = 25;
  float h2 = 50;
  float w  = 30;
  float wa = 8;
  float ha = 5;
  Vec3D loc2 = new Vec3D(0,0,0);
  float glow = 30;

color  c1 = #FF218D, c2 = #501532, c3 = #FAFF00, c4 = #36FFAD;

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
  flock();
  
 
  }
void display(){
  
//CRYSTAL OUTSIDE

 if(move==30){
   glow-=1;
  c4++; 
fill(c4,glow);
stroke(0,glow);
 }else {
   //fill(50,50);
   glow=30;
   stroke(0,glow);
   fill(40,glow);
 }
quad(loc.x, loc.y-h1,    loc.x-(w/2), loc.y,    loc.x, loc.y+h2,    loc.x+(w/2), loc.y);
//VERTICAL LINES
if(move==30){
glow-=1; 

stroke(0,glow);
 }else{
   
stroke(0,glow);

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
  vel.limit(5);
  loc.addSelf(vel);
  acc = new Vec3D();
  }else if(move<=0){
    vel.addSelf(grv);
   
  
  }
  
  if(toggle ==1){
    vel.addSelf(grv);
    
  }
} 

void bounce(){
    if(loc.x+(w/2) > width){
      glow=200;
      move=0;
    vel.x *= -1;
  }
    if(loc.x-(w/2) < 0){
      glow=200;
      move=0;
    vel.x *= -2;
  }
    if(loc.y+h2 > height){
    glow = 200;
      move=0;
    vel.y *= -10;
  }
    if(loc.y-h1 < 0){
      glow=200;
      move=0;
    vel.y *= -1;
  }
}
 
 void gravity(){
   
   
   //vel.addSelf(grv);
   
   
}

void followLeader(){
  

 if(toggle==-1){ 
  
//if(move == 30){
  move=30;
  vel.addSelf(acc);
  vel.limit(5);
  loc.addSelf(vel);
  acc = new Vec3D();
  Vec3D target = new Vec3D(mouseX+random(-100,100), mouseY+random(-100,100),0);
  Vec3D dif = target.sub(loc);
  float dis = dif.magnitude();
  dif.normalize();
  dif.scaleSelf(dis/random(500,600));
  acc.addSelf(dif);
}else if(toggle ==1){
  
  //move++;//makes them pop up. 
  
 vel.addSelf(grv);
  vel.limit(5);
  loc.addSelf(vel);
  acc = new Vec3D();
  
    
  
}
  
 } 
 
 
 
 
 void flock(){
 
   
  seperate(50);
  
  //if(toggle == 1){
  //cohesion(10);
    
  
 
 } 
 
  


void seperate(float magnitude){
  
 
 
  Vec3D steer = new Vec3D ();
  int count = 0;
  

  
  for(int i = 0; i < crysColl.size(); i++){
    

    crys other = (crys) crysColl.get(i);

    float dis = loc.distanceTo(other.loc);
    if(dis>0 && dis<200){
      
      Vec3D diff = loc.sub(other.loc);
      diff.normalizeTo(1.0/dis);
      steer.addSelf(diff);
      count++; 
     
    }
    
  }
  
     if(count>0){
       
       steer.scaleSelf(1.0/count); 
     }
    
  steer.scaleSelf(magnitude);
  acc.addSelf(steer);
  
  
   
  
  
}
void cohesion(float magnitude){
  
 
  Vec3D sum = new Vec3D ();
  int count = 0;
 
  for(int i = 0; i < crysColl.size(); i++){
    

    crys other = (crys) crysColl.get(i);
    
    float dis = loc.distanceTo(other.loc);
  
  if(dis>0 && dis<60){
  
  sum.addSelf(other.loc);
  count++;
  
    }
    
  }
  
if(count>0){
  
  sum.scaleSelf(1.0/count);
}

Vec3D steer = sum.sub(loc);
steer.scaleSelf(magnitude);

acc.addSelf(steer);



}




}





