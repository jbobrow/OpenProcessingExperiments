
int b = 12;
int n = 200;
int c = 15;

void setup()
{
  size(250,250,P3D);//P3D=3d rendering
  background(255);
  smooth();
}
 
void draw()
{
  background(255);
  translate(125,125); 
  rotateZ(HALF_PI); 
  fill(0);
for (int i=0; i< b; i+=1)
{
   rotateZ((mouseX-125)*0.01); //rotation in radians (Z axis)
   rotateX((mouseX-125)*0.01);   
   pushMatrix(); 
      for (int j=0; j< n; j+=1)
      { 
        fill(j*10,j*2,j*5,90);
        noStroke();
        rect(0,0,c,c);
        box(c);
        translate(20,10,20); 
        rotateY((mouseX-125)*0.1); 
        rotateX((mouseY-125)*0.1); 
        scale(0.8);
}
   popMatrix();
   rotate(TWO_PI/b);
}
 
}


