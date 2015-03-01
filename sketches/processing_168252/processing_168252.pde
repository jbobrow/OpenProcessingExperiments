
boolean birting = false;

void setup(){
  size(800,800);
}

             
void draw()
{
  if (mousePressed){
  background(random(200,255),random(100,250),random(25,250));
  ellipse(mouseX,mouseY,50,75);
  fill(random(1,255),random(1,75),random(1,250));
}
else
{ 
  background(0,0,0);  
  ellipse(mouseX,mouseY,50,75);
  fill(5,55,9); 
}
if (mouseX >= 400){
  birting = true;
}
else{
  birting = false;
}

if(birting){triangle(random(1,1000),random(1,1000),random(1,1000),random(1,1000),random(1,1000),random(1,1000));
fill(random(1,235),random(1,155),random(1,025));
}

}
