
    

void setup() {
  size(400, 300, P3D); 
  background();
}

int i = 1;

void draw() { 
 if(mousePressed == true){
     //Main brush
     stroke(255);
     float x = mouseX + random(-20,20);
     float y = mouseY+random(-20,20);
     translate(x ,y);
     rotate(i);
     box(25);
     translate (0,0);
     
     //Reflexion
     translate((width- x), height-y);
     box(25);
     i+=0.1;
  }
  translate(0,0);
     stroke(125, 25);
  translate(random(0,width), random(0,height));
  rotateX(mouseY * .03);
  rotateY(mouseX * .03);
  float red = map(mouseX, 0, width, 0, 255);
  float green = map(mouseY, 0, height, 0, 255);
  fill(red, green, (mouseX + mouseY)% 255 );
   smooth();
  //sphereDetail(30,5);

  float radius = random(10,60)
  sphere(radius);
  translate(0,0); 
  
  if(mouseButton == RIGHT){
      background();
   
  }   
}


