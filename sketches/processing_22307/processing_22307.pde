
void setup(){

  size(300,300);

}

void draw() {
   background(random (50),random (200),100);
  line(0,0,300,300);
  line(300,0,0,300);
  line(150,0,150,300);
  line(0,150,300,150);


  fill(255,255,0, random(100));
  stroke(150);
  rect(mouseX,0,50,100);
  
  fill(random(155),0,0,150);
  rect(mouseX,100,50,100);
  fill(random(255),150,0,100);
  rect(mouseX,200,50,100);

  
  fill( random(120) ,0, random(200) ,20);
  triangle(10,10,300,150, random(250),250);
   fill( random(200) ,random (100) ,50,20);
  
  triangle(300,150,10,10, random(250),250);
}



