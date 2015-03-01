
size(615,500);
background(215,255,174);

//Run first as written (x=1), then change the value of x to any other integer and run.
int x = 1; 


//neck + head
fill(255,162,182);
strokeWeight(2);
rect(240,400,60,200);
ellipse(280,270,280,330); 

//hair
noStroke();
fill(100,50,0);
triangle(210,130,215,177,270,110);
triangle(220,130,234,177,250,110);
triangle(240,140,260,175,270,135);
triangle(255,150,290,175,310,140);
triangle(300,140,310,175,320,140);
triangle(315,140,325,183,345,140);
triangle(335,120,345,183,370,140);


//hat pt 1
noStroke();
fill(240,174,255);
 ellipse(285,130,150,50);
 fill(157, 0, 178);
 ellipse(285,120,140,50);
fill(240,174,255);
 ellipse(285,110,130,50);
  fill(157, 0, 178);
 ellipse(285,100,120,50);
 fill(240,174,255);
 ellipse(285,90,110,50);
 fill(157, 0, 178);
 ellipse(285,80,100,50);
fill(240,174,255);
 ellipse(285,70,90,50);
 fill(157, 0, 178);
 ellipse(285,60,80,50);
fill(240,174,255);
 ellipse(285,50,70,50);
 fill(157, 0, 178);
 ellipse(285,40,60,50);
fill(240,174,255);
 ellipse(285,30,50,50);
  fill(157, 0, 178);
 ellipse(285,20,40,50);
 fill(240,174,255);
 ellipse(285,10,30,40);
  fill(157, 0, 178);
 ellipse(285,0,20,40);

 
 //nose
strokeWeight(4);
stroke(0);
line(305,240,320,275);
line(320,275,295,275);

//cheeks
for(int i=7; i<=36;i=i+3)
{
if(x==1)
{
  noStroke();
fill(163,192,15,i+20);
  ellipse(180,300,i-5,i-5);
  ellipse(390,300,i-5,i-5);
}
}
//fun
for(int i=0; i<=40;i=i+5)
{
  if(x == 1){
  stroke(0);
  strokeWeight(1);
  fill(156,173,219,3*i);
  ellipse(230,210,i,i);//left eye
  ellipse(360,210,i,i);//right eye
  strokeWeight(4);
  stroke(0);
  fill(255);
  ellipse(230,210,5,5);//left pupil
  ellipse(360,210,5,5);//left pupil
  line(290,360,310,380);//mouth
  line(310,360,290,380);//mouth
  
  }
else if (x!=1) 
{
  stroke(0);
  strokeWeight(4);
  line(220,210,240,230);
  line(240,210,220,230);
  line(350,210,370,230);
  line(370,210,350,230);
  strokeWeight(1);
  fill(0);
  triangle(300,350,403,355,363,405);
  
  //chunks
  fill(135,90,7,185);
  noStroke();
  ellipse(400,380,i-8,i-10);
  ellipse(450,400,i-7,i-12);
   ellipse(467,385,i-10,i-10);
  ellipse(475,450,i-8,i-10);
   ellipse(489,440,i-9,i-10);
  ellipse(500,480,i-10,i-10);
    ellipse(540,390,i-10,i-10);
   ellipse(542,440,i-10,i-10);
  ellipse(535,488,i-10,i-10);
      ellipse(440,488,i-10,i-10);
   ellipse(460,490,i-10,i-10);
  ellipse(470,400,i-10,i-10);
      ellipse(540,390,i-10,i-10);
   ellipse(432,440,i-10,i-10);
  ellipse(420,458,i-10,i-10);
      ellipse(410,400,i-10,i-10);
   ellipse(542,440,i-10,i-10);
  ellipse(535,488,i-10,i-10);
  
  fill(130,135,7,200);
    ellipse(420,400,i-10,i-10);
  ellipse(470,380,i-10,i-10);
   ellipse(537,440,i-10,i-10);
  ellipse(485,490,i-10,i-10);
   ellipse(498,440,i-10,i-10);
  ellipse(480,435,i-10,i-10);
    ellipse(512,490,i-10,i-10);
   ellipse(442,540,i-10,i-10);
  ellipse(485,490,i-10,i-10);
      ellipse(415,478,i-10,i-10);
   ellipse(464,498,i-10,i-10);
  ellipse(473,412,i-10,i-10);
      ellipse(555,410,i-10,i-10);
   ellipse(442,430,i-10,i-10);
  ellipse(460,478,i-10,i-10);
      ellipse(400,500,i-10,i-10);
   ellipse(502,440,i-10,i-10);
  ellipse(512,468,i-10,i-10);
  
}
}
print(x);
