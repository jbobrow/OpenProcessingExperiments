

/*
Hackpact Arte Generativo 2011
Dia 11

Martin Zumaya Hernandez
*/


PVector pos[];
PVector pos_a[];
PVector vel[];
int N = 50000;
int n = N/50;
float dt = 0.1;
float XX = 50;
float YY = XX;
float VV = 5;
float x = 0;
float y = 0;
float ang = 0;

void setup(){
 
 frameRate(50);
 size(900,500,P3D);
 colorMode(HSB);
 noCursor();
 
 pos = new PVector[N];
 vel = new PVector[N];
 
 for( int i = 0; i < N; i++){
  pos[i] = new PVector(0,0,0);
  vel[i] = new PVector(0,0,0);
 }
 
}

void draw(){
  
   background(0); 
   lights();
   
//   camera(100*cos(ang),100*sin(ang),mouseY,
   camera(100*cos(20*ang),mouseX,100*sin(20*ang),
         0.0,0.0,0.0,
         0.0,0.0,-1.0);
          
   for( int i = 0; i < N; i++){
     
   stroke(100+pos[i].mag(),200,200,200);  
   
   rotateZ(10*ang);
   rotateY(20*ang);
   
   point(pos[i].x,pos[i].y,pos[i].z);
   point(pos[i].x,pos[i].y,-pos[i].z);
   
   point(pos[i].z,pos[i].y,pos[i].x);
   point(-pos[i].z,pos[i].y,pos[i].x);
      
   point(pos[i].y,pos[i].z,pos[i].x);
   point(pos[i].y,-pos[i].z,pos[i].x);   
   
    pos[i].x += random(-25,25)*dt;    
    pos[i].y += random(-25,25)*dt;
    pos[i].z += random(0,120)*dt;
    
   }
            
   for( int i = 0; i < N; i ++){
    if( pos[i].mag() >= 450 ){
     pos[i].set(0,0,0);
    } 
   }

  ang += 0.005;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

