
import traer.physics.*;

ParticleSystem physics;

int num=18;
int exSprings = 20;
Particle[] points1 = new Particle[num];
int[][] sprCoord = new int[exSprings][2];



void setup(){
 size(600,600,P3D);
 smooth();
 fill(0,0,0,30);
 ellipseMode(CENTER);
 stroke(0);
 
 physics = new ParticleSystem(.5,0.05);
 
 //generate points
 for(int i=0;i<num;i++){
  points1[i] = physics.makeParticle(1.0,random(width),random(height),random(30));
 }
 
 //create springs between points
 for(int i=0;i<num;i++){
  if(i<num-1){
   physics.makeSpring(points1[i],points1[i+1],0.5,0.1,200);
  }else{
   physics.makeSpring(points1[num-1],points1[0],0.5,0.1,200); 
  }
 }
 //generate chaotic random springs
 for(int i=0;i<exSprings;i++){
  int pt1 = int(random(num));
  int pt2 = int(random(num));
  physics.makeSpring(points1[pt1],points1[pt2],0.5,0.1,int(random(200)));
  for(int j=0;j<2;j++){
   if(j==0){
   sprCoord[i][j] = pt1; 
   } else{
   sprCoord[i][j] = pt2;
   }  
  }
 }
}

void draw(){
 physics.tick();

 background(255);
 
 //create dots at each point
 beginShape(TRIANGLE_STRIP);
 for(int i=0;i<num;i++){
  vertex(points1[i].position().x(),points1[i].position().y(),points1[i].position().z());
 }
 endShape(CLOSE);
 
 for(int i=0;i<exSprings;i++){
 int x1,y1,z1,x2,y2,z2;
 //x1 = points1[sprCoord]
 }
}

void mousePressed(){
 points1[0].makeFixed();
 points1[0].position().set(mouseX,mouseY,points1[0].position().z()); 
}

void mouseDragged(){
 points1[0].position().set(mouseX,mouseY,points1[0].position().z()); 
}

void mouseReleased(){
 //anchor.makeFree(); 
}






