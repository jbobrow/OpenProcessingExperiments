
size(400,400);
background(250);
int a = 400;
int b = 50;
for (int i=400; i>=0; i=i-50)
{
  for (int r=0; r<=400; r=r+50)
  for (int c=0; c<=6; c=c+1){
  {
    float x=random(255);
    float y=random(255);
    float z=random(255);
 
    stroke(0);
pushMatrix();
noStroke();
 
fill(71,84,119);
rect(0,0,400,400);
rotate(PI/24);
translate(25,-30);
 
fill(239,239,239);
rect(22,25,355,355);
rotate(PI/24);
translate(25,-25);
 
fill(71,84,119);
rect(42,42,295,296);
rotate(PI/24);
translate(25,-25);
 
fill(239,239,239);
rect(59,58,271,268);
rotate(PI/12);
translate(50,-50);
 
fill(71,84,119);
rect(73,72,201,205);
rotate(PI/6);
translate(70,-100);
 
fill(239,239,239);
rect(85,85,184,175);
 
fill(71,84,119);
translate(-25,-25);
triangle(125,200,275,200,200,125);
triangle(150,210,250,210,200,260);
fill(239,239,239,15);
 
rect(185,-100,30,600);
rect(r,-100,30,600);
rect(i,-100,30,600);
rect(x,-100,30,600);
rect(y,-100,30,600);
 
 
popMatrix();
  }
}
}

