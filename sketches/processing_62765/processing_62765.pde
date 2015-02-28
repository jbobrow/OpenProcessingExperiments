
float a = 100;

void setup() 
{
  size(1040, 800);
  stroke(255);
}

void draw() 
{
  background(255);
  a = a - 3.5;
 {if (mousePressed) 
{ 
  if (a < 0) { 
    a = height; 
  }
stroke(0); 
fill(0);
line(0,39,width,a);
line(0,50,width,a);
line(0,a,width,10);
line(0,a,width,98);
ellipse(a,78,9,9);

} else{
   if (a < 0) { 
    a = height; 
  }

stroke (100,10,250);
line (0,a,width,50);
line (0,a,width,90);
line(0,40,width,a);
line(0,100,width,a);
 }
}

}

