
  //JiYoung Lee
  //HW11
  //Copyright @ Jiyoung Lee
  
  
  
  int alphaX;
  float Xtran, Ytran, Ztran,Xrot, Yrot, Zrot;
  color c,d;
  
  
  
void setup()
{
  size(400,400,P3D);
  background(0);
  Xtran = width;
  Ytran = height;
  Ztran = height;
  Xrot=alphaX;
  Yrot=0;
  Zrot=0;
  c= color (255,210,155);
  d= color(219,213,206);
}

void draw()
{
  rect(0,0,width,height);
  fill(0);
  drawbird(Xtran, Ytran , Ztran , Xrot, Yrot, Zrot, c);
  Xrot++;
}

void drawbird(float Xtran, float Ytran , float Ztran , float Xrot,float Yrot, float Zrot,color c)
{
  directionalLight(126,126,126,0,0,-1);
  ambientLight(150,150,150);
  

  //face
  translate(Xtran/2,Ytran/2,Ztran/2);
rotateY(radians(Xrot));
  noStroke();
  fill(c);
  sphere(Xtran/10);

//eye
pushMatrix();
fill(0);
translate(0/Xtran,0/Ytran,Ztran*.1);
sphere(Xtran/140);
popMatrix();

//eye
pushMatrix();
fill(0);
translate(Xtran/20,0/Ytran,Ztran*.09);
sphere(Xtran/140);
popMatrix();

//teeth
pushMatrix();
fill(d);
translate(Xtran/65,Ytran/20,Ztran*.08);
box(Xtran/80,Xtran/(400/7),Xtran/(400/10));
popMatrix();

//teeth
pushMatrix();
fill(d);
translate(Xtran/30,Ytran/20,Ztran*.08);
box(Xtran/80,Xtran/(400/7),Xtran/(400/10));
popMatrix();


//ear
pushMatrix();
fill(c);
translate(-Xtran/14,0/Ztran,Ztran*.07);
sphere(Xtran/75);
popMatrix();
//ear
pushMatrix();
fill(c);
translate(Xtran/10,0/Ytran,0/Ztran);
sphere(Xtran/75);
popMatrix();

//background
pushMatrix();
fill(255);
translate(0,0,0);
sphere(Xtran/75);
popMatrix();



}



