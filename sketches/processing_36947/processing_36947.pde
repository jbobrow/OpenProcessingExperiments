
//homework4
//Joel McCullough copyright Sept 8,2011 Pittsburgh PA,15221
//instructions to operate
//grow/shrink== UP/DOWN
//change color of initials: shift+j "J"
//                          shift+d "D"
//                          shift+m "M"
//reset colors == spacebar
//move:clickmouse on screen == position logo


float x, y, wd, ht,r,g,b,h,c,i,w,a,s;





void setup()
{
size (400, 400);
smooth();
noCursor();

strokeWeight(10);
x=200;
y=200;
wd=300;
ht=300;

//j initial color value
w=0;
a=0;
s=0;
//d initial color value
h=255;
c=255;
i=255;
//m initial color value
r=0;
g=0;
b=0;




}
void draw()
{

  
  noStroke();
background(255);  
 //changing background
 
if (x<wd/2)
{
fill(0); 
rect(0,0,400,400);
}

else if(x>wd/2)
{
  if(x<3*wd/4)
  {
    fill(127,51,107);
    triangle(200,0,400,400,400,0);
    fill(62,165,134);
    triangle(0,0,400,400,0,400);
    fill(121,127,121);
    triangle(0,0,400,400,200,0);
    triangle(0,100,400,400,0,300);
  }
  if(x>3*wd/4)
  {
    fill(0);
    rect(0,0,400,400);
  }
}
else if(y>ht/2)
{
   fill(51,60,28);
    rect(100,0,300,200);
    fill(76,72,53);
    rect(0,0,100,400);
    fill(62,165,134);
    rect(100,200,300,200);
  if(y>3*ht/4)
    {
   
    fill(47,41,51);
    triangle(0,0,400,0,400,250);
    triangle(0,0,0,400,100,400);
    triangle(100,400,400,250,400,400);
    }
   if(y<3*ht/4)
   {
     fill(20,51,8);
    triangle(0,0,400,0,400,250);
    triangle(0,0,0,400,100,400);
    triangle(100,400,400,250,400,400);
   }
   
}
else if (y<ht)
{
  fill(101,46,34);
  rect(0,0,400,400);
}

if(wd<200)
{
  fill(139,166,116);
  rect(0,0,400,400);
  fill(120,140,100);
  ellipse(300,200,200,200);
  ellipse(0,0,100,100);
  ellipse(0,400,300,300);
  ellipse(400,0,200,200);
  ellipse(130,100,120,120);
  ellipse(30,200,100,100);
  ellipse(400,400,300,300);
  ellipse(220,350,50,50);
} 


//background groups
fill(23,20,25);
//background
ellipse(0,400,wd/10,ht/10);
ellipse(0,350,wd/20,ht/20);
ellipse(0,300,wd/5,ht/5);
ellipse(0,250,wd/5,ht/5);
ellipse(0,200,wd/15,ht/15);
ellipse(0,150,wd/5,ht/5);
ellipse(0,100,wd/25,ht/25);
ellipse(0,50,wd/25,ht/25);
ellipse(0,0,wd/5,ht/5);
 //background
ellipse(50,0,wd/10,ht/10);
ellipse(50,50,wd/20,ht/20);
ellipse(50,100,wd/5,ht/5);
ellipse(50,150,wd/5,ht/5);
ellipse(50,200,wd/15,ht/15);
ellipse(50,250,wd/5,ht/5);
ellipse(50,300,wd/25,ht/25);
ellipse(50,350,wd/25,ht/25);
ellipse(50,400,wd/5,ht/5);
//background
ellipse(100,400,wd/10,ht/10);
ellipse(100,350,wd/20,ht/20);
ellipse(100,300,wd/5,ht/5);
ellipse(100,250,wd/5,ht/5);
ellipse(100,200,wd/15,ht/15);
ellipse(100,150,wd/5,ht/5);
ellipse(100,100,wd/25,ht/25);
ellipse(100,50,wd/25,ht/25);
ellipse(100,0,wd/5,ht/5);
//background
ellipse(150,0,wd/10,ht/10);
ellipse(150,50,wd/20,ht/20);
ellipse(150,100,wd/5,ht/5);
ellipse(150,150,wd/5,ht/5);
ellipse(150,200,wd/15,ht/15);
ellipse(150,250,wd/5,ht/5);
ellipse(150,300,wd/25,ht/25);
ellipse(150,350,wd/25,ht/25);
ellipse(150,400,wd/5,ht/5);
//background 
ellipse(200,400,wd/10,ht/10);
ellipse(200,350,wd/20,ht/20);
ellipse(200,300,wd/5,ht/5);
ellipse(200,250,wd/5,ht/5);
ellipse(200,200,wd/15,ht/15);
ellipse(200,150,wd/5,ht/5);
ellipse(200,100,wd/25,ht/25);
ellipse(200,50,wd/25,ht/25);
ellipse(200,0,wd/5,ht/5);
//background 
ellipse(250,0,wd/10,ht/10);
ellipse(250,50,wd/20,ht/20);
ellipse(250,100,wd/5,ht/5);
ellipse(250,150,wd/5,ht/5);
ellipse(250,200,wd/15,ht/15);
ellipse(250,250,wd/5,ht/5);
ellipse(250,300,wd/25,ht/25);
ellipse(250,350,wd/25,ht/25);
ellipse(250,400,wd/5,ht/5);
//background 
  ellipse(300,400,wd/10,ht/10);
  ellipse(300,350,wd/20,ht/20);
  ellipse(300,300,wd/5,ht/5);
  ellipse(300,250,wd/5,ht/5);
  ellipse(300,200,wd/15,ht/15);
  ellipse(300,150,wd/5,ht/5);
  ellipse(300,100,wd/25,ht/25);
  ellipse(300,50,wd/25,ht/25);
  ellipse(300,0,wd/5,ht/5);
 //background
  ellipse(350,0,wd/10,ht/10);
  ellipse(350,50,wd/20,ht/20);
  ellipse(350,100,wd/5,ht/5);
  ellipse(350,150,wd/5,ht/5);
  ellipse(350,200,wd/15,ht/15);
  ellipse(350,250,wd/5,ht/5);
  ellipse(350,300,wd/25,ht/25);
  ellipse(350,350,wd/25,ht/25);
  ellipse(350,400,wd/5,ht/5);
//background 
  ellipse(400,400,wd/10,ht/10);
  ellipse(400,350,wd/20,ht/20);
  ellipse(400,300,wd/5,ht/5);
  ellipse(400,250,wd/5,ht/5);
  ellipse(400,200,wd/15,ht/15);
  ellipse(400,150,wd/5,ht/5);
  ellipse(400,100,wd/25,ht/25);
  ellipse(400,50,wd/25,ht/25);
  ellipse(400,0,wd/5,ht/5);




fill(50,128,156);
ellipse(x,y,wd,ht);
fill(50,122,152);
ellipse(x,y,wd/1.5,ht);
fill(50,118,130);
ellipse(x,y,wd/2.5,ht);
fill(50,110,125);
ellipse(x,y,wd/3.5,ht);
fill(50,100,118);
ellipse(x,y,wd/4.5,ht);
fill(50,95,110);
ellipse(x,y,wd/5.5,ht);
fill(50,85,108);
ellipse(x,y,wd/6.5,ht);
fill(50,75,100);
ellipse(x,y,wd/7.5,ht);
fill(50,65,92);
ellipse(x,y,wd/8.5,ht);
fill(50,55,84);
ellipse(x,y,wd/9.5,ht);
fill(50,45,76);
ellipse(x,y,wd/10.5,ht);
 
fill(50,128,156);
ellipse(x,y,wd,ht);
fill(50,122,152);
ellipse(x,y,wd,ht/1.5);
fill(50,122,152);
ellipse(x,y,wd/1.5,ht);
fill(50,118,130);
ellipse(x,y,wd,ht/2.5);
fill(50,118,130);
ellipse(x,y,wd/2.5,ht);
fill(50,110,125);
ellipse(x,y,wd,ht/3.5);
fill(50,110,125);
ellipse(x,y,wd/3.5,ht);
fill(50,100,118);
ellipse(x,y,wd,ht/4.5);
fill(50,100,118);
ellipse(x,y,wd/4.5,ht);
fill(50,95,110);
ellipse(x,y,wd,ht/5.5);
fill(50,95,110);
ellipse(x,y,wd/5.5,ht);
fill(50,85,108);
ellipse(x,y,wd,ht/6.5);
fill(50,85,108);
ellipse(x,y,wd/6.5,ht);
fill(50,75,100);
ellipse(x,y,wd,ht/7.5);
fill(50,75,100);
ellipse(x,y,wd/7.5,ht);
fill(50,65,92);
ellipse(x,y,wd,ht/8.5);
fill(50,65,92);
ellipse(x,y,wd/8.5,ht);
fill(50,55,84);
ellipse(x,y,wd,ht/9.5);
fill(50,55,84);
ellipse(x,y,wd/9.5,ht);
fill(50,45,76);
ellipse(x,y,wd,ht/10.5);
fill(50,45,76);
ellipse(x,y,wd/10.5,ht);
fill(50,35,68);
ellipse(x,y,wd,ht/11.5);
fill(50,35,68);
ellipse(x,y,wd/11.5,ht);
fill(50,20,40);
ellipse(x,y,wd,ht/75.5);
fill(50,20,40);
ellipse(x,y,wd/75.5,ht);

noFill();

  beginShape();
    //j
      stroke(w,a,s);
      curveVertex(x-wd/5,y+ht/10);//1
      curveVertex(x-wd/2,y+ht/10);//1
      curveVertex(x-wd/7,y-ht/2);//4
      curveVertex(x-wd/6,y+ht/4);//5
      curveVertex(x-wd/2.2,y+ht/4);//3
      curveVertex(x+wd/10,y-ht/10);//2
      curveVertex(x+wd/10,y-ht/10);//2
     
  endShape();  

  beginShape();
     //d
     stroke(h,c,i);
     curveVertex(x,y-ht/2);
     curveVertex(x,y-ht/2);
     curveVertex(x,y);
     curveVertex(x+wd/4,y-ht/4);
     curveVertex(x,y-ht/2);
     curveVertex(x,y-ht/2);
  endShape();


  beginShape();
      //m
    stroke(r,g,b);
      curveVertex(x+wd/2.8,y+ht/3);//2
      curveVertex(x+wd/2.8,y+ht/3);//2
      curveVertex(x+wd/2.5,y-ht/3);//1
     curveVertex(x+wd/4,y-ht/8);//5
     curveVertex(x+wd/10,y-ht/2);//4
     curveVertex(x+wd/10,y+ht/2);//3
     curveVertex(x+wd/10,y+ht/2);//3
  endShape();
}

void keyPressed()
{
  if
  (keyCode == UP)
  {
    if(ht<400)
    {
      ht=ht+100;
    }
    if(wd<400)
    {
      wd=wd+100;
    }
  }
  else if(keyCode == DOWN)
  {
    if(ht>100)
    {
        ht=ht-100;
    }
    if(wd>100)
    {
        wd=wd-100;
    }
  }
  else if (keyCode == 'J')
  {
    w=57;
    a=207;
    s=46;
  }
  else if (keyCode == 'D')
  {
    h=120;
    c=50;
    i=3;  
  }
  else if(keyCode == 'M')
  {
    r=196 ;
    g=92 ;
    b=24;
  }
 
  else if(keyCode == ' ')
  {
    r=0;
    g=0;
    b=0;
    h=255;
    c=255;
    i=255;
    w=0;
    a=0;
    s=0;
  }
}

void mousePressed()
{
  x = mouseX;
  y = mouseY;
}
  
