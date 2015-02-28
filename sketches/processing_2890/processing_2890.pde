
float center, sp;
 
 
void setup(){ 
  center = 40;
  sp = 100; 
  size(500, 500); 
  smooth(); 
  stroke(65,89,51);
ellipseMode(CENTER);
  } 
 
 
void draw(){ 
  background(0,168,194);
  for(float y = center; y <= height-center; y += sp){ 
    for(float x = center; x <= width-center; x += sp){ 
       
      //float b; 
      //b = dist(mouseX, mouseY, x, y); 
      //float valor3; 
      //valor3 = map(b, 10, 3*width, 30, 0);  
      fill(204,0,103);
      translate(CENTER/2.5, height/2.5); 
      rotate(PI/3.0); 
      rect(mouseX, mouseY, 50, 15); 
      translate(width/6, height/6); 
      rotate(PI/2); 
      float a; 
      a = 200 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y)); 
      fill(0,169,220);
          /*                                   quad(mouseX, mouseY, 50, 15, 80, 60, 70,60);*/
      fill(255,236,33);
      translate(CENTER/4, height/4); 
      rotate(mouseX); 
  ellipse(mouseX, mouseY, a/1.5,a/1.5); 
   float d; //esta es la distancia
      d = 100 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y));
      fill(250);
     ellipse(x,y, d*0.2, d*0.2);
      
}}} 




