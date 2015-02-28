
float a,b;
void setup ()
{
  size (600, 600);
  background ( 0,255,0);
  textSize (10);
  fill (220, 57, 20);
  a=400;
  b=100;
 frameRate(10);

}

void draw()

{
  smooth ();
  //cleanslate
  background (50,70,10);
 stroke (0);
 strokeWeight (2);
 //Spider Bodies
  ellipse (b, a, 35, 50);
  ellipse (2*b, a, 35, 50);
  ellipse (3*b, a, 35, 50);
  ellipse (4*b, a, 35, 50);
  ellipse (5*b, a, 35, 50);

//firstline
beginShape ();
 curveVertex (b, -5);
 curveVertex (b, 0);
 curveVertex (b, .33*a);
 curveVertex (b, .66*a);
 curveVertex (b, a);
 curveVertex (b, a+5);
endShape ();

//secondline
beginShape ();
 curveVertex (2*b, -5);
 curveVertex (2*b, 0);
 curveVertex (2*b, .33*a);
 curveVertex (2*b, .66*a);
 curveVertex (2*b, a);
 curveVertex (2*b, a+5);
endShape ();

//thirdline
beginShape ();
 curveVertex (3*b, -5);
 curveVertex (3*b, 0);
 curveVertex (3*b, .33*a);
 curveVertex (3*b, .66*a);
 curveVertex (3*b, a);
 curveVertex (3*b, a+5);
endShape ();

//fourthline
beginShape ();
 curveVertex (4*b, -5);
 curveVertex (4*b, 0);
 curveVertex (4*b, .33*a);
 curveVertex (4*b, .66*a);
 curveVertex (4*b, a);
 curveVertex (4*b, a+5);
endShape ();

//fifthline
beginShape ();
 curveVertex (5*b, -5);
 curveVertex (5*b, 0);
 curveVertex (5*b, .33*a);
 curveVertex (5*b, .66*a);
 curveVertex (5*b, a);
 curveVertex (5*b, a+5);
endShape ();
 //Spider Legs
 noFill();
    //Spider One
    beginShape ();
     curveVertex (b, a);
     curveVertex (b+2, a+2);
     curveVertex (b+30, a+5);
     curveVertex (b+40, a+23);
     curveVertex (b+50, a+30);
    endShape ();
    beginShape ();
     curveVertex (b, a);
     curveVertex (b+2, a+2);
     curveVertex (b+25, a+15);
     curveVertex (b+35, a+43);
     curveVertex (b+45, a+60);
    endShape ();
    beginShape ();
     curveVertex (b, a);
     curveVertex (b+2, a+2);
     curveVertex (b+15, a+15);
     curveVertex (b+25, a+63);
     curveVertex (b+35, a+80);
    endShape ();
    beginShape ();
     curveVertex (b, a);
     curveVertex (b+2, a+2);
     curveVertex (b+30, a-4);
     curveVertex (b+15, a+57);
     curveVertex (b+25, a+77);
    endShape ();
    
    beginShape ();
     curveVertex (b, a);
     curveVertex (b-2, a+2);
     curveVertex (b-30, a+5);
     curveVertex (b-40, a+23);
     curveVertex (b-50, a+30);
    endShape ();
     beginShape ();
     curveVertex (b, a);
     curveVertex (b-2, a+2);
     curveVertex (b-25, a+15);
     curveVertex (b-35, a+43);
     curveVertex (b-45, a+60);
    endShape ();
    beginShape ();
     curveVertex (b, a);
     curveVertex (b-2, a+2);
     curveVertex (b-15, a+15);
     curveVertex (b-25, a+63);
     curveVertex (b-35, a+80);
    endShape ();
    beginShape ();
     curveVertex (b, a);
     curveVertex (b-2, a+2);
     curveVertex (b-30, a-4);
     curveVertex (b-15, a+57);
     curveVertex (b-25, a+77);
    endShape ();
    
   //Spider Two
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b+2, a+2);
     curveVertex (2*b+30, a+5);
     curveVertex (2*b+40, a+23);
     curveVertex (2*b+50, a+30);
    endShape ();
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b+2, a+2);
     curveVertex (2*b+25, a+15);
     curveVertex (2*b+35, a+43);
     curveVertex (2*b+45, a+60);
    endShape ();
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b+2, a+2);
     curveVertex (2*b+15, a+15);
     curveVertex (2*b+25, a+63);
     curveVertex (2*b+35, a+80);
    endShape ();
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b+2, a+2);
     curveVertex (2*b+30, a-4);
     curveVertex (2*b+15, a+57);
     curveVertex (2*b+25, a+77);
    endShape ();
    
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b-2, a+2);
     curveVertex (2*b-30, a+5);
     curveVertex (2*b-40, a+23);
     curveVertex (2*b-50, a+30);
    endShape ();
     beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b-2, a+2);
     curveVertex (2*b-25, a+15);
     curveVertex (2*b-35, a+43);
     curveVertex (2*b-45, a+60);
    endShape ();
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b-2, a+2);
     curveVertex (2*b-15, a+15);
     curveVertex (2*b-25, a+63);
     curveVertex (2*b-35, a+80);
    endShape ();
    beginShape ();
     curveVertex (2*b, a);
     curveVertex (2*b-2, a+2);
     curveVertex (2*b-30, a-4);
     curveVertex (2*b-15, a+57);
     curveVertex (2*b-25, a+77);
    endShape ();
    
  //Spider Three
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b+2, a+2);
     curveVertex (3*b+30, a+5);
     curveVertex (3*b+40, a+23);
     curveVertex (3*b+50, a+30);
    endShape ();
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b+2, a+2);
     curveVertex (3*b+25, a+15);
     curveVertex (3*b+35, a+43);
     curveVertex (3*b+45, a+60);
    endShape ();
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b+2, a+2);
     curveVertex (3*b+15, a+15);
     curveVertex (3*b+25, a+63);
     curveVertex (3*b+35, a+80);
    endShape ();
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b+2, a+2);
     curveVertex (3*b+30, a-4);
     curveVertex (3*b+15, a+57);
     curveVertex (3*b+25, a+77);
    endShape ();
    
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b-2, a+2);
     curveVertex (3*b-30, a+5);
     curveVertex (3*b-40, a+23);
     curveVertex (3*b-50, a+30);
    endShape ();
     beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b-2, a+2);
     curveVertex (3*b-25, a+15);
     curveVertex (3*b-35, a+43);
     curveVertex (3*b-45, a+60);
    endShape ();
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b-2, a+2);
     curveVertex (3*b-15, a+15);
     curveVertex (3*b-25, a+63);
     curveVertex (3*b-35, a+80);
    endShape ();
    beginShape ();
     curveVertex (3*b, a);
     curveVertex (3*b-2, a+2);
     curveVertex (3*b-30, a-4);
     curveVertex (3*b-15, a+57);
     curveVertex (3*b-25, a+77);
    endShape ();
    
   //Spider Four
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b+2, a+2);
     curveVertex (4*b+30, a+5);
     curveVertex (4*b+40, a+23);
     curveVertex (4*b+50, a+30);
    endShape ();
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b+2, a+2);
     curveVertex (4*b+25, a+15);
     curveVertex (4*b+35, a+43);
     curveVertex (4*b+45, a+60);
    endShape ();
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b+2, a+2);
     curveVertex (4*b+15, a+15);
     curveVertex (4*b+25, a+63);
     curveVertex (4*b+35, a+80);
    endShape ();
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b+2, a+2);
     curveVertex (4*b+30, a-4);
     curveVertex (4*b+15, a+57);
     curveVertex (4*b+25, a+77);
    endShape ();
    
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b-2, a+2);
     curveVertex (4*b-30, a+5);
     curveVertex (4*b-40, a+23);
     curveVertex (4*b-50, a+30);
    endShape ();
     beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b-2, a+2);
     curveVertex (4*b-25, a+15);
     curveVertex (4*b-35, a+43);
     curveVertex (4*b-45, a+60);
    endShape ();
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b-2, a+2);
     curveVertex (4*b-15, a+15);
     curveVertex (4*b-25, a+63);
     curveVertex (4*b-35, a+80);
    endShape ();
    beginShape ();
     curveVertex (4*b, a);
     curveVertex (4*b-2, a+2);
     curveVertex (4*b-30, a-4);
     curveVertex (4*b-15, a+57);
     curveVertex (4*b-25, a+77);
    endShape ();
  
  
   //Spider Five
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b+2, a+2);
     curveVertex (5*b+30, a+5);
     curveVertex (5*b+40, a+23);
     curveVertex (5*b+50, a+30);
    endShape ();
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b+2, a+2);
     curveVertex (5*b+25, a+15);
     curveVertex (5*b+35, a+43);
     curveVertex (5*b+45, a+60);
    endShape ();
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b+2, a+2);
     curveVertex (5*b+15, a+15);
     curveVertex (5*b+25, a+63);
     curveVertex (5*b+35, a+80);
    endShape ();
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b+2, a+2);
     curveVertex (5*b+30, a-4);
     curveVertex (5*b+15, a+57);
     curveVertex (5*b+25, a+77);
    endShape ();
    
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b-2, a+2);
     curveVertex (5*b-30, a+5);
     curveVertex (5*b-40, a+23);
     curveVertex (5*b-50, a+30);
    endShape ();
     beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b-2, a+2);
     curveVertex (5*b-25, a+15);
     curveVertex (5*b-35, a+43);
     curveVertex (5*b-45, a+60);
    endShape ();
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b-2, a+2);
     curveVertex (5*b-15, a+15);
     curveVertex (5*b-25, a+63);
     curveVertex (5*b-35, a+80);
    endShape ();
    beginShape ();
     curveVertex (5*b, a);
     curveVertex (5*b-2, a+2);
     curveVertex (5*b-30, a-4);
     curveVertex (5*b-15, a+57);
     curveVertex (5*b-25, a+77);
    endShape ();
    
    //eyes
    fill (0,0,0);
    ellipse (b-5, a, 10, 10);
    ellipse (b+5, a, 10, 10);
    
    ellipse (2*b-5, a, 10, 10);
    ellipse (2*b+5, a, 10, 10);
    
    ellipse (3*b-5, a, 10, 10);
    ellipse (3*b+5, a, 10, 10);
    
    ellipse (4*b-5, a, 10, 10);
    ellipse (4*b+5, a, 10, 10);
    
    ellipse (5*b-5, a, 10, 10);
    ellipse (5*b+5, a, 10, 10);

}

