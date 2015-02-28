
int r = 220;
int g = 20; 
int b = 40;

void setup(){
size (500,500);
background(200,0,0);
}

void draw(){
  background(30,10);
  //horizontal
  int i= 0;
  while (i<width){
     stroke(255,50);
     float distance = abs (mouseX - i);
     fill(distance,20,190);
     rect(i,0,10,height);
     i+=5;
      }
      
      
      
       int u= 0;
  while (u<height){
     stroke(255,50);
     float distance1 = abs (mouseY - u);

     fill(distance1,190,120,100);
     rect(0,u,width,10);
     u+=5;
      }
      
      
}

