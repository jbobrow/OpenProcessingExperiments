
int b = 80;
int n = 10;
int c = 10;
 
void setup()
{
  size(250,250,P3D);//P3D=3d rendering
  background(255);
  smooth();
}
  
void draw()
{
  background(255);
  translate(80,60);
  rotateZ(HALF_PI);
  fill(0);
for (int i=5; i< b; i+=1)
{
   rotateZ((mouseX-800)*0.1); //rotation in radians (Z axis)
   rotateX((mouseX-800)*0.1);  
   pushMatrix();
      for (int j=0; j< n; j+=1)
      {
        fill(j*100,j*20,j*50,900);
        noStroke();
        rect(0,0,c,c);
        box(c);
        translate(20,10,20);
        rotateY((mouseX-125)*0.1);
        rotateX((mouseY-125)*0.1);
        scale(1);
      }
   popMatrix();
   rotate(TWO_PI/b);
}





{
   rotateZ((mouseX-800)*0.1); //rotation in radians (Z axis)
   rotateX((mouseX-800)*0.1);  
   pushMatrix();
      for (int j=0; j< n; j+=1)
      {
        fill(j*10,j*2,j*5,90);
        noStroke();
        rect(0,0,c,c);
        box(c);
        translate(90,30,80);
        rotateY((mouseX-125)*0.6);
        rotateX((mouseY-125)*0.6);
        scale(1);
      }
   popMatrix();
   rotate(PI/b);
}
 
 
 
 
 {
   rotateZ((mouseX-800)*0.1); //rotation in radians (Z axis)
   rotateX((mouseX-800)*0.1);  
   pushMatrix();
      for (int j=0; j< n; j+=1)
      {
        fill(j*700,j*25,j*58,95);
        noStroke();
        rect(0,0,c,c);
        box(c);
        translate(130,70,100);
        rotateY((mouseX-125)*0.6);
        rotateX((mouseY-125)*0.6);
        scale(1);
      }
   popMatrix();
   rotate(PI/b);
}
 


 
}








