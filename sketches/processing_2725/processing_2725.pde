
float valor1, valor2;


void setup(){
  valor1 = 150;
  valor2 = 15;
  size(550, 550);
  smooth();
  stroke(150,0,0,100);
  
  }


void draw(){
  background(10,100);
  for(float y = valor1; y <= height-valor1; y += valor2){
    for(float x = valor1; x <= width-valor1; x += valor2){
      
      //float b;
      //b = dist(mouseX, mouseY, x, y);
      //float valor3;
      //valor3 = map(b, 10, 3*width, 30, 0); 
      fill(10,210);
      translate(width/2.5, height/2.5);
      rotate(PI/3.0);
      triangle(mouseX, mouseY, 50, 15, 80, 60);
      translate(width/6, height/6);
      rotate(PI/2);
      float a;
      a = 200 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
      fill(150,0,0,100);
      rect(x,y, a*0.5, a*0.5);
      fill(120,0,0,150);
      translate(width/4, height/4);
      rotate(PI/4.5);
      ellipse(mouseX, mouseY, a/1.5,a/1.5);
     
}}}

