
void setup(){
  size(500, 500);
frameRate(10);

}

void draw(){
 
 //layer start

//background(200);
fill(200, 20);
rect(0, 0, width, height);

 translate(mouseX-width/2, mouseY-height/2);
 fill(mouseX, 245, 0);

if(mousePressed == true){fill(135, 13, 142, 10);}

  ellipse(100, 100, 100, 100);
  
  fill(#0A0A0A);
  ellipse(80, 85, 10, 10);
  
fill(#0A0A0A);
  ellipse(120, 85, 10, 10);
 
  ellipse(100, 120, 20, 40);
  line(70, 75, 90, 65);
  line(130, 75, 110, 65);




}
