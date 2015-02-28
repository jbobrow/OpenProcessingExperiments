
//Homework 10, October 2011
//Copyright Manuela Kind, CMU Pittsburgh PA

//-----------setup------------

void setup()
{
size (300,300,P3D);
sphereDetail(25);
lights();
}

//------------draw------------

void draw()
{
background (100,200,100);
drawSpheres(); 
}

//--------spheres-M-----------
void drawSpheres()
{
fill(200,100,100,100);
stroke(255,150,150,150);

//left
pushMatrix();
translate(width*0.25, height*0.625,height*0.25);
 sphere(height/12);
popMatrix();

pushMatrix();
translate(width*0.25, height*0.5,height*0.125);
 sphere(height/12);
popMatrix();

pushMatrix();
translate(width*0.25, height*0.375,height-height);
 sphere(height/12);
popMatrix();

pushMatrix();
translate(width*0.25, height*0.25,height-height*1.125);
 sphere(height/12);
popMatrix();

//center

pushMatrix();
translate(width*0.375, height*0.375,height-height);
 sphere(height/12);
popMatrix();

pushMatrix();
translate(width*0.5, height*0.5,height*0.125);
 sphere(height/12);
popMatrix(); 

pushMatrix();
translate(width*0.625, height*0.375,height-height);
 sphere(height/12);
popMatrix();



//right
pushMatrix();
translate(width*0.75, height*0.25,height-height*1.125);
 sphere(height/12);
popMatrix(); 

pushMatrix();
translate(width*0.75, height*0.375,height-height);
 sphere(height/12);
popMatrix(); 

pushMatrix();
translate(width*0.75, height*0.5,height*0.125);
 sphere(height/12);
popMatrix(); 

pushMatrix();
translate(width*0.75, height*0.625,height*0.25);
 sphere(height/12);
popMatrix(); 

}

