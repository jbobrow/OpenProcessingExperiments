
Flower[] flowers= new Flower [1];
Sun[] suns= new Sun [1];

 

void setup() {
  
  size(600,600);

  smooth(); 
  
  frameRate (10); 
  
  for(int i = 0; i < flowers.length; i++){
  flowers[i] = new Flower();
  }
  
  for(int i = 0; i < suns.length; i++){
  suns[i] = new Sun();

}
  }
  


void draw() {
  background(255);
  
  for (int i = 0; i< flowers.length; i++) {
     flowers[i].grow();
      flowers[i].display();
  }
  for(int i = 0; i < suns.length; i++){
    suns[i].display();
    suns[i].roll();
  }
  
}
  
  

  

  
float r = 20;
int y= 100 ;
int a = (width/2);
int b = (width/2);


class Flower{

void display (){


noStroke();
translate(width/2,height/2);
 
//petals 
pushMatrix();
rotate(radians(45));
fill(255,0,0);
ellipse(0, 0, r, y);
ellipse(0, 0, y, r);
popMatrix();
 
//petals 
fill(255,0,0);
ellipse(0, 0, r, y);
ellipse(0, 0, y, r);
 
//center of the flower
fill(255,255,0);
ellipse(0, 0, r, r);

// stem
//rotate(-PI/4);
//ellipse(0, 0, 100, 20);

        
}

void grow() {
r = r+2;  // increases the size of the circles 
  if (r == 300 ){
    r = 20;
  }

y = y+4;  // increases the size of the circles 
if (y == 400 ){
 y = 100;

     //r = state * 20;
    //y = state * 20;
}
}
}


int x = -290;
float s = -260; 
int xspeed= 25;
int size = 150;


class Sun {
  
void display (){
  
   stroke(255,150,0,50);
  strokeWeight(20);
  fill (255,230,0);
  ellipse ( x,s, size,size);
}
void roll (){
  x= x+10;
  s= s+.5;
  
  if (s  > 20 || x> 10){
    background (0);
    noStroke();
    fill (255);
    ellipse ( x,s, size,size);
  }if (x > 500 || s > 100){
    x = -200;
    s= -300;
   background (255);

  
}
}
}



