
float a = 100;

void setup() 
{
  size(300, 300);
  stroke(255);
}

void draw() 


{
  background(255,90,70);
  a = a - 3.5;
 {if (mousePressed) 
{ 
  if (a < 0) { 
    a = height; 
  }
stroke(0); 
fill(0);

ellipse(a,78,9,9);
ellipse(a,39,9,9);
ellipse(a,109,9,9);
ellipse(a,139,9,9);

ellipse(a,179,9,9);
ellipse(a,209,9,9);
ellipse(a,239,9,9);
ellipse(a,279,9,9);

} else{
   if (a < 0) { 
    a = height; 
  }

stroke (100,10,250);
fill (0);
rect (a,49,9,9);
rect (a,89,9,9);
rect(a,119,9,9);
rect(a,149,9,9);
rect(a,179,9,9);
rect(a,209,9,9);
rect(a,239,9,9);
rect(a,279,9,9);
 }
}

}

