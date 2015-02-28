
void setup()
{
  size (500, 500);
  background(198);
  smooth();
}


void draw()
{
  background(198);
  int s = second();  
  int m = minute(); 
  int h = hour();  
  


  background(198);
  translate(width/2, height/2);
  for (int i=0; i<360; i+=30)

  {

 
   noStroke();
    
    
   

    println(mouseX);
    
    
   
   fill(150,150,150,90);
  
   
   fill(234,193,52);
   ellipse(0,0, 200, 200);
    
    //Zeiger
    fill(71, 93, 166, 50);
    pushMatrix();
    rotate(radians(6*second()-90));
    triangle( 30,250, 58,20,100, s);
    popMatrix();
    
    fill(7,62,242);
    pushMatrix();
    rotate(radians(6*minute()-90));
    triangle (30, 150, 58, 20, 150,m );
    popMatrix();
    
    fill(5,43,167);
    pushMatrix();
    rotate(radians(30*(hour()+minute()/60.0)-90));
  triangle ( 30, 75, 58,20,100, h);
    popMatrix();
  }
}

