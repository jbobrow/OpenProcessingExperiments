
//post stuff on openprocessing.org
float x=width*.5;
float y=height*.5;
float d=width*.5;
float cx=100;
float cy=100;
float ix=200;
float iy=200;
float ex=300;
float ey=300;
float chigh=200;
float ihigh=200;
float dey=-random(2);
float dex=-random(2);

//float ctx, cty, cdim, itx, ity, idim, etx, ety, edim;
void setup()
{
   size(400, 400);
  background(201, 21, 229);
  noStroke();
  fill(49, 211, 77);
 // frameRate(1);
//  ellipse(200, 200, 20, 200);
//  //itx=;
//  //ity=;
//  //idim=;
//  ellipse(100, 100, 100, 200);
//  fill(201, 21, 229);
//  ellipse(132, 100, 100, 150);
//  //ctx=;
//  //cty=;
//  //cdim;
//  fill(49, 211, 77);
//  ellipse(300, 300, 100, 200);
//  fill(201, 21, 229);
//  ellipse(332, 300, 100, 150);
//  fill(49, 211, 77);
//  ellipse(300, 300, 80, 20);
//  //etx=;
//  //ety=;
//  //edim=;
//  fill(27, 209, 240);
//  ellipse(360, 50, 20, 20);
//  ellipse(300, 100, 20, 20);
//  ellipse(240, 50, 20, 20);
//  ellipse(100, 300, 20, 20);
//  ellipse(40, 350, 20, 20);
//  ellipse(140, 350, 20, 20);

}

void draw()
{
  background(201, 21, 229);

  fill(49, 211, 77);
  fill(49, 211, 77);
  ellipse(ex, ey, 100, 200);
  fill(201, 21, 229);
  ellipse(ex+32, ey, 100, 150);
  fill(49, 211, 77);
  ellipse(ex, ey, 80, 20);
  //etx=;
  //ety=;
  //edim=;
  ellipse(ix, iy, 20, ihigh);
  //itx=;
  //ity=;
  //idim=;
  ellipse(cx, cy, 100, chigh);
  fill(201, 21, 229);
  ellipse(cx+32, cy, 100, chigh-50);
  //ctx=;
  //cty=;
  //cdim;
  
  fill(random(255), random(255), random(255));
  ellipse(360, 50, 20, 20);
  ellipse(300, 100, 20, 20);
  ellipse(240, 50, 20, 20);
  ellipse(100, 300, 20, 20);
  ellipse(40, 350, 20, 20);
  ellipse(140, 350, 20, 20);
  
  cy = cy + 1;
  if (cy == height+chigh/2)
  {
   cy = -chigh/2; 
  }
  iy=iy-1;
  if(iy==-ihigh/2)
  {
    iy=height+ihigh/2;
  }
  ex=ex+dex;
  if (ey>height || ey<0)
  {
   dey=-1*dey; 
  }
    ey=ey+dey;

  if (ex>width || ex<0)
  {
   dex=-1*dex; 
  }
}




