
int numTris = 500;
Tri[]Tris = new Tri[ numTris ];
Tri[]Tris2 = new Tri[ numTris ];

void setup(){
  size(300,300);
  smooth();
  for(int i = 0; i <  Tris.length; i++){
    Tris[i] = new Tri(color(i*10,i,i*5,50), width*4/3-i*i, height/3, -1, 0.01);
    Tris2[i] = new Tri(color(0,i*10,i*5,50), -width*2.0/3.0+i*i, height/3, 1, -0.01);
  }
}

void draw(){
    background(255);
    for(int i = 0; i <  Tris.length; i++){
      Tris[i].move();
      Tris[i].display();
      Tris2[i].move();
      Tris2[i].display();
  }
}

boolean stop=false;
 

class Tri {
  color c;
  float x;
  float y;
  float speed;
  float rollSpeed;
  
  float angle=0; 

  Tri(color tempC, float tempX, float tempY, float tempspeed,  float temprollSpeed){
    c=tempC;
    x=tempX;
    y=tempY;
    speed=tempspeed;
    rollSpeed=temprollSpeed;
  }
   
  void display(){
    noStroke();
    fill(c);
    triangle( x+width/6, y+height/3, x, y, x+width/3, y );
  }
     
  void move(){
    x=x+speed;
  if(x>=width/3 && x<=width/3){
     speed=0;
     stop=true;
    }
      
   }
    
 void circle(){
   if(stop){

  float ellipsex;
  float ellipsey;
  int radius=height/3;
  
   
  ellipsex=radius*sin(angle)+width/2;
  ellipsey=radius*cos(angle)+height/2;
  fill(0);
  ellipse(ellipsex,ellipsey,10,10);
  angle = angle+rollSpeed;
  
   }
 }
 
}


