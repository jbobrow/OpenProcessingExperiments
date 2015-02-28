
void setup()
{
size (400, 400, P3D);
background (255);
}
//////////////////
void draw()
{
 prepscreen();
 spheres(); 
 boxes();
 flatShapes();
 textFunction();
}
//////////////////
void textFunction()
{
  textSize(40);
  fill(0);
  text("dizzy",0,0,30); 
 pushMatrix();
 translate(0,0,100);
 rotateZ(radians(frameCount));
  textSize(28);
  text("dizzy", 40, 100, 0);
  popMatrix();
}
//////////////////
void flatShapes()
{
  pushMatrix();
     translate(30,40,0);
     fill(20,50,70,60);
     ellipse(20,20, 50, 50);
   popMatrix();
   
   pushMatrix();
     translate(0,40,50);
     fill(200,50,90,60);
     rect(20,20, 50, 50);
   popMatrix();
}
//////////////////
void boxes()
{
  noLights();
  box(mouseX); 
}
//////////////////
void prepscreen()
{
background(255,255,255,10);
translate(width/2, height/2, 0);
rotateX( radians (frameCount*3));
rotateY(radians(frameCount/2));
rotateZ(radians(frameCount*4));
lights();
strokeWeight(1);
//line(-100, 0, 0, 100, 0, 0);
//line(0, 0, -100, 0, 0, 100); 
//line(0,-100,0, 0,100,0);
}
/////////////////////
void spheres()
{

 sphereDetail(10);
 pushMatrix();
  fill(200,0,0,40);
  translate(-100,0,0);
  sphere(20); 
 popMatrix();
 
 pushMatrix();
  fill(0,200,100,60);
  translate(200,0,0);
  sphere(70); 
 popMatrix();
 
 pushMatrix();
  fill(50,100,200,40);
  translate(0,-100,0);
  sphere(30); 
 popMatrix();
 
 pushMatrix();
  fill(150,100,250,40);
  translate(-300,-100,0);
  sphere(30); 
 popMatrix();
 
 pushMatrix();
  translate(0,150,0);
  sphere(20); 
 popMatrix();
 
 pushMatrix();
  fill(0,0,200,60);
  translate(0,300,0);
  sphere(30); 
 popMatrix();
 
 pushMatrix();
  fill(200,0,200,60);
  translate(200,300,0);
  sphere(40); 
 popMatrix();
 
 pushMatrix();
  
  translate(0,0,-100);
  sphere(50); 
 popMatrix();
 
 pushMatrix();
  translate(0,0,300);
  sphere(10); 
 popMatrix();
}               
