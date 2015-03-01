
PImage iris;
float counting=1;


float rot = 0;

float my_num=0;
float my_num2=1;

void setup(){
size(500,500);
iris=loadImage("iris.jpg");
}

  void draw_rotating_rectangle(float x, float y, float rect_size, float r) {
    translate(x, y);
    rotate(r);
    rect(0, 0, rect_size, rect_size);
    resetMatrix();
  }
  
  

void draw(){
  counting++;
image(iris,0,0);
filter(POSTERIZE, 4);
  
  if(counting==100){
  text("IRIS", 450, 450);
  } else{
    text("IRIS", 20, 470);
}


  fill(100,50,8,50);
  stroke(100,50,8,50);
  rect(465, 0, 35, 500);
  
  fill(100,50,8,70);
  stroke(100,50,8,70);
  rect(429, 0, 35, 500);
  
  fill(100,50,8,90);
  stroke(100,50,8,90);
  rect(393, 0, 35, 500);
  
    fill(100,50,8,100);
  stroke(100,50,8,100);
  rect(357, 0, 35, 500);
  
  float x=noise(my_num)*width;
  line(x,0,x,height);
  
  float y=noise(my_num+40)*height;
  line(0,y,width,y);
  
  my_num=my_num+0.02;
 
  
  float x=0;
  while (x<8){
    float y=0;
    while (y<8){
      draw_rotating_rectangle(70 + x*40, 120 + y*30, 16, rot);
      y=y+1;
    }
    x=x+1;
  }
  rot=rot+0.05;
 
}





