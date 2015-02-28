

void setup(){
  size (350, 350);
  background(255);
  
}

void draw (){
  smooth();  // para suavizar las lineas
  //Horizontal
  strokeWeight(8);
  line(0, 50, 500, 50);
  line(0, 150, 500, 150);
  line(0, 300, 500, 300);
  
  //Vertical
  line(70, 0, 70, 350);
  line(130, 0, 130, 350);
  line(210, 0, 210, 350);
  line(300, 0, 300, 350);
  
  //Rectángulos
  fill(255,0,0);
  rect(70,50, 60, 100);
  
  fill(0,0,255);
  rect(210,50, 90, 100);
  
  
  fill(255,255,0);
  rect(70,270, 60, 30);

}

