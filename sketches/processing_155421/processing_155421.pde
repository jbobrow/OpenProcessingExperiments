

float theta = 0;
float theta2 = 0;
float theta3 = 0;

void setup (){
  size(500, 1000);
  smooth();
  background(0);
}

void draw(){
  senpu(250, 500, 20);
  senpu2(250, 150, 10);
  senpu2(250, 850, 10);
  senpu3(80, 240, 5);
  senpu3(420, 240, 5);
  senpu3(80, 740, 5);
  senpu3(420, 740, 5);
  
 
}


void senpu(int x, int y, int el){
  stroke(0);
  for(int i = 25; i <= 200;i+=10){
  fill(255);
  float c = cos(theta);
  float s = sin(theta);
  
   if(mousePressed == true){
    fill(245, 72, 72);
    c = sin(theta);
    s = cos(theta);
  }
 
 
  ellipse(x+i*c, y+i*s,el, el);
  theta += 0.1;
  
 
 
  }
  ellipse(x, y, 50, 50);
  noFill();
  stroke(255);
  ellipse(x, y, 430, 430);
}
  
  
 
  
  void senpu2(int x2, int y2, int el2){
    stroke(0);
    for(int j = 10;j <= 100; j += 5){
     fill(255);
    float c = cos(theta2);
    float s = sin(theta2);
  
   if(mousePressed == true){
    fill(245, 72, 72);
    c = sin(theta2);
    s = cos(theta2);
  }
    ellipse(x2+j*sin(theta2),y2+j*cos(theta2), el2, el2);
    theta2 += 0.1;
    }
    ellipse(x2, y2, 25, 25);
    noFill();
    stroke(255);
    ellipse(x2, y2, 220, 220);
  }
  
  
   void senpu3(int x3, int y3, int el3){
    stroke(0);
    for(int k = 5;k <= 50; k += 2){
     fill(255);
    float c = cos(theta3);
    float s = sin(theta3);
  
   if(mousePressed == true){
    fill(245, 72, 72);
    c = sin(theta3);
    s = cos(theta3);
  }
    ellipse(x3+k*sin(theta3),y3+k*cos(theta3), el3, el3);
    theta3 += 0.1;
    }
    ellipse(x3, y3, 25, 25);
    noFill();
    stroke(255);
    ellipse(x3, y3, 100, 100);
  }
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
      
