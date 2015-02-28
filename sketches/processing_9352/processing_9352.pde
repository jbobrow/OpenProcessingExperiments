

void setup(){

  size(400, 400);
  background(255);
  fill(0);
  noStroke();
  smooth();

}


void draw () 
{  
  ellipseMode (CORNER);

  int a = 10;

 for (int u = 0; u<= 36; u++)
 {

  pushMatrix();
  for ( int i = 0; i <= 40 ; i++)
  {
    if(i <= 20)
    {
    ellipse (0,0, a-i/2,10);
    
        ellipse ((a-i/2),a, a-i/2,10);      //versetzter Kreis Abnahme

    translate((a-i/2)*2, 0);
    }
  
    if (i > 20)
    {
    ellipse (0,0, a-((40-i)/2),10);
    
        ellipse ((a-((40-i)/2)),a, a-((40-i)/2),10);    //versetzter Kreis Zunahme

    translate((a-((40-i)/2))*2, 0);
    
    }
  }
  
  popMatrix();
  
  translate(0, a+a);       //Vervielfältigung nach Unten
  
 }
  
 noLoop();
  
}



