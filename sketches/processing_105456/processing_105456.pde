
int numCircle = 60;

float[] circleX = new float [numCircle];
float[] circleY = new float [numCircle];

float r;
float b;

int speed = 5;

float x = 0;
float y = 0;




void setup(){
  size(800,800);
  noStroke();
  
  for (int i = 0; i < numCircle; i++){
    circleX[i] = random(width);
    circleY[i] = random(width);
  }
  
}
void draw() {
  
  background(0,mouseY,mouseX);
  fill(255);
  textSize(100);
  text("coding is super",20,height/2-200);
  textSize(60);
  text("I'm serious,people.",120,height/2+200);
  textSize(300);
  text("FUN",100,500);
  fill(0,20,mouseY,30);
 
  
  if (mousePressed) {
   
     r=random(0,255); 
     b=random(0,255);
     fill(255,r,b,20);

    
  }
  
  for(int i = 0; i < numCircle; i++){
    
    ellipse(mouseX++,mouseY++,40,40);
  }
     if (mousePressed) {
   
     r=random(0,255); 
     b=random(0,255);
     fill(255,r,b,80);
     
      for(int i = 0; i < numCircle; i++){
    
    ellipse(mouseX+=20,mouseY+=20,50,50);
    ellipse(mouseY-=10,mouseX-=10,50,50);
  }   
  

  
  
     }
     
      for(int i = 0; i < numCircle; i++){
    
    ellipse(circleX[i],circleY[i],i,i);
  }
  
 

}
