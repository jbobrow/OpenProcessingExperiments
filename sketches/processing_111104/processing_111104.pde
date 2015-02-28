
void setup(){
  size(500,500);
  smooth();
  
}

void draw(){
  background(0,139,191);
  strokeWeight(5);
  stroke(mouseX,mouseY,255);
  line(0,mouseX,mouseY,500);
  line(50,mouseX,mouseY,450);
  line(100,mouseX,mouseY,400); 
  line(150,mouseX,mouseY,350); 
  line(200,mouseX,mouseY,300);
  line(250,mouseX,mouseY,250);
  line(300,mouseX,mouseY,200);
  line(350,mouseX,mouseY,150);
  line(400,mouseX,mouseY,100);
  line(450,mouseX,mouseY,50);
  
    println(mouseX + " " + mouseY);  
}



