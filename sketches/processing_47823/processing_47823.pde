
import toxi.physics.*;
import toxi.physics.constraints.*;
import toxi.physics.behaviors.*;

import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.ugens.*;

import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;


//全局变量//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int branch = 3;
int numGrass =30;
float maxAngle = 55;
float minLen = 40;
float maxLen = 100;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
ArrayList path_s;
ArrayList path_e;
ArrayList path_t;
ArrayList path_s2;
ArrayList path_s2_2;
ArrayList path_e2;
ArrayList path_e2_2;
ArrayList path_t2;
ArrayList path_t2_2;
ArrayList path_k2;
ArrayList path_k2_2;
ArrayList path_s3;
ArrayList path_e3;
ArrayList path_t3;
ArrayList path_k3;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int m=20;
float j=0;
int numLevel;
int numLevel_;
Minim music;
AudioPlayer play;
AudioPlayer click;
AudioPlayer click2;
AudioPlayer click3;
AudioPlayer click4;
AudioPlayer click5;
PFont ziti;
PFont ziti2;
PImage b;
boolean a = true;
float c;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
VerletPhysics world;
int numFly=100;
AABB Bbox = new AABB(new Vec3D(0,-2000,0),2000);
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
int count = 0;
String life[];
int lifen;
float lifes;
int r=0;
int t1=0;
boolean offOn = false;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
String sx_[];
String sy_[];
String ex_[];
String ey_[];

ArrayList spt;
ArrayList ept;
Vec3D[] spt_;
Vec3D[] ept_;
//全局变量//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void setup(){
size(1280,720,P3D);
//smooth();



lifen=800;
lifes=lifen;

c=lifen;
numLevel=1;
while(c/3>1){
  c=c/3;
numLevel++;
}
//logo///////////////////////////////////////////////////////////////////////////////////////////////////
sx_ = loadStrings("data/sx.txt");
sy_ = loadStrings("data/sy.txt");
ex_ = loadStrings("data/ex.txt");
ey_ = loadStrings("data/ey.txt");
spt = new ArrayList();
ept = new ArrayList();
for(int i=0;i<sx_.length;i++){
spt.add(new Vec3D(Float.parseFloat(sx_[i]),Float.parseFloat(sy_[i]),0));
ept.add(new Vec3D(Float.parseFloat(ex_[i]),Float.parseFloat(ey_[i]),0));
}
spt_ =(Vec3D[])spt.toArray(new Vec3D[0]);
ept_ =(Vec3D[])ept.toArray(new Vec3D[0]);
//logo///////////////////////////////////////////////////////////////////////////////////////////////////

music = new Minim(this);
play =music.loadFile("BGM.mp3");
click =music.loadFile("click.wav");
click2 =music.loadFile("click2.wav");
click3 =music.loadFile("click3.wav");
click4 =music.loadFile("click4.wav");
click5 =music.loadFile("click5.wav");
play.loop();
ziti = loadFont("Calligraphic421BT-RomanB-24.vlw");
ziti2 = loadFont("Calligraphic421BT-RomanB-120.vlw");
b=loadImage("b.bmp");

path_s = new ArrayList();
path_e = new ArrayList();
path_t = new ArrayList();
path_s2 = new ArrayList();
path_s2_2 = new ArrayList();
path_e2 = new ArrayList();
path_e2_2 = new ArrayList();
path_t2 = new ArrayList();
path_t2_2 = new ArrayList();
path_k2 = new ArrayList();
path_k2_2 = new ArrayList();
path_s3 = new ArrayList();
path_e3 = new ArrayList();
path_t3 = new ArrayList();
path_k3 = new ArrayList();

growTree(new Vec3D(0,-50,0),new Vec3D(0,-10,0.1),numLevel);

for(int i=0;i<m;i++){
growGrass(i*30,3*(m-i)/m);

world = new VerletPhysics();
world.setDrag(0.001f);
world.setWorldBounds(Bbox);
}
}

