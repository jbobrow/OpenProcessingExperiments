
void setup()
{
  size(500,500,OPENGL);
  frameRate(24);
  noStroke();
  
}

void draw()
{
  background(0);
  smooth();
stroke(250, 80, 150);

  
int c = 50;
pushMatrix();

translate(0, 0, -600);
for(int x = -400; x < 20*width; x +=50){
for(int y = -400; y < 20*height; y += 50){
    c+=10;
    fill( random(255), random(255), random(255));
    //fill(250, 60, c);
    rect(x, y, 250, 250);
}
}

popMatrix();

  fill(200,200,0);
  translate(width/2,height/2,0);
  lights();
  directionalLight(100, 0, 200, 100, 100, 0);
  pointLight(51, 102, 126, 35, 40, 36);
  rotateX( radians(15+frameCount/2));
  rotateY( radians(15*frameCount));
  box(100);
  pushMatrix();
    fill(0,175,200);
    translate(0,100,0);
    sphere(100);
  popMatrix();
  
  pushMatrix();
    fill(100,0,200);
    translate(100,100,0);
    sphere(75);
   popMatrix();
   
  pushMatrix();
    fill(100,0,0);
    translate(0,100,100);
    sphere(50);
   popMatrix();
   
 pushMatrix();
    fill(255,0,255);
    translate(0,200,100);
    box(75);
  popMatrix();
    
  pushMatrix();
    fill(130,206,335);
    translate(150,0,100);
    box(120);
  popMatrix();
  
  
 pushMatrix();
    fill(20,252,20);
    translate(-100,100,200);
    box(50);
  popMatrix();
  
  
   pushMatrix();
    fill(0);
    translate(-150,100,200);
    sphere(50);
  popMatrix();
  
   pushMatrix();
    fill(0);
    translate(-100,0,0);
    box(75);
  popMatrix();
  
  
}


