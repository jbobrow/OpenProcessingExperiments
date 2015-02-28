
//Homework 6
//copyright Christina Lee September 2011 Pittsburgh, PA 15289
float xx, yy, wd, ht; 

void setup ()
{
  size (400, 400);
  smooth ( );
  xx = 250;
  yy = 250;  
  wd = 400;  
  ht = 400;
}


void draw( )
{  
  background(0, 0, 0); 
  float xx=0;
  float  yy=0;
  while (xx<=width)
  { 

    while (yy <= height)
    {  
      xx = xx+10;   
      yy = yy+10;
      int adder = -90*8;
      while(adder<=90*8){
        initials(xx, yy+adder, 40, 40);
        adder+=90;
      }
    }
  }
  initials(200, 200, mouseX, mouseY);
}

//defining initials function
void initials (float xx, float yy, float wd, float ht)
{ 
  noFill();
  strokeWeight(3);
  stroke(0, 255, 255);  
  beginShape();  
  curveVertex(xx-0.4*wd, yy-0.2*ht);  
  curveVertex(xx-0.2*wd, yy-0.2*ht);  
  curveVertex(xx-.3*wd, yy-0.3*ht);  
  curveVertex(xx-0.5*wd, yy-0*ht);  
  curveVertex(xx-0.3*wd, yy+0.3*ht);  
  curveVertex(xx-0.2*wd, yy+0.2*ht);  
  curveVertex(xx-0.4*wd, yy+0.4*ht);  
  endShape();  
  stroke(255, 0, 255);  
  ellipse(xx-5, yy, 0.3*wd, ht);  
  beginShape();  
  curveVertex(xx+0.14*wd, yy-0*ht);  
  curveVertex(xx+0.14*wd, yy-0*ht);  
  curveVertex(xx+0.16*wd, yy+0.25*ht);  
  curveVertex(xx+0.2*wd, yy+0.45*ht);  
  curveVertex(xx+0.2*wd, yy+0.45*ht);  
  endShape();  
  beginShape();  
  curveVertex(xx+0.14*wd, yy-0*ht);  
  curveVertex(xx+0.14*wd, yy-0*ht);  
  curveVertex(xx+0.145*wd, yy-0.25*ht);  
  curveVertex(xx+0.15*wd, yy-0.48*ht);  
  curveVertex(xx+0.16*wd, yy-0.48*ht);  
  endShape();  
  stroke(255, 255, 0);  
  beginShape();  
  curveVertex(xx+0.2*wd, yy-0.45*ht);  
  curveVertex(xx+0.2*wd, yy-0.45*ht);  
  curveVertex(xx+0.2*wd, yy+0.3*ht);  
  curveVertex(xx+0.2*wd, yy+0.3*ht);  
  endShape();  
  beginShape();  
  curveVertex(xx+0.2*wd, yy+0.3*ht);  
  curveVertex(xx+0.2*wd, yy+0.3*ht);  
  curveVertex(xx+0.4*wd, yy+0.3*ht);  
  curveVertex(xx+0.4*wd, yy+0.3*ht);  
  endShape();
}
                
