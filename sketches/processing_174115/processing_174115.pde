
void setup()
{
  size (500, 500);
  background (162, 208, 255);
}

void draw()
{
  background (162, 208, 255);
  
  
  pushMatrix();
  translate(0,0);
  fill(255);
ellipse(mouseX,50,50,50);
  fill(255);
ellipse(100+mouseX,50,50,50);
fill(255);
ellipse(25+mouseX,25,50,50);
fill(255);
ellipse(25+mouseX,75,50,50);
fill(255);
ellipse(75+mouseX,25,50,50);
fill(255);
ellipse(75+mouseX,75,50,50);
fill (255);
ellipse (50+mouseX,50,50,50);
  popMatrix();
    
  
  for (int i=0; i<width; i+=20)
  {
stroke (226,255,173);
strokeWeight(5);
float ver = sin(millis()/1000.0+i)*5;
line (i,height,i+ver,450);
  
  
  
}
  
  
  

    
    pushMatrix();
        translate (width/2, 200);

        stroke(255,214,236);
    strokeWeight(5);
    line(0,0,0,height);
    popMatrix();
    
    

  for (int i=0; i<360; i+=90) {
    pushMatrix();
    translate (width/2, 200);
    rotate(radians(i)); 
    fill(252, 248, 168);
    noStroke();
    triangle(0, 0, 0, -100, 75, -100);

    popMatrix();


if (mousePressed==true)
{
      pushMatrix();
        translate(0, 0);
        stroke (255);
        strokeWeight(5);
        line (25, 200, 100, 200);
        stroke (255);
        strokeWeight(5);
        line (25, 175, 100, 175);
        stroke (255);
        strokeWeight(5);
        line (25, 225, 100, 225);
        popMatrix();
        
        pushMatrix();
        for (int j=0; j<360; j+=90)
      { 
    pushMatrix();
    translate (width/2, 200);
    rotate (radians (-millis()/10));
    rotate(radians(i)); 
    fill(252, 248, 168);
    noStroke();
    triangle(0, 0, 0, -100, 75, -100);
    popMatrix();
      }
        popMatrix();
        
}
  /*else
  {
      for (int j=0; j<360; j+=90)
      { 
    pushMatrix();
    translate (width/2, 200);
    rotate(radians(i)); 
    fill(252, 248, 168);
    noStroke();
    triangle(0, 0, 0, -100, 75, -100);
    popMatrix();
      }     
      */
}}
      
      
