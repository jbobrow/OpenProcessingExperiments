
float angle;
Flower [] pansies;
PImage pansy;
//left and right bracket indicate an array of the type Circle which is a class.

void setup(){
  pansy = loadImage("pansy.gif");
  size(1000,1000);
  background(139,58,55);
  angle=0;
  pansies = new Flower[300];
  for(int i=0;i<pansies.length; i++){
    pansies[i] = new Flower(-10,-500);
  }
}

void draw(){
 for(int i=0; i<pansies.length;i++){
   pansies[i].move();
   pansies[i].display();
 } 
  
}






class Flower{
  float x,y,speedx,speedy;
  Flower(float xpos,float ypos){
    //set attributes it has
    x = xpos*10;
    y = ypos/10;
    speedx = random(5);
    speedy = random(9);
  }

  //Methods
  void move(){
    x+=speedx;
    y+=speedy;

  }
  
  
  void display(){
  float glowLight = sin(radians(angle));
  glowLight = map(glowLight, -1,1,0,255);
  tint(255,94,random(130));
  image(pansy,x*5,y*2);

  
  }
}

