
//import processing.opengl.*;

emitter [] h1 = new emitter[20];
squares [] bw;
float res = PI/16;
float iv = 0.0001;
float vmult= 10;
float ddiv = 1;
boolean tbtp=false;//toggle block to put


float half = 1024;
float divisor = 32;
int blocksx = int(half*2/divisor);
int blocksy = int(half/divisor);
int blocksz = int(half*2/divisor);

void setup() 
{
  bw = new squares[blocksz];
  size(500, 500, P3D);
  frameRate(30);
  for(int i=0;i<bw.length;i++){
    bw[i]=new squares(false);
  }
  for(int i=0;i<h1.length;i++){
    h1[i]=new emitter(random(-half,half),random(half),random(-half,half),random(10,150));
  }
}
float rot=0;
boolean rsqr=true;
void draw() { 
 background(204);
 sphereDetail(4);
 //normal(random(100),random(100),random(100));
 //smooth();
 //strokeWeight(2);
 //noStroke();
 lights();
  //rot+=.01;
  translate(width/2,0,-mouseY*half/height*2);
    pushMatrix();
      rotateY(mouseX*PI/width*3);
  for(int i=0;i<h1.length;i++){
    h1[i].update();
  }
  if (rsqr){// IF RENDER SQUARES: THEN RENDER THEM
    for (int iz = 0; iz<blocksz; iz += 1) {
    for (int ix = 0; ix<blocksx; ix += 1) {
    for (int iy = 0; iy<blocksy; iy += 1) {
      if(bw[iz].placed[ix][iy]){
        pushMatrix();
        translate(ix*divisor-half,iy*divisor,iz*divisor-half);
        box(divisor);
        popMatrix();
      }
    }
    }
    }
  }
  popMatrix();
} 
void mousePressed(){
  for(int i=0;i<h1.length;i++){
    h1[i].rand();
  }
  for (int iz = 0; iz<blocksz; iz += 1) {
    bw[iz].clear();
  }
  //print (h1[2].pos[1]);
}
boolean test=false;
void keyPressed(){
  
    if (key == ENTER) {
      if (test) {
        test = false;
      } else {
        test = true;
      }
    }
    
    else if (key == 'a') {
      for(int i=0;i<h1.length;i++){
        h1[i].step();
      } 
    }
    else if (key == 's') {
      if (rsqr) {
        rsqr = false;
      } else {
        rsqr = true;
      }
    }
}
int dib(float f){//divide into block;
  return int((f-f%divisor)/divisor);
}
//BW CALCULATIONS:
class squares{
  boolean[][] placed = new boolean[blocksx][blocksy]; //x-y (z is array)
  boolean dblock;
  squares(boolean def){
    //placed[][]=def
    dblock=def;
    clear();
  }
  void place(float x, float y){
    int ix=dib(x+half);
    int iy=dib(y);
    //print(placed.length);
    if(ix>=0 && ix<blocksx && iy>=0 && iy<blocksy)
      if(tbtp){
        placed[ix][iy]= !placed[ix][iy];
      }
      else placed[ix][iy] = !dblock;
  }
  void clear(){
    for (int ix = 0; ix<placed.length; ix += 1) {
    for (int iy = 0; iy<placed[ix].length; iy += 1) {
      placed[ix][iy]=dblock;
    }}
  }
  
}
class emitter { 
  float[] pos ={0,0,0};
  float[][] pp = new float[999][3];
  float[][] pv = new float[999][3];
  float[][] pd = new float[999][3];
  int[] col={int(random(255)),int(random(255)),int(random(255))};
  float esize=0;
  
