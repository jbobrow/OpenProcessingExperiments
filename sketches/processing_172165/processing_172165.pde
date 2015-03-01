
float counter = 0;
void setup()
{
  smooth ();
  size (500,500);
}
void draw ()
{
  translate (width/2, height/2);
  colorMode (HSB, 360,100,100);
  
  println (sin(counter));
  
  float counter_mouse = map (mouseX,0,width,0.01,0.2);
  float amplitude = map (sin(counter),-1,1,-100,100);
  float amplitude2 = map (sin(counter),-1,1,200,10);
  float amplitude3 = map (sin(counter),-1,1,10,360);
  counter += counter_mouse*0.1;
  
  background (0,0,amplitude3*0.5);
  
  fill (0,0,0);
  stroke  (1);
  rect (-150,108,300,62); //Haare hinten
  
  noFill();
  rect (-101,120,202,100);  //Hals
  
  fill (#FFFABF);
  ellipse (0,-30,300,400);  //GesichtFarbe
  
  fill (amplitude2,100,100);
  ellipse (-80,-60,60,60); //Augen
  ellipse (80,-60,60,60);
  ellipse (0,80,200,70);  //Mund
 
  noStroke();   
  fill (#FFFABF);
  ellipse (0,amplitude*0.3,240,70);
  rect (-100,10+amplitude*0.3,201,40);
  rect (-100,98+amplitude*0.35,201,55);
  rect (-100,120,201,100);  //HalsFarbe
  
  stroke  (1);
  noFill();
  ellipse (0,-30,300,400);   //Gesicht
  
  fill (0,0,0);                //Haare
  rect (-130,-130,260,40);
  rect (-150,-130,40,300);
  rect (110,-130,40,300);
  arc  (0,-130,300,200,PI,TWO_PI);
  
  fill (300,100,amplitude3);
  noStroke();
  rect (100,180,50,90);
  rect (-150,180,50,90);
  triangle (-100,180,0,220,-100,300);
  triangle (100,180,0,220,100,300);
  rect (-100,220,200,40);
  triangle (-150,180,-200,230,-150,300);
  triangle (150,180,200,230,150,300);
  rect (-200,230,400,50); 
}
  
