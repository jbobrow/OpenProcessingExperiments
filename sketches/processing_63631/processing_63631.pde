





class crys{
  
  
  //GLOBAL VARIABLES
  Vec3D loc = new Vec3D(0,0,0);
  Vec3D vel = new Vec3D(random(-2,2),random(-2,2),0);
  Vec3D acc = new Vec3D(0.01,0,0);
  Vec3D grv = new Vec3D(0,-0.1,0);
  float h1 = 25;
  float h2 = 50;
  float w  = 30;
  float wa = 8;
  float ha = 5;
  
  float glow = 200;

color  c1 = #FF218D, c2 = #A54876;


//CONSTRUCTOR
  crys(Vec3D _loc){
    loc = _loc;
  }
  
  
  //FUNCTIONS
void run(){
  flock();
  display();
  move();
  bounce();
  interaction();
  gravity();
  
  
 
  }
  
void gravity(){
   
   
   vel.addSelf(grv);
   
   
}

void interaction(){
  
  // if(toggle==-1){ 
  

  
  Vec3D target = new Vec3D(pmouseX,pmouseY,300);
  Vec3D dif = target.sub(loc);
  float dis = dif.magnitude();
  dif.normalize();
  dif.scaleSelf(dis/10);
  acc.addSelf(dif);
 
  
}
  
void bounce(){
  
    if(loc.x+(w/2) > width){
      glow=0;
    vel.x *= -1;
  }
    if(loc.x-(w/2) < 0){
      glow=0;
    vel.x *= -1;
  }
    if(loc.y+h2 > height){
      glow=0;
    vel.y *= -1;
  }
    if(loc.y-h1 < 0){
      glow=0;
    vel.y *= -1;
  }


}
  
void move(){
  

   vel.addSelf(acc);
  vel.limit(15);
  loc.addSelf(vel);
  acc = new Vec3D();
  
  
  
}
 
void display(){
   

// crystal shape 1  
//quad(loc.x, loc.y-h1,    loc.x-(w/2), loc.y,    loc.x, loc.y+h2,    loc.x+(w/2), loc.y);

//line(loc.x, loc.y-h1, loc.z,loc.x+wa, loc.y,loc.z-d1);
pushMatrix();
 float theta = atan2(vel.y, vel.x);
 
 translate(loc.x, loc.y);
 rotate(theta+PI/2);
 translate(-loc.x, -loc.y); 
 
 if(move==30){
   glow+=0.2; 
fill(c1);
stroke(c2);
 }else {
   //fill(50,50);
   glow=30;
   stroke(60);
   fill(150);
 }

// TOP VERTICAL LINES

line(loc.x, loc.y-h1, loc.z, loc.x-wa, loc.y,loc.z+d1);
line(loc.x, loc.y-h1, loc.z, loc.x-wa, loc.y,loc.z-d1);
line(loc.x, loc.y-h1,loc.z, loc.x+wa, loc.y,loc.z+d1);
line(loc.x, loc.y-h1,loc.z, loc.x+wa, loc.y,loc.z-d1);
line(loc.x, loc.y-h1, loc.z, loc.x-(w/2), loc.y,loc.z);
line(loc.x, loc.y-h1, loc.z, loc.x+(w/2), loc.y,loc.z);
//line(loc.x, loc.y-h1, loc.x-wa, loc.y);
//line(loc.x, loc.y-h1, loc.x+wa, loc.y);

// BOTTOM VERTICAL LINES

line(loc.x, loc.y+h2, loc.z, loc.x-wa, loc.y, loc.z+d1);
line(loc.x, loc.y+h2, loc.z, loc.x-wa, loc.y, loc.z-d1);
line(loc.x, loc.y+h2,loc.z, loc.x+wa, loc.y,loc.z+d1);
line(loc.x, loc.y+h2,loc.z, loc.x+wa, loc.y,loc.z-d1);
line(loc.x, loc.y+h2, loc.z, loc.x-(w/2), loc.y,loc.z);
line(loc.x, loc.y+h2, loc.z, loc.x+(w/2), loc.y,loc.z);
//line(loc.x, loc.y+h2, loc.x+wa, loc.y);
//line(loc.x, loc.y+h2, loc.x-wa, loc.y);

//HORIZONTAL LINES

line(loc.x+(w/2), loc.y,loc.z,  loc.x+wa, loc.y,loc.z+d1);
line(loc.x+(w/2), loc.y,loc.z,  loc.x+wa, loc.y,loc.z-d1);
line(loc.x-(w/2), loc.y,loc.z,  loc.x-wa, loc.y,loc.z+d1);
line(loc.x-(w/2), loc.y,loc.z,  loc.x-wa, loc.y,loc.z-d1);
line(loc.x+wa, loc.y,loc.z+d1,loc.x-wa, loc.y,loc.z+d1);
line(loc.x+wa, loc.y,loc.z-d1,loc.x-wa, loc.y,loc.z-d1);
//line(loc.x-wa, loc.y, loc.x+wa, loc.y);
//line(loc.x-wa, loc.y, loc.x-(w/2), loc.y);
//line(loc.x+wa, loc.y, loc.x+(w/2), loc.y);
   
popMatrix();  
   
 }
 
  void flock(){
 
   
  seperate(1000);
  //cohesion(0.001);
    
  
  
 } 
 
  


void seperate(float magnitude){
  
 Vec3D steer2 = new Vec3D (pmouseX,pmouseY,0);
 
  Vec3D steer = new Vec3D ();
  int count = 0;
  

  
  for(int i = 0; i < crysColl.size(); i++){
    

    crys other = (crys) crysColl.get(i);

    float dis = loc.distanceTo(other.loc);
    if(dis>0 && dis<50){
      
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


