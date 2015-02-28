
void setup()   
{  
  size(500, 500, P3D);  
  stroke(120);  
  smooth();  
}  

void draw()   
{  
  Light ();  
  background(0);  
  for (int x = 0; x <= width; x += 50) {  
  for (int y = 0; y <= height; y += 50) {  
  pushMatrix();  
  
  //translate da la variable de n° de cubos en eje x/y 
  translate(x-250,y-250);  
  
  //rotación en ejes Y/X respectivamente
  rotateY(map(mouseX, 20, width, -20, PI));  
  rotateX(map(mouseY, -20, height, 20, PI));
  
  //variable box 3D
  box(20);  
  
  //ejeX - eje Y & Z respectivamente
  camera(mouseY, mouseX, 200.0, 0.0, 0.2, 0.0, 0.0, 1.0, 0.0);
  
  popMatrix();  
    }  
  }  
} 


