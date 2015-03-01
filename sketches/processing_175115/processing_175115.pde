
// Artist statement: Suprize is the element here.Suprize that things work.
//It could be named olso" How did I get here, all I wanted was to make somthing run?"

 

color strokeColor = color(0, 10);


void setup(){
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  smooth();
  noFill();
  background(random(360));
}

void draw(){
  if(mousePressed){
    stroke(mouseX,mouseY,50);
  fill(mouseY,mouseX,75);
  ellipse(140,100,200,100);
  fill(0);
  arc(140,100,200,100, 3.14,6.28);
   
  pushMatrix();
  fill(mouseY,mouseX,75);
  translate(100,75);
  scale(1.25);    
  rotate(radians(15)); 
  ellipse(140,100,200,100);
  fill(0);
  arc(140,100,200,100, 3.14,6.28);
  popMatrix();
  
  pushMatrix();
  fill(mouseY,mouseX,75);
  translate(350,250);
  scale(2.5);    
  rotate(radians(45)); 
  ellipse(140,100,200,100);
  fill(0);
  arc(140,100,200,100, 3.14,6.28);
  popMatrix();
  
   fill(mouseX,mouseY,75);
      if(mousePressed == true){
     arc(140,100,200,100, 3.14,6.28);
   }
   ellipse(600,200, 150,150);
   ellipse(650,200, 20,20);
   strokeWeight(50);
   point( 650, 200);
   
}
}

void keyReleased(){
  if (key == DELETE || key == BACKSPACE) background(360);
  if (key=='s' || key=='S') saveFrame("screenshot.png");

  

}

