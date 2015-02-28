
float counter = 0;
 
void setup()
{
  size(500, 500);
  smooth();
frameRate(25);
background(255);
}
 
void draw()
{ 
  translate(width/2, height/2);
   
  for (int i=0; i<360; i+=150)
  {
    pushMatrix();
    rotate(millis()/4000.0);
    //translate(i*80, -cos(counter+i))*100);
    translate(0,-cos(-millis()/1000.0)*100);
    noStroke();
    fill(0,0,0,30);
    line(20, 0, 20, 20);
    fill(0,0,0,30);
   line(25, 0, 5, 5);
    pushMatrix();
rotate(millis()/3000.0);
translate(0,-cos(-millis()/1000.0)*100);
noFill();
stroke(0,random(20));
rect(0,0,random(250),random(20));
translate(10,cos(-millis()/1000.0)*100);
stroke(0,random(10));
line(20,20,random(100),random(20));
popMatrix();

    popMatrix();
     
    counter += 0.01;
  }
}

