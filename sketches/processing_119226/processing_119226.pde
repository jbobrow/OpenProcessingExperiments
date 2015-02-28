
void setup()
{
  size(500, 500);
  
  translate(10, 0);

/*rotate(mouseX);
fill(#6FCB98);
noStroke();
rect(260, 350, 20, 100);*/



}

void draw()
{
  
background(50);
  
pushMatrix();
    
translate(260, 350);     
float winkel= map(mouseX,0,3000,0,1.5*PI);      
rotate(winkel);
              
fill(#62D394);
rect (0,0, 20,100);    
fill(17,100,16);
   
popMatrix();
resetMatrix();



fill(150);
noStroke();
rect(50, 50, 20, 100);

fill(150);
noStroke();
rect(120, 50, 20, 100);

fill(150);
noStroke();
rect(190, 50, 20, 100);

fill(150);
noStroke();
rect(260, 50, 20, 100);

fill(150);
noStroke();
rect(330, 50, 20, 100);

fill(150);
noStroke();
rect(400, 50, 20, 100);

translate(0, 150);

fill(150);
noStroke();
rect(50, 50, 20, 100);

fill(150);
noStroke();
rect(120, 50, 20, 100);

fill(150);
noStroke();
rect(190, 50, 20, 100);

fill(150);
noStroke();
rect(260, 50, 20, 100);

fill(150);
noStroke();
rect(330, 50, 20, 100);

fill(150);
noStroke();
rect(400, 50, 20, 100);

translate(0, 150);

fill(150);
noStroke();
rect(50, 50, 20, 100);

fill(150);
noStroke();
rect(120, 50, 20, 100);

fill(150);
noStroke();
rect(190, 50, 20, 100);

/*fill(150);
noStroke();
rect(260, 50, 20, 100);*/

fill(150);
noStroke();
rect(330, 50, 20, 100);

fill(150);
noStroke();
rect(400, 50, 20, 100);

fill(#6FCB98);
noStroke();
rect(200, 350, 20, 100);




}


