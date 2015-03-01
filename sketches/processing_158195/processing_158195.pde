
boolean on=true; //universe gen on at starts
int MAX=20000; //max num stars
float MAXD=4;  
float MAXDB=9; 

class Star 
{
   PVector origin; 
   float diameter; 
   Star(PVector or, float d)
   {
      origin= or; 
      diameter=d; 
   } 
   
   void draw(){
     noStroke(); 
     fill(255); 
      ellipse(origin.x, origin.y, diameter, diameter);  
   }
}

Star [] stars= new Star[MAX]; 
int i=0; 

boolean TestStars( PVector coor, float d, int current){
  if(current>0){
    for( int i=0; i< current; i++){
      if( dist (coor.x,coor.y, stars[i].origin.x, stars[i].origin.y) < (( d + stars[i].diameter )/2) ){
        return false; // if not
      }
    }
  }
 return true; //if possible  
}



class ShootingStar    // all shooting stars travel by 1/1000x^2 + type num
{  
  PVector origin; 
  float diameter; 
  int type; //0 = +300-400 defalut   1= 400-500  2=500-600  3=600-700  4=700-00
  float yinc; 
  float arc; 
  boolean alive; 
  color colo; 
  float speed; 
  
  ShootingStar(){
    type= floor(random(0,5));
    diameter= random(0,8); 
   
    alive=true; 
    
    speed=random(1, 5); 
    
    if(type=='0'){
       yinc=random(-800,-300); 
    }else if(type=='1'){
       yinc=random(-300,-100); 
    }else if (type =='2'){
       yinc=random(-100,0); 
    }else if (type =='3'){
      yinc=random(0,100); 
    }else {
      yinc=random(100,300); 
    }
    
    arc= random(2000,4000);
    origin= new PVector( 700, (1/arc)*(700)*(700)-((2/10)*(700))+yinc); 
    float g =floor(random(0,2)); 
    
    if( g==0){
      colo=color(255,0,0); 
    }else if (g==1){
      colo =color(255); 
    }else{
      colo= color(0);
    }
  }
  
  void calculatenext(){
    origin= new PVector(origin.x -speed, ((1/arc)*(origin.x-speed)*(origin.x-speed))- ((2/10)*origin.x-speed)+yinc);
   
  }
  
  void draw(){
     
    if(origin.x <=0){
      alive=false;
    } 
    else{
      noStroke(); 
      fill(colo);
      ellipse(origin.x, origin.y, diameter,diameter);
    }
  }
  
}


ArrayList <ShootingStar> sstar =new ArrayList<ShootingStar>() ;

int numsstar=sstar.size(); 

void setup() {
    size (700,700); 
    background(20,40,80);
}

void draw() {
  fill(20,40,80,5);
  rect(0,0,700,700); 
  
    PVector co= new PVector (random(0,700),random(0,700));
    float m; 
    if( i%100==0){
       m=MAXDB; 
    }else {
      m=MAXD; 
    }
      float dia= random(0,m);
    
    while( TestStars( co, dia, i)==false){
       co= new PVector (random(0,700),random(0,700)); 
       if( i%100==0){
          m=MAXDB;
       } else {
         m=MAXD;
       }
       dia= random(0,m);
    }
    Star n= new Star( co, dia);
    n.draw(); 
    stars[i]=n; 
    i++;
  
  
  for(int i=0; i<sstar.size(); i++){ 
    ShootingStar x= sstar.get(i); 
    x.calculatenext(); 
    x.draw(); 
    if( x.alive==false){
      sstar.remove(i);  
    }
    
    
  }
  
  
  
   
 
}

void mousePressed() {
    println(i); 
    sstar.add(new ShootingStar()); 
    int s = sstar.size(); 
    ShootingStar x= sstar.get(s-1); 
    println("sstar size ",s, " and type ", x.type );
    
}

void keyPressed(){
   if(key=='9'){
     background(20,40,80);
   } else if(key=='0' && on ==true){
    noLoop(); 
    on=false; 
   }
  else {
    loop(); 
    on =true; 
  }
  
 
}
 


