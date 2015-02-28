
PImage img2;
float x,y,z,vx,vy,vz;

void setup()
{
  size(500, 500, P3D);
  background(random(1,200), 100, 190, 10);
  img2 =loadImage("torts.png");
  x = random(width);
  y = random(height);
  z = random(-100,100);
  vx = random(-1,1);
  vy = random(-1,1);
  vz = random(-1,1);

  smooth();
}

void draw()

{

  /*
  noStroke();
   beginShape();
   texture(img);
   vertex( random (-100, 900), random (-100, 900), 0, 0);
   vertex(random (-100, 900), random (-100, 900), 200, 0); 
   vertex(random (-100, 900), random (-100, 900), 200, 400);
   vertex(random (-100, 900), random (-100, 900), 0, 200);  
   endShape();
   */
  directionalLight(noise(x, y)*100,noise(x, y)*100,noise(x, y)*100, 0, 0, -1);
  lightSpecular(204, 204, 204);
  directionalLight(102, 102, 102, 0, 1, -1);
  lightSpecular(102, 102, 102);

  

  fill(255);





 


//FUNCTION NOISE

x = x+vx;
y = y+vy;
z = z+vz;

vx+= noise(x*.1, y*1,   frameCount*.0003+mouseX)-.5;
vy+=  noise(y*.1,x*.1,frameCount*.0003+mouseY)-.5;
vz+=  noise(y*.1,x*.1,frameCount*.0003)-.5;

if(x < 0)
  {
    x = 0;
    vx*=-1;
  }
  if(x > width)
  {
    x = width;
    vx*=-1;
  }
  
  
  if(y < 0)
  {
    y = 0;
    vy*=-1;
  }
  if(y > height)
  {
    y = height;
    vy*=-1;
  }  
  
  
    if(z < 0)
  {
    z = 0;
    vz*=-1;
  }
  if(z > 150)
  {
    z = 150;
    vz*=-1;
  }  
  
  //END FUNCTION
  
  


 //box9
  pushMatrix();
  translate(20000, 450, 100);
  rotateY(frameCount*-.002);
  scale(100, 100);
  make_box();
  popMatrix();
  
    //box10
  pushMatrix();
  translate(x/6+(mouseX), y/8+(mouseY));
  fill(255);
  noStroke();
  rotateX(frameCount*.04);
  rotateZ(frameCount*-.003);
scale(x/5,y/5,z/5);
  make_cube();

  popMatrix(); 



}

//CUBE MAKING FUNCTION
void make_cube()
{

  pushMatrix();
  translate(0, 0, 1);
  beginShape();
  texture(img2);
  vertex(-1, -1, 0, 0, 0);
  vertex(1, -1, 0,1, 0);
  vertex(1, 1, 0, 1, 1);
  vertex(-1, 1, 0,0,1);
  endShape();
  popMatrix();
  //first face (front)...\

  //back face...
  beginShape();
  texture(img2);
  vertex(-1, -1, -1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape();

  //side face ??
  pushMatrix();
  rotateY(PI/2);
  beginShape();
  texture(img2);
vertex(-1, -1, -1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape();
  popMatrix();

  pushMatrix();
  rotateY(-PI/2);
  beginShape();
  texture(img2);
  
  vertex(-1, -1, -1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape();
  popMatrix();


  pushMatrix();
  rotateX(-PI/2);
  beginShape();
  texture(img2);
  vertex(-1, -1, -1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape();
  popMatrix();

  pushMatrix();
  rotateX(PI/2);
  beginShape();
  texture(img2);
  vertex(-1, -1, -1,0,0);
  vertex(1, -1, -1,1,0);
  vertex(1, 1, -1,1,1);
  vertex(-1, 1, -1,0,1);
  endShape();
  popMatrix();
}

// BOX MAKING FUNCTION
void make_box()
{

  textureMode(NORMALIZED);
  pushMatrix();
  translate(0, 0, 1);
  beginShape();
  texture(img2);
  vertex(-1, -1, 0, random(0, 1), random(0, 1));
  vertex(1, -1, 0, random(0, 1), random(0, 1));
  vertex(1, 1, 0, random(0, 1), random(0, 1));
  vertex(-1, 1, 0, random(0, 1), random(0, 1));
  endShape();
  popMatrix();
  //first face (front)...\

  //back face...
  beginShape();
  texture(img2);
  vertex(-1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, 1, -1, random(0, 1), random(0, 1));
  vertex(-1, 1, -1, random(0, 1), random(0, 1));
  endShape();

  //side face ??
  pushMatrix();
  rotateY(PI/2);
  beginShape();
  texture(img2);
  vertex(-1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, 1, -1, random(0, 1), random(0, 1));
  vertex(-1, 1, -1, random(0, 1), random(0, 1));
  endShape();
  popMatrix();

  pushMatrix();
  rotateY(-PI/2);
  beginShape();
  texture(img2);
  vertex(-1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, 1, -1, random(0, 1), random(0, 1));
  vertex(-1, 1, -1, random(0, 1), random(0, 1));
  endShape();
  popMatrix();


  pushMatrix();
  rotateX(-PI/2);
  beginShape();
  texture(img2);
  vertex(-1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, 1, -1, random(0, 1), random(0, 1));
  vertex(-1, 1, -1, random(0, 1), random(0, 1));
  endShape();
  popMatrix();

  pushMatrix();
  rotateX(PI/2);
  beginShape();
  texture(img2);
  vertex(-1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, -1, -1, random(0, 1), random(0, 1));
  vertex(1, 1, -1, random(0, 1), random(0, 1));
  vertex(-1, 1, -1, random(0, 1), random(0, 1));
  endShape();
  popMatrix();
}


