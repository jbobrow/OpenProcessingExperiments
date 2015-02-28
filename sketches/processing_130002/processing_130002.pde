
void setup() {
  size(400, 400);
  background(255);
  textSize(10);
  fill(#FF0000);
  text("Para ver el triangulo, pulse T",10,30);
 
  text("Para ver el cuadrado, pulse C",10,60);
  fill(#FF0000);
  text("Para ver la circunferencia, pulse E",10,90); 
}

void draw() {
 
  
  if (keyCode == 84) {
    background(255);
    triangle(200,100,100,300,300,300);
    stroke(3);
    textSize(10);
  fill(#FF0000);

 
  text("Para ver el cuadrado, pulse C",10,30);
  fill(#FF0000);
  text("Para ver la circunferencia, pulse E",10,60);
    
  }
  if (keyCode ==67) {
    background(255);
    rect(100, 100, 200, 200);
    stroke(3);
    textSize(10);
  fill(#FF0000);
  text("Para ver el triangulo, pulse T",10,30);
 

  fill(#FF0000);
  text("Para ver la circunferencia, pulse E",10,60);
     
  }
  if (keyCode == 69) {
    background(255);
    ellipse(200, 200, 200, 200);
    stroke(3);
     textSize(10);
  fill(#FF0000);
  text("Para ver el triangulo, pulse T",10,30);
 
  text("Para ver el cuadrado, pulse C",10,60);
  fill(#FF0000);

  }
}




