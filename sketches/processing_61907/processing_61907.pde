
import toxi.geom.*;
//import processing.opengl.*;

//DECLARE
ArrayList crysColl;
crysLeader leader;
float move=0;
Vec3D acc = new Vec3D(1,0,0);
int toggle = 1;



void setup(){
  size(600,600);//,OPENGL);
  smooth();
  //background(0);
//INITIALIZE
crysColl = new ArrayList();
    for(int i=0;i<30;i++){
      Vec3D pos = new Vec3D(random(width),random(565,600),0);
      crys crystalField = new crys(pos);
      crysColl.add(crystalField);
    }
Vec3D pos2 = new Vec3D(random(width),random(565,600),0);
leader = new crysLeader(pos2);    
   

    
}


void draw(){
  fill(0,80);
  rect(0,0,width,height);
  //background(0);
//CALL FUNCTIONALITY 
    for(int i=0;i<crysColl.size();i++){
      crys crystalField = (crys)crysColl.get(i);
      crystalField.run();
    }
//leader.run();
mouse();
println(toggle);
println(move);
  
}

void mouse(){ 
  if (move <= 0){
      noCursor();
   }
  if (move>0 && move<37){
      cursor(HAND);
   }
  if (move>36){
      cursor(HAND);
  }
   if(move<=36){
      move--;//move-1;
   }
} 

void mouseMoved() {
    move=30;
    
    
}  

void mousePressed(){// or mouseReleased
  
  if(toggle == 1){
  toggle = -1;
  }else if (toggle == -1){
   
   toggle = 1;
  }
  
}