  emitter (float x, float y, float z, float s) {
    
    pos[0]=x;
    pos[1]=y;
    pos[2]=z;
    esize=s;
    
    int c=0;
    for (float i = -PI; i <= PI; i += res) {
      for (float j = 0; j <= PI; j += res) {
                
        pp[c][0] = esize*1.2 * sin(i) * cos(j) + pos[0];
        pp[c][1] = esize*1.2 * sin(i) * sin(j) + pos[1];
        pp[c][2] = esize*1.2 * cos(i) + pos[2];
        
        pv[c][0]=(pos[0]-pp[c][0])*-iv; //velocity
        pv[c][1]=(pos[1]-pp[c][1])*-iv;
        pv[c][2]=(pos[2]-pp[c][2])*-iv;
        
        //direction
        
        //pv[c][0]= ;//x direction/rotation
        
        
        c+=1;
      }}
    
    
  }
  //vel = 9.8*1/dist
  void update() {
    float x,y,z;
    x=pos[0];
    y=pos[1];
    z=pos[2];
    fill(col[0],col[1],col[2]);
      pushMatrix();
        translate(pos[0],pos[1],pos[2]); 
        sphere(esize);
      popMatrix();
      
      //print(h1[3].pos[2]);
      //yvel -= pull*Math.sin(direction/180*Math.PI);
      //xvel += pull*Math.cos(direction/180*Math.PI);
      
      // -----BEGIN POINTS -----//
    int c=0;
    for (float i = -PI; i <= PI; i += res) {
    for (float j = 0; j <= PI; j += res) {
      if(test){
        pushMatrix();
          translate(pp[c][0],pp[c][1],pp[c][2]);
          box(esize/10);
        popMatrix();
      }
      else point(pp[c][0],pp[c][1],pp[c][2]);
      c+=1;
    }}
        
    
    
    
  }
  void step(){
    int c=0;
    float dtp;//dist to planet
    for (float i = -PI; i <= PI; i += res) {
    for (float j = 0; j <= PI; j += res) {
      
      for(int pi=0;pi<h1.length;pi++){
        
        
        //DISTANCE CALCULATION
        float dx=(h1[pi].pos[0]-pp[c][0]);
        float dy=(h1[pi].pos[1]-pp[c][1]);
        float dz=(h1[pi].pos[2]-pp[c][2]);
        float dst=sqrt((dx*dx)+(dy*dy)+(dz*dz));
        float df=((dx*dx)+(dy*dy)+(dz*dz));
        df*=ddiv;
        //VELOCITY CALCULATION
        
        pv[c][0] += vmult*h1[pi].esize*dx/df;
        pv[c][1] += vmult*h1[pi].esize*dy/df;
        pv[c][2] += vmult*h1[pi].esize*dz/df;
        
        if(dst<h1[pi].esize){
          pv[c][0]=0;
          pv[c][1]=0;
          pv[c][2]=0;
          pi=h1.length+1;
        }
      }
      
      
      pp[c][0] += pv[c][0];
      pp[c][1] += pv[c][1];
      pp[c][2] += pv[c][2];
      
      //BLOCK WORLD
      int bwz = dib(pp[c][2]+half);
      if (bwz>=0 && bwz<blocksz)
      bw[bwz].place(pp[c][0], pp[c][1]);
      
       
      /*pv[c][0]=(pos[0]-pp[c][0])*2; //velocity
      pv[c][1]=(pos[1]-pp[c][1])*2;
      pv[c][2]=(pos[2]-pp[c][2])*2;*/
        
      c+=1;
    }}
  }
  void rand(){
    pos[0] = random(-half,half);
    pos[1] = random(half);
    pos[2] = random(-half,half);
    
    int c=0;
    for (float i = -PI; i <= PI; i += res) {
    for (float j = 0; j <= PI; j += res) {
      pp[c][0] = esize*1.2 * sin(i) * cos(j) + pos[0];
      pp[c][1] = esize*1.2 * sin(i) * sin(j) + pos[1];
      pp[c][2] = esize*1.2 * cos(i) + pos[2];
        
      pv[c][0]=(pos[0]-pp[c][0])*-iv; //velocity
      pv[c][1]=(pos[1]-pp[c][1])*-iv;
      pv[c][2]=(pos[2]-pp[c][2])*-iv;
        
      c+=1;
    }}
  }
}

