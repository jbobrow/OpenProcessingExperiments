
//suzanne choi,suzanne1
//hw11
//copyrights. 2013 suzanne choi. 

int alphaX;

float xtran, ytran, ztran, xrot, yrot, zrot;
color c;




void setup(){
 size (800, 800, P3D); 
 background(255);
 xtran=width;
 ytran=height;
 ztran=width;
 xrot=alphaX;
 yrot=0;
 zrot=0;
 c= color (227,164,5);

}

void draw(){
  rect(0,0,width,height);
  fill(255);
  drawBear(xtran,ytran,ztran,xrot,yrot,zrot,c);
  xrot++;

}


void drawBear(float x, float y, float z, float xrot, float yrot, float zrot,color c)
{
  directionalLight(255, 255, 255, 0, 0, -1);
  ambientLight(200,200,200);
  
 //head
  translate(x/2, y/2, z/z); 
  rotateY( radians(xrot) );

  noStroke();
  fill(c);
  sphere(x*.2);
  
 //nose 
pushMatrix();
  translate(x/x, y/y, z*.17);
  fill(c);
  sphere(x*.08);
popMatrix();
  //nose black
pushMatrix();
  fill(0);
  translate(x/x, y/y,z*.254);
  sphere(x*.006);
popMatrix();
//eyes1
pushMatrix();
  fill(0);
  translate(-x/8,-y/16, z*.14);
  sphere(x*.007);
popMatrix();

//ear1

pushMatrix();
  translate(-x/8, -y/6, z*.07);
  fill(c);
  sphere(x*.06);
popMatrix();


//eyes2
pushMatrix();
  fill(0);
  translate(x/8,-y/16, z*.14);
  sphere(x*.007);
popMatrix();
//ear2
pushMatrix();
  translate(x/8, -y/6, z*.07);
  fill(c);
  sphere(x*.06);
popMatrix();

}