void draw(){
  //background(b);
  background(255);

  noFill();
  translate(width/2,height/1.1,-500);
  rotateX(0.21);
  rotateY(frameCount*0.003);
  
  while(path_s2.size()>0){
    int j=int(random(path_s2.size()-1));
  path_s2_2.add(path_s2.get(j));
  path_s2.remove(j);
  path_e2_2.add(path_e2.get(j));
  path_e2.remove(j);
  path_t2_2.add(path_t2.get(j));
  path_t2.remove(j);
  path_k2_2.add(path_k2.get(j));
  path_k2.remove(j);
  }
  
  
  Vec3D[] s =(Vec3D[])path_s.toArray(new Vec3D[0]);
  Vec3D[] e =(Vec3D[])path_e.toArray(new Vec3D[0]);
  Vec3D[] t =(Vec3D[])path_t.toArray(new Vec3D[0]);
  Vec3D[] s2 =(Vec3D[])path_s2_2.toArray(new Vec3D[0]);
  Vec3D[] e2 =(Vec3D[])path_e2_2.toArray(new Vec3D[0]);
  Vec3D[] t2 =(Vec3D[])path_t2_2.toArray(new Vec3D[0]);
  Vec3D[] k2 =(Vec3D[])path_k2_2.toArray(new Vec3D[0]);
  Vec3D[] s3 =(Vec3D[])path_s3.toArray(new Vec3D[0]);
  Vec3D[] e3 =(Vec3D[])path_e3.toArray(new Vec3D[0]);
  Vec3D[] t3 =(Vec3D[])path_t3.toArray(new Vec3D[0]);
  Vec3D[] k3 =(Vec3D[])path_k3.toArray(new Vec3D[0]);
  
  
  for(int i=0;i<s.length;i++){
    strokeCap(ROUND);
    strokeWeight(t[i].x);
    stroke(0,255);
  line(s[i].x,s[i].y,s[i].z,e[i].x,e[i].y,e[i].z);
  }
  
     
     for(int i=0;i<s2.length;i++){
    strokeWeight(t2[i].x);
    
    stroke(100+t2[i].x*45,100+t2[i].x*10,0,200);
    if(i<lifen){
    stroke(100+t2[i].x*25,100+t2[i].x*35,0,200);
    
    }
  line(s2[i].x,s2[i].y,s2[i].z,e2[i].x+sin(radians(k2[i].x)+radians(frameCount*7))*15,e2[i].y+sin(radians(k2[i].y)+radians(frameCount*7))*5,e2[i].z);
  }
  
  for(int i=0;i<s3.length;i++){
    strokeWeight(t3[i].x/2);
    stroke(100+t3[i].x*20,100+t3[i].x*30,0,200);
  line(s3[i].x,s3[i].y,s3[i].z,e3[i].x+sin(radians(k3[i].x)+radians(frameCount*8))*10,e3[i].y,e3[i].z+cos(radians(k3[i].z)+radians(frameCount*8))*10);
  }
  
  strokeWeight(10);
    stroke(0,0,0,150);
  line(0,0,0,0,-50,0);

if(world.particles.size()<numFly){
addFly();
}
world.update();
 stroke(200,100,0);
 strokeWeight(10);
  for (VerletParticle p : world.particles) {
    line(p.x, p.y,p.z,p.x, p.y+10,p.z);
  }
  
  //logo///////////////////////////////////////////////////////////////////////////////////////////////////


for(int i=0;i<spt_.length;i++){
  stroke(200+30*sin(i+radians(frameCount*3)),55+30*sin(i+radians(frameCount*3)),0);
  strokeWeight(5+3*sin(i+radians(frameCount*3)));
  spt_[i].rotateAroundAxis(new Vec3D(0,1,0), -0.003);
  ept_[i].rotateAroundAxis(new Vec3D(0,1,0), -0.003);
line(spt_[i].x,-spt_[i].y,spt_[i].z,ept_[i].x,-ept_[i].y,ept_[i].z);
}
//logo///////////////////////////////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////////////////////////////////////  
String num = new String();
num=num.valueOf(lifen);
textMode(SCREEN);
textAlign(CENTER);
//fill(0,(cos(frameCount*0.003)*255-200)*5);
fill(0);
textFont(ziti,25+sin(radians(frameCount))*5);

String x =new String();
x=x.valueOf(count);
String y =new String();
y=y.valueOf(int(pow(3,numLevel)));
text("---------------------------------------------------------------------------------------------------------TREE      OF      LIFE                     YANHUI PRESENT--------------------------------------------------------------------------------------------------------\n\nlevel: "+numLevel+"     total leaves:  "+y+"      green leaves: "+num+"   add   "+"("+x+")"+"\nclick to re-create tree\nE/D/C:Increase by 1/10/100    Q/A/Z:Reduce by 1/10/100    Space:Update   M:Muisc On/Off",width/2,height-120);

if(offOn){
if(r>0){
fill(100,100,100,255*sin(radians(r)));
  if(t1>0){
fill(120,200,50,255*sin(radians(r)));
  }
  
textFont(ziti2,150-r/10);
String f = new String();
int g = int(lifes+0.5);
f=f.valueOf(g);
textLeading(100);
text(f+"\nlev."+numLevel,width/2+t1,height/2-100);
r-=1;
lifes+=(lifen-lifes)/5;
}
}

}