void mouseMoved() {
if (mouseY < 300) 
{
 a=a+1;
}
else if (mouseY > 300) 
{
 a=a-1;
}
}

void mouseDragged() {
    fill (255,255,255);
    ellipse (b-5, a, 10, 10);
    ellipse (b+5, a, 10, 10);
    
    ellipse (2*b-5, a, 10, 10);
    ellipse (2*b+5, a, 10, 10);
    
    ellipse (3*b-5, a, 10, 10);
    ellipse (3*b+5, a, 10, 10);
    
    ellipse (4*b-5, a, 10, 10);
    ellipse (4*b+5, a, 10, 10);
    
    ellipse (5*b-5, a, 10, 10);
    ellipse (5*b+5, a, 10, 10);

}
void mousePressed() {
    fill (255,255,255);
    ellipse (b-5, a, 10, 10);
    ellipse (b+5, a, 10, 10);
    
    ellipse (2*b-5, a, 10, 10);
    ellipse (2*b+5, a, 10, 10);
    
    ellipse (3*b-5, a, 10, 10);
    ellipse (3*b+5, a, 10, 10);
    
    ellipse (4*b-5, a, 10, 10);
    ellipse (4*b+5, a, 10, 10);
    
    ellipse (5*b-5, a, 10, 10);
    ellipse (5*b+5, a, 10, 10);

}
                
                
