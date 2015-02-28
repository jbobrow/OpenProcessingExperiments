
size(400,400);
noStroke();
smooth();

boolean r=true;

if(r==true)
{

for(int i=0;i<400;i=i+10)
{
  ellipse(i,i,20,20);
}

for(int x=0;x<200;x=x+20)
{
  triangle(x,400-x,x+20,400-x,x+10,380-x);
}

triangle(200,0,400,0,400,200);

quad(100,0,150,0,400,250,400,300);

stroke(0);
strokeWeight(1);
for(int i=0;i<50;i=i+5)
{
  line(i,400,400,i);
  line(0,400-i,400-i,0);
}


fill(#FF0000);
stroke(0);
strokeWeight(2);
for(int i=120;i>0;i=i-10)
{
  ellipse(200,200,i,i);
}

noFill();
stroke(#800000);
strokeWeight(20);
ellipse(200,200,300,300);

}
else
{
  fill(0);
  ellipse(200,200,200,200);
}


for(int a=0;a<400;a+=30)
{
  for(int j=350;j<400;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(a,j,2,2);
  }
}
for(int a=15;a<400;a+=30)
{
  for(int j=300;j<400;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(a,j,2,2);
  }
}
for(int a=0;a<400;a+=30)
{
  for(int j=0;j<50;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(a,j,2,2);
  }
}
for(int a=15;a<400;a+=30)
{
  for(int j=0;j<100;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(a,j,2,2);
  }
}

for(int a=0;a<400;a+=30)
{
  for(int j=0;j<50;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(j,a,2,2);
  }
}
for(int a=15;a<400;a+=30)
{
  for(int j=0;j<100;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(j,a,2,2);
  }
}

for(int a=0;a<400;a+=30)
{
  for(int j=350;j<400;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(j,a,2,2);
  }
}
for(int a=15;a<400;a+=30)
{
  for(int j=300;j<400;j+=5)
  {
    noStroke();
    fill(#3366FF);
    ellipse(j,a,2,2);
  }
}