void growTree(Vec3D st,Vec3D dir,float depth){
  
dir.normalize();
if (depth<=0){
return;
}

for(int i=0;i<branch;i++){
float angle = random(maxAngle-depth*2);
float len = random(minLen,maxLen)*(pow(depth,0.5)*0.7);
if(depth==1){
len = random(20,30);
}
float r = len*sin(radians(angle));
Vec3D dir_=dir.scale(len*cos(radians(angle)));
Vec3D circleCenter = st.add(dir_);
Vec3D u=new Vec3D(dir.z,0,-dir.x);
Vec3D v=new Vec3D(u.x,u.y,u.z);
v.rotateAroundAxis(dir,radians(90));
float t = radians(random(360));

u.normalize();
v.normalize();

float moveX=r*(u.x*cos(t)+v.x*sin(t));
float moveY=r*(u.y*cos(t)+v.y*sin(t));
float moveZ=r*(u.z*cos(t)+v.z*sin(t));

float newX= circleCenter.x+moveX;
float newY= circleCenter.y+moveY;
float newZ= circleCenter.z+moveZ;
Vec3D end =new Vec3D(newX,newY,newZ);

Vec3D newDir= new Vec3D(newX-st.x,newY-st.y,newZ-st.z);

if(depth >1){
path_s.add(st);
path_e.add(end);
path_t.add(new Vec3D(pow(depth,1.5),0,0));
}


if(depth ==1){
path_s2.add(st);
path_e2.add(end);
path_t2.add(new Vec3D(random(1,4),0,0));
path_k2.add(new Vec3D(j+random(30),j+random(-90,90),0));
j++;
}

growTree(end,newDir,depth-1);
}
}

void growGrass(float ground,float maxt){
for(int i=0;i<numGrass;i++){
float Gx=random(-ground,ground);
float Gz=random(-ground,ground);
for(int j=0;j<random(20);j++){
  float xx=Gx+random(-5,5);
  float zz=Gz+random(-5,5);
path_s3.add(new Vec3D(xx,0,zz));
path_e3.add(new Vec3D(xx+random(-3,3),random(-random(0,maxt*50)),zz+random(-3,3)));
path_t3.add(new Vec3D(random(1,4),0,0));
path_k3.add(new Vec3D(random(360),0,random(360)));
}
}
}


void reCreate(){
click.play();
click.rewind();
path_s = new ArrayList();
path_e = new ArrayList();
path_t = new ArrayList();
path_s2 = new ArrayList();
path_e2 = new ArrayList();
path_t2 = new ArrayList();
path_k2 = new ArrayList();
path_s2_2 = new ArrayList();
path_e2_2 = new ArrayList();
path_t2_2 = new ArrayList();
path_k2_2 = new ArrayList();
path_s3 = new ArrayList();
path_e3 = new ArrayList();
path_t3 = new ArrayList();
path_k3 = new ArrayList();
growTree(new Vec3D(0,-50,0),new Vec3D(0,-10,0.1),numLevel);
for(int i=0;i<m;i++){
  ArrayList del = new ArrayList();
growGrass(i*30,3*(m-i)/m);
for(VerletParticle p : world.particles){
del.add(p);
}
world.particles.removeAll(del);
}
}

void mousePressed(){
reCreate();
}

void addFly(){
VerletParticle p = new VerletParticle(new Vec3D(random(-width,width),-random(height/2,height),random(-width,width)));
world.addParticle(p);
world.addBehavior(new AttractionBehavior(p, 100, -1.2f, 0.01f));
}


void keyPressed(){
switch(key){
case'e':
click2.play();
click2.rewind();
count++;
break;
case'd':
click2.play();
click2.rewind();
count+=10;
break;
case'c':
click2.play();
click2.rewind();
count+=100;
break;
case'q':
click2.play();
click2.rewind();
count--;
break;
case'a':
click2.play();
click2.rewind();
count-=10;
break;
case'z':
click2.play();
click2.rewind();
count-=100;
break;


case' ':
lifen=lifen+count;
//if(lifen>pow(3,numLevel)){
//lifen=int(pow(3,numLevel));
//}
if(lifen<=0){
lifen=int(0);
}
r=140;
if(count>0){
 offOn=true;
t1=450;
click2.play();
click2.rewind();
click3.play();
click3.rewind();
}
if(count==0){
  offOn=false;
click5.play();
click5.rewind();
}
if(count<0){
 offOn=true;
t1=-450;
click2.play();
click2.rewind();
click4.play();
click4.rewind();
}

c=lifen;
numLevel_=1;
while(c/3>1){
  c=c/3;
numLevel_++;
}
if(numLevel_!=numLevel){
numLevel=numLevel_;
reCreate();
}

count=0;
break;

case'm':
if(play.isPlaying()){
play.pause();
}
else{
play.play();
}
break;
}
}

