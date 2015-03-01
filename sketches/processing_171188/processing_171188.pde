
void setup()
{
  size (500,500);
  background (0);
  translate(width/2, height/2);
}



void draw ()
{
  float minute1 = map(minute(),0,60,0,2*PI);
  float sekunde = map(second(), 0,60,0,2*PI);  
  float millisek = map(millis(), 0,minute1,0,2*PI);

  
  translate (width/2, height/2);
  

  pushMatrix();                                  //gelb
  rotate(millisek);//sekunde);
  fill(#FFFF00,5);
  rect(100, 100,100,100);
  popMatrix();
  
  pushMatrix();                                  //blau
  rotate(millisek);//sekunde);
  fill(#7226ED,5);
  rect(50,50,50,50);
  popMatrix();
  
  pushMatrix();                                  //rot
  rotate(millisek);//sekunde);
  fill(#ED2658,5);
  rect(25,25,25,25);
  popMatrix();

   
}



