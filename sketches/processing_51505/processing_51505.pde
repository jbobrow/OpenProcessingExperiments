
Particle[] particle;
Entry camPos;
Entry lookat;
/******************************************************/
void setup(){
  frameRate(30);
  size(900,600,P3D);
  background(0);
  particle=new Particle[5];
  for(int i=0;i<particle.length;i++){
    particle[i]= new Particle(i);
  }
  camPos = new Entry(0,0,0);
  lookat = new Entry(0,0,0);
  cam();
}
/******************************************************/
void draw(){
  background(0);
  
  for(int i=0;i<particle.length;i++){
    particle[i].update();
    particle[i].display();
  }
  cam();
}
/******************************************************/
class Particle{
  float rad,offset,jitter;
  float alpha,beta,speedA,speedB;
  int lifeSpan;
  Entry pos;
  Entry base;
  ArrayList part;
  int id;
  /******************************************************/
  Particle(int _id){
    id=_id;
    offset=random(300,300);
    jitter=random(20);
    rad=5;
    beta=random(0,PI);
    speedA=.051;
    speedB=random(.01,.06);
    lifeSpan = int(random(5,10));
    pos=new Entry(0,0,0);
    base = new Entry(width/2,height*.45,-200);
    part = new ArrayList(); 
    update(); //get start pos
  }
  /******************************************************/
  void update(){  
    if(part.size()>lifeSpan){
      part.remove(0);
    }
    
    alpha+=speedA;
    beta+=speedB;
    
    pos.x=sin(alpha)*offset+sin(1.5*beta)*jitter;
    pos.y=base.y+sin(3.5*beta)*jitter;
    pos.z=cos(alpha)*offset+cos(2.5*beta)*jitter; 
    if(frameCount%4 == 1){
      part.add(new Entry(pos.x,pos.y,pos.z));
    }
    for(int i=0;i<part.size()-1;i++){
      Entry bubu = (Entry) part.get(i);
      bubu.x+=bubu.jitter;
      bubu.y+=bubu.jitter;
      bubu.z+=bubu.jitter;
    }
  }
  /******************************************************/
  void display(){
    pushMatrix();
      fill(100,200,0);
      noStroke();
      translate(base.x,base.y,base.z);
      translate(pos.x,pos.y,pos.z);
      sphere(rad);
    popMatrix();
    
    for(int i=1;i<part.size();i++){
      Entry bubu = (Entry) part.get(i);
      Entry bobo = (Entry) part.get(i-1);
      
      pushMatrix();
        translate(base.x,base.y,base.z);
        stroke(100,200,0);
        line(bubu.x,bubu.y,bubu.z,bobo.x,bobo.y,bobo.z);
        translate(bubu.x,bubu.y,bubu.z);
        fill(100,100,0);
        noStroke();
        sphere(3);
      popMatrix();

    }
   
  }
}
/******************************************************/
class Entry{
  float x,y,z,jitter,pos;
  Entry(float _x,float _y,float _z){
  x=_x;
  y=_y;
  z=_z;  
  jitter=random(-.95,.95);
  pos=0;
  }
}
/******************************************************/
void cam(){
  camPos.x=particle[0].pos.x+particle[0].base.x+sin(radians(camPos.pos))*200;
  camPos.y=particle[0].pos.y+particle[0].base.y-100-sin(radians(camPos.pos/2))*100;
  camPos.z=particle[0].pos.z+particle[0].base.z+cos(radians(camPos.pos))*200; 
  
  camPos.pos+=1;
  
  lookat.x=particle[0].base.x+particle[0].pos.x;
  lookat.y=particle[0].base.y+particle[0].pos.y;
  lookat.z=particle[0].base.z+particle[0].pos.z; 

  camera(  camPos.x,camPos.y,camPos.z, 
            lookat.x,lookat.y,lookat.z, 
            0, 1, 0);
 
  stroke(30,30,50);
  strokeWeight(2);

  for(int i=-2000;i<2000;i+=50){
    line(-2000,height,i,2000,height,i);
    line(i,height,-2000,i,height,2000);
  } 
  strokeWeight(1);
//  directionalLight(255, 255, 255, 1, 1, 0);
}



