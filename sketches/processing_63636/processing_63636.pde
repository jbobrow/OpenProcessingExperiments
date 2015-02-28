





class crys{
  
  
  //GLOBAL VARIABLES
  Vec3D loc = new Vec3D(0,0,0);
  Vec3D vel = new Vec3D(random(-2,2),random(-2,2),0);
  Vec3D acc = new Vec3D(0.01,0,0);
  Vec3D grv = new Vec3D(0,0.1,0);
  Vec3D target = new Vec3D(mouseX,mouseY,300);
  Vec3D dif = target.sub(loc);
  float dis = dif.magnitude();
  float h1 = 25;
  float h2 = 50;
  float w  = 30;
  float wa = 8;
  float ha = 5;
  
  float glow = 30;
  float glow2 = 20;
   
   
color  c1 = #FF218D, c2 = #A54876, crim = #D83280;
color darkBlue = #65579E, purps = #8C5C9B, peach = #FED8C6;
color darkblue = #4E7494;
color db = #25333A;
color brown = #B4AE99;
color blu = #57B3DB;
color pur = #E659FF;
color dpur = #9301AC;
color p = #E489FD, p2 = #B667D3;



//CONSTRUCTOR
  crys(Vec3D _loc){
    loc = _loc;
  }
  
  
  //FUNCTIONS
void run(){
  flock();
  display();
  move();
  //bounce();
  interaction();
 gravity();
  //flock();
  
 
  }
  
void gravity(){
   
   
   vel.addSelf(grv);
   
   
}

void interaction(){
  
if(move==30){  
  
  Vec3D target = new Vec3D(mouseX,mouseY,300);
  Vec3D dif = target.sub(loc);
  float dis = dif.magnitude();
  dif.normalize();
  dif.scaleSelf(1000/dis);
  acc.addSelf(dif);
}
  /*
 }else{
  
 vel.addSelf(acc);
  vel.limit(15);
  loc.addSelf(vel);
  acc = new Vec3D();
  
}
  */
  
  
}
  
void bounce(){
  
    //if(loc.x+(w/2) > screen.width){
      glow=0;
    vel.x *= -1;
  //}
    //if(loc.x-(w/2) < 0){
      glow=0;
    vel.x *= -1;
  //}
    if(loc.y+h2 >  screen.height){
      glow=0;
    vel.y = 0;
    vel.x = 0;
    
  }
    //if(loc.y-h1 < 0){
     // glow=0;
    //vel.y *= -1;
  //}


}
  
void move(){
  
  if(move >29){
  vel.addSelf(acc);
  vel.limit(20);
  loc.addSelf(vel);
  acc = new Vec3D();
  }else if(move<29){
    vel.addSelf(grv);
    loc.addSelf(vel);
  acc = new Vec3D();
  
  }
    
}
 
void display(){
  
 
if(move==30){
  glow++;
  stroke(p,glow);
  if(glow>=100){
    glow=100;
  }
 
  
}else if(move<30){
stroke(p2,glow2);
 if(glow<=30){
    glow=30;
  }
glow-=2;
 
}


  
// crystal shape 1  
//quad(loc.x, loc.y-h1,    loc.x-(w/2), loc.y,    loc.x, loc.y+h2,    loc.x+(w/2), loc.y);

//line(loc.x, loc.y-h1, loc.z,loc.x+wa, loc.y,loc.z-d1);
pushMatrix();
 float theta = atan2(vel.y, vel.x);
 
 translate(loc.x, loc.y);
 rotate(theta+PI/2);
 translate(-loc.x, -loc.y); 

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
 
   
  seperate(100);
  cohesion(0.0001);
  
  if(loc.y+h2 >  screen.height){
    seperate(0);
    cohesion(0);
     vel.y = 0;
    vel.x = 0;
    grv.y = 0;
  }
  if(move<29){
    seperate(10000);
  }
  
  if(move==29){
    cohesion(1);
    
  }
    
  
  
 } 
 
  


void seperate(float magnitude){
  
 Vec3D steer2 = new Vec3D (mouseX,mouseY,0);
 
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

