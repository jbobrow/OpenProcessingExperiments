
//Graham Strang
//HW Week 10

Random[] rand; 

void setup(){
  size(600,600);
  rand = new Random[100];
  for(int i=0; i<rand.length; i++){
    rand[i] = new Random(random(width),random(height), 6, 7, 24);
  }
  smooth();
    
}
  
void draw(){
  fill(255,100);
  rect(0,0,width, height);
  
  for(int i=0; i<rand.length; i++){
    rand[i].display();
    rand[i].mover();
  }
}
  
  
  
 class Random{
   float x, y, sides, number, radius;
   Random(float xin, float yin, float sideIn, float numIn, float radIn){
     x = xin;
     y = yin;
     sides = sideIn;
     number = numIn;
     radius = radIn;
   }
    
    
   void display(){
     noFill();
      for(int i=0; i < number; i++){
        beginShape();
        for(int j=0; j <= sides; j++){
          float polyX = cos(radians(360/sides)*j)*(radius)+x;
          float polyY = sin(radians(360/sides)*j)*(radius)+y;
          vertex(polyX,polyY);
        }
        endShape(CLOSE);
      }
    }
      
   
    
   void mover(){
      
  }
 }

