
/* HW 4
Sahana Kumar sahana@cmu.edu 
copyright Sahana Kumar 2013*/
float a, x, b, c, easingCoef;
void setup ()
{
   size(400, 400);
  smooth();
  easingCoef= .05;


}

void draw ()
{ 
  
  
  
  
  background(a);
  
 x = 20;
 
 fill(244, 100, 2);
  beginShape();
  vertex((x*0), (x*15));
  vertex(x*20, (x*15));
  vertex((x*20), (x*20));
  vertex(x*0,x*20);
  endShape();
  
   fill(147,33,122);
  beginShape();
  vertex((x*9.5), (x*9.2));
  vertex((x*10.2), (x*9.2));
  vertex((x*10.2), (x*5));
  vertex((x*9.5), (x*5));
  vertex((x*9.5), (x*9.2));
  endShape();
  
    fill( b);
  beginShape();
  curveVertex((x*16), (x*10)); //control
  curveVertex((x*15), (x*11));
  curveVertex((x*10), (x*9));
  curveVertex((x*5), (x*11));
  curveVertex((x*4), (x*12)); //control
  endShape();
  
    noStroke();
  fill(211, 161,107);
  beginShape();
  vertex((x*6), (x*17));
  vertex((x*14), (x*17));
  vertex((x*15), (x*11));
  vertex((x*5), (x*11));
  vertex((x*6), (x*17));
  endShape();
  
  fill(227,234,31);
  beginShape();
  curveVertex((x*10.4), (x*5)); //control
  curveVertex((x*9.84), (x*5)); //start
  curveVertex((x*10.24 ), (x*4)); //curve right
  curveVertex((x*9.84), (x*3)); //top
  curveVertex((x*9.44), (x*4));//curve left
   curveVertex((x*9.84), (x*5)); //end
   curveVertex((x*10.2), (x*5)); //control
  endShape();
  
 
 

  
 // fill(203,6,148);
  //noStroke();
  //line(mouseX,mouseY,20,20); 
  
 if(mousePressed==true)
  {
    beginShape();
    //stroke(203,6,148);
    line(mouseX, mouseY, pmouseX, pmouseY);
    
    //smooth();
   }
   
  if(mousePressed==false)
  { fill(203,6,148);
    ellipse(mouseX,mouseY,30,30);
   
   // smooth();
     
  }



}


  
void keyPressed()
{if (key == ' ')

  a = (random(500));
  b = (random(10,200));
  c = (random(100,400));
  
 
}    

//saveFrame("cupcake.jpg");



