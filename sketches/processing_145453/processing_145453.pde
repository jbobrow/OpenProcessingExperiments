
float counter = 0;
  PImage img;
void setup()
{
  size(500, 500);
  smooth();
  background(255);
  colorMode(HSB, 360, 100, 100);

}
 
void draw()

{

  noStroke();
  


 
if(mouseX<250 && mouseY<250){
  rect(0,0,250,250);
  
  float h = map(sin(counter), -1, 1, 180, 220);
  fill(h, 70, 100);
  counter += 0.01;
}


  else if  (mouseX >250 && mouseY<250){
    rect(250,0,250,250);
  
    float h = map(sin(counter), -1, 1, 60, 120);
  fill(h, 70, 100);
  counter += 0.01;
}


else if  (mouseX <250 && mouseY>250){
    rect(0,250,250,250);
  
    float h = map(sin(counter), -1, 1, 90, 150);
  fill(h, 70, 100);
  counter += 0.01;
}
else if  (mouseX >250 && mouseY>250){
    rect(250,250,250,250);
  
    float h = map(sin(counter), -1, 1, 0, 60);
  fill(h, 70, 100);
  counter += 0.01;
}

}
    
    
  

