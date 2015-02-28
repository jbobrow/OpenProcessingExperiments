
//import processing.pdf.*;

void setup()
{
  //size (900,900,PDF,"07.pdf");
  size(900,900);
  noLoop();
  smooth();
}
 
void draw()
{
  background(0);
  noFill();

                   for(int i=0; i<800; i+=10)  //center boxes
                   {
                     /////////////
                      
                   }
 
 pushMatrix();
      fill(255,60);
      strokeWeight(2);
      stroke(255,100,100);
      translate(600,650);//attempt to center axis
      rotate(radians(180));//rotate axis

for(int i=0; i<800; i+=50)  //rotated center boxes
 {
    beginShape();
      float numsteps = random(100, 500);
        for (int x=0; x < numsteps; x+=100)
        {
           
          float n = noise(x*10, i*3)*i*300;
   
         
          vertex(i, i);
          vertex(x, n);
          vertex(n, x);
          vertex(n, i);
       

        }
    endShape();
  }
popMatrix();
 


 pushMatrix();
  noFill();
      strokeWeight(1);
 translate (200,200);

 
   stroke(255,150,0);
 for(int i=0; i<800; i+=50)  //center cirlces
 {
 beginShape();
      float numsteps = random(100, 500);
        for (int x=0; x < numsteps; x+=8)
        {
           
          float n = noise(x*.01+563541135, i*100)*i;
   
          vertex(n, i);
          vertex(i, x);
          vertex(i, i);
        }
    endShape();
  }
 
 popMatrix();
 
 
 
 
 
 pushMatrix();
     
      stroke(255);
      translate(400,150);//attempt to center axis
      rotate(radians(45));//rotate axis

for(int i=0; i<800; i+=50)  //rotated center boxes
 {
    beginShape();
      float numsteps = random(100, 500);
        for (int x=0; x < numsteps; x+=100)
        {
           
          float n = noise(x*.01+51135, i*100)*i-200;
   
          vertex(0, 0);
          vertex(i, i);
          vertex(x, n);
          vertex(n, x);
          vertex(n, i);
        vertex(900,900);

        }
    endShape();
  }
popMatrix();
 
 
 
 //exit();
 
 }
  
  
  


 
 
 

