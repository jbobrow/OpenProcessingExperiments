
int numRock = 23;
Circle[] rock =new Circle[numRock];
//float position = 700 ;
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
 
    background(255);
 
  //character's drawing
 
   ellipse(x,720,80,80);
 
   ellipse(x-20,720,30,30);
   ellipse(x+20,720,30,30);
 
   ellipse(x+55,720,30,30);
   ellipse(x-55,720,30,30);
 
   ellipse(x-45,762,50,30);
   ellipse(x+45,762,50,30);

 
   //rock
 
   for(int i = 0; i <numRock; i++){
     rock[i].y+=4;
     rock[i].display();
    
   }
}

//if character and the rock is overlapped, then text " game is over! " is pops out.



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
