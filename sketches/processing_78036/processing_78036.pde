
//FET PER ADRIÀ SÁNCHEZ GALLEGO
void setup()
{
  random (70,80);
  background(95,100,150);
 size(500,500);
 smooth();
 noStroke();
}
void draw()
{
 
  fill(mouseX,mouseY,mouseX,20);
  if (mousePressed == true) {
    fill(random(0,255),random(0,255),random(0,255));
    rect(mouseX-15,mouseY+15,50,50);
    rect(mouseX-15,mouseY+15,50,50);  
}
    else {
      fill(random(0,255),random(0,255),random(0,255));
      triangle(mouseX, mouseY, mouseX-15, mouseY+15, mouseX+15, mouseY+15);
          
    }
   
 
  if (mousePressed && (mouseButton == LEFT)){
    fill(0);
  } else {
    fill(255);
  }
  if (mousePressed && (mouseButton == RIGHT )){
    fill(50,75,80);
  } else {
    fill(255);
  }
}
   


