
building[] buildingz;
 
void setup(){
  size(500,300);
  buildingz = new building[0]; 
  float decx=500;float bx=500;
  float decy=-300;
  for (int b= 0;b<5;b++){
    float mindy=0;
    for (int a= 0;a<10;a++){
    float x=-200+decx; float y=decy+mindy + 400;
    if(x>-50 && x<550 && y>0 && y<700){
    new building(x,y);
    }
    decx=decx-76;
    mindy+=25;
    }
    decy=decy+40;
    decx=bx+40;bx=decx;
  }
  stroke(100);
}
 
void draw(){
  background(255);
  for(int a=0;a<buildingz.length;a++){
    buildingz[a].dessine( );
  }
} 

class building{
  float x, y;float h ;
  variateur v;
  float[][] base;
 building(float a, float b){
   h=0;
   v=new variateur(0,600,random(100,600));
   base = new float[0][2];
   float[] ab1 = {a-50,b-5};
   float[] ab2 = {a+20,b-25};
   float[] ab3 = {a+50,b+5};
   float[] ab4 = {a-20,b+25};
   base = (float[][]) append (base, ab1);
   base = (float[][]) append (base, ab2);
   base = (float[][]) append (base, ab3);
   base = (float[][]) append (base, ab4);
  buildingz = (building[]) append(buildingz, this);
 }
 void dessine( ){
   h =v.avance();  
   fill(180 );
   quad(base[0][0],base[0][1], base[0][0],base[0][1]-h, base[3][0],base[3][1]-h,base[3][0],base[3][1]);
     fill(200 );
    quad(base[3][0],base[3][1], base[3][0],base[3][1]-h, base[2][0],base[2][1]-h,base[2][0],base[2][1]);
    fill(255 );
    quad(base[0][0],base[0][1]-h, base[1][0],base[1][1]-h,base[2][0],base[2][1]-h,base[3][0],base[3][1]-h);
     
 }
}

class variateur{
  float step,mini,maxi,etat,diff,val;
  variateur(float mi,float ma, float st){
    diff=(ma-mi)/2;
    etat = PI; 
    step = TWO_PI/st;
    mini=mi;maxi=ma;
  }
  float avance(){
    etat+=step;
    return(mini+((cos(etat)+1)/2)*diff);
  }
}               
