
size(200,200);
background(240,60,60);
noStroke();
//castle base
fill(255,20,20);//bright red
rect(180,180,20,20);
rect(140,180,20,20);
rect(60,180,20,20);
fill(255,140,0);//yellow orange
rect(160,180,20,20);
rect(140,160,20,20);
rect(80,180,20,20);
rect(40,180,20,20);
rect(45,165,15,15);//small wiered one next too tower 2
triangle(55,140,70,120,85,140);
fill(200,20,20);//dark red
rect(160,160,20,20);
rect(100,160,20,20);
rect(60,160,20,20);
rect(60,140,20,20);
fill(255,50,50);//pink
rect(180,160,20,20);
rect(100,180,20,20);
rect(80,160,20,20);


//tower 
fill(255,102,0);//orange
triangle(115,120,130,100,145,120);
rect(120,180,20,20);
rect(120,140,20,20);
fill(250,10,10);//strong red
rect(120,160,20,20);
rect(120,120,20,20);

//sky
fill(240,240,0);//bright yellow
ellipse(0,0,70,80);//the sun
ellipse(0,50,10,50);//ray #1 
//ray #2
{
  smooth();
pushMatrix();
translate(20,60);
rotate(radians(-20));
ellipse(0,0,10,50);
popMatrix();}
//ray #3
{
  smooth();
pushMatrix();
translate(30,40);
rotate(radians(-35));
ellipse(0,0,10,50);
popMatrix();}
//ray #4
{
  pushMatrix();
  translate(40+5,30-5);
  rotate(radians(-50));
  ellipse(0,0,10,50);
  popMatrix();}
//the moooooonnnnn
fill(10,10,255);
ellipse(200,0,75,100);
//random rectangles
fill(255,0,0);//red
rect(20,160,10,30);
fill(255,140,0);//yellow orange
rect(100,110,10,30);
rect(105,60,10,30);
fill(200,130,130);//some pink
rect(155,100,10,30);
fill(255,255,0);
rect(167,70,10,30);
//why does this line not appear??
fill(255);
line(100,0,100,200);
//???


