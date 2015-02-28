
int x=0;
int speed=3;
int y=100;
void setup(){
  size(600,600);
  smooth();
}
void draw(){
  background(0);
  mover();
  rebotar();
  display();
}
void mover(){
  x=x+ speed;
  y=y+speed+1;
}
void rebotar(){
  if((x>width)||(x<0)){
    speed=speed*-1;
    if ((y>width)||(y<0)){
      speed=speed*+1;
    }
  }}
 
  void display(){
    fill(34,183,240);
    ellipse(x,100,220,220);
    fill(114,205,240);
    ellipse(x-30,50,40,40);
    ellipse(x+30,50,40,40);
    strokeWeight(4);
    line(x-50,180,8,8);
  
  
    fill(245,238,12);
    ellipse(x-90,300,150,150);
    fill(245,164,12);
    ellipse(x-110,250,40,40);
    ellipse(x-70,250,40,40);
    strokeWeight(4);
    line(x-90,340,y-5,y+25);
   
    fill(y-54,12,245);
    ellipse(x+90,420,100,100);
    fill(y-40,168,245);
    
    ellipse(x+60,380,40,40);
    ellipse(x+90,380,40,40);
    strokeWeight(4);
    ellipse(x+80,440,20,15);
     
  }
   void keyPressed(){
    noLoop();
  }
  void mousePressed(){
  loop();
 
  }
  

