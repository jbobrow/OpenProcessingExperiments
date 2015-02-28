

/*
Hackpact Arte Generativo 2011
Dia 10

Martin Zumaya Hernandez
*/


PVector pos[];
PVector pos_a[];
PVector vel[];
int N = 50000;
int n = N/50;
float dt = 0.1;
float XX = 20;
float YY = XX;
float VV = 5;
float x = 0;
float y = 0;
float ang = 0;

void setup(){
 
 frameRate(50);
 size(600,600,P3D);
 colorMode(HSB);
 
 pos = new PVector[N];
 pos_a = new PVector[n];
 vel = new PVector[N];
 
 for( int i = 0; i < N; i++){
  pos[i] = new PVector(random(-XX,XX),random(-XX,XX),random(-XX,XX));
  vel[i] = new PVector(random(-V,V),random(-V,V),random(-V,V));
 }
 
 for( int i = 0; i < n; i++){
  pos_a[i] = new PVector(random(-YY,YY),random(-YY,YY),random(-YY,YY)); 
 }
}

void draw(){
  
   background(0); 
   lights();
   
   camera(100*cos(ang),100*sin(ang),mouseY,
         0.0,0.0,0.0,
         0.0,0.0,1.0);
          
   for( int i = 0; i < N; i++){
   stroke(100+pos[i].mag(),200,200,200);  
   point(pos[i].x,pos[i].y,pos[i].z);
    pos[i].x += vel[i].x*dt;    
    pos[i].y += vel[i].y*dt;
    pos[i].z += vel[i].z*dt;
    
   }
   
   for( int i = 0; i < n; i++){
    stroke(150+50*sin(ang),200,200);
    line(pos_a[i].x,pos_a[i].y,pos_a[i].z,0,0,0);
   }
      
   for( int i = 0; i < N; i ++){
    if( pos[i].mag() >= 150 ){
     pos[i].set(random(-XX,XX),random(-XX,XX),random(-XX,XX));
    } 
     
   }

  ang += 0.005;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

