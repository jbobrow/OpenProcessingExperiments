
void setup() {
  size (500,500);
    smooth();
      }
 
void draw()
{
  background (78, 103, 89);

  translate(250, 250);
   


  //fill(255,255,255);
  //ellipse(0,0,200,200);
   
  //fill(255,255,255);




translate(0, 0);
noStroke();
  ellipse(0,0, 10, 10);

  for (int i=0; i<=360; i+=30)
  {
pushMatrix();
 rotate ( radians(i) );
 translate(0, 150);
 fill(255);
 noStroke();
 ellipse(0, 0, 10, 10);
 popMatrix();
  }
  
noFill();
stroke(162, 203, 180, 100);
strokeWeight(7);
ellipse(0, 0, 330, 330);
fill(255);
stroke(162, 203, 180,100);
ellipse(0, 0, 280, 280);
 
 
   
  for ( int i=0; i<360; i+=6)
  {
    pushMatrix();
    rotate (radians (6*second()-90));
    strokeWeight(1);
    strokeCap(SQUARE);
    stroke(160, 203, 179);
    line(0, 0, 150, 0);
    popMatrix();
     
    pushMatrix();
    rotate (radians (6*minute()-90));
    strokeWeight(3);
    strokeCap(SQUARE);
    stroke(81, 116, 96);
    line(0, 0, 100, 0);
    popMatrix();
     
    pushMatrix();
    rotate (radians (30*(hour()+minute()/60.0)-90));
    strokeWeight(2);
    strokeCap(SQUARE);
    stroke(18, 72, 42);
    line(0, 0, 70, 0);
    popMatrix(); 
  }
  
 

}

