

float theta3 = 0;
float speed = 0.1;
void setup(){
  size(500, 1000);
  smooth();
  frameRate(10);
  background(0);
}

void draw(){
  background(255, 255, 0);
  for(int i = 0; i <= height ; i += 100){
    
    for(int j = 0 ; j <= width ; j += 100){
    fill(0, 255, 220, 200);
  senpu3(j, i, 10);
  
    }
  }
 
  
}



 void senpu3(int x3, int y3, int el3){
    stroke(0);
    for(int k = 5;k <= 50; k += 2){
    
    float c = cos(theta3);
    float s = sin(theta3);
  
   if(mousePressed == true){
     speed+=0.1;
   
  }
  
  
    ellipse(x3+k*sin(theta3),y3+k*cos(theta3), el3, el3);
    theta3 += speed;
    }
    ellipse(x3, y3, 25, 25);
    stroke(255);
    ellipse(x3, y3, 10, 10);
  }
  


