
float theta3 = 0;
float randcol1;
float randcol2;
float randcol3;
float speed = 0.1;
void setup(){
  size(1000, 200);
  background(0);
  smooth();
}

void draw(){
  
  randcol1 = random(360);
  randcol2 = random(50);
  randcol3 = random(50);
  fill(HSB, randcol1, 200, 150);
  stroke(0);
  for(int i = 100;i<=900;i+=100){
  senpu3(i, 100, 90);
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
  
 
