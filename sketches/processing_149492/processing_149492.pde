
int numRock = 23;
Circle[] rock =new Circle[numRock];
float x = 200;


void setup(){
  size(1200,800);
  background(255);
  smooth();
  for(int i = 0; i < numRock; i++){
     rock[i] = new Circle(random(width),random(height));
 
   }
}
void draw() {
 
    background(95, 247, 101);
 
  //character's drawing
   fill(0,0,255);
   stroke(0);
   ellipse(x,720,80,80);
 
   fill(255,255,0);
   stroke(0);
   ellipse(x-20,720,30,30);
   ellipse(x+20,720,30,30);
 
   fill(255);
   stroke(0);
   ellipse(x+55,720,30,30);
   ellipse(x-55,720,30,30);
 
   fill(255,0,0);
   ellipse(x-45,762,50,30);
   ellipse(x+45,762,50,30);

 
   
   fill(55);
   for(int i = 0; i <numRock; i++){
     rock[i].y+=4;
     rock[i].display();
     if(rock[i].y == 720|| rock[i].y == 762){
       background(255,0,0);
       fill(120, 10, 10);
       textSize(50);
       text("Game is over", 120,80 );
     }
   
   }
   
   
}

//if character and the rock is overlapped, then text " game is over! " is pops out.
/*
public boolean overlapped(Circle other){
  for(int i = 0; i < numRock; i++ ){
    if(other[i].y = 720 || other[i].y = 762 ){
        return true;
    }
    
  }  
  return false;
  
}  

*/

void keyPressed() {
   
    if(keyCode == LEFT){
      x = x - 40;
    }
    else if(keyCode == RIGHT){
      x = x + 40;
    } 
 
 
}


 
class Circle{
 
  float x;
  float y;//= random(200,100)
  float radius;
  int numRock = 20;
 
 
  void setup(){
    size(1200,800);
    background(255);
    smooth();
    for(int i = 0; i < numRock; i++){
       rock[i] = new Circle(random(width),random(height));
  
     }
  }
  Circle(float x, float y){
    this.x = random(100,1100);
    this.y = 100;
    radius = random(20,40);
 
  }

 
  void display(){
  
    ellipse(x,y,radius,radius);
  }
}  
