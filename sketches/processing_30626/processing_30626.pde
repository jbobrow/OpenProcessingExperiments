
void setup ()
{
   size (700, 700);
   background(0);  
   smooth(); 
}

void draw ()
{

// Definição de função
 
  if(keyPressed) {
        if (key == ' ')

         saveFrame("line-####.jpg");
         background(255); } 

// Definiçao de derivaveis

  float r = map(mouseY, 0,height,255,0);
  stroke(0,r,r);

  line(pmouseX,pmouseY,mouseX,mouseY);  
  strokeWeight( abs(mouseX-mouseY)*0.2); 
  smooth();
}


