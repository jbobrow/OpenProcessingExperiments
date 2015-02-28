
void setup()
{
  size (500, 500);
  background(255);
  smooth();
}


void draw()
{
  background(0);
  int s = second();  
  int m = minute(); 
  int h = hour();  
  
  line(s, 0, s, 33);
  line(m, 33, m, 66);
  line(h, 66, h, 100);

  background(255);
  translate(width/2, height/2);
  for (int i=0; i<360; i+=30)
    //for (int b=0; b<100; b+=15)

  {

    pushMatrix();
    rotate(radians(i) );
    translate(0, 150);
    fill(i, 40, 70);
    noStroke();
    rect(0, 0, 10, 10, i);
    popMatrix();
    
   

    println(mouseX);
    
    fill(225,225,225);
  ellipse(0,0, 300, 300);
   fill(231,231,231);
   ellipse(0,0, 300, 300);
  fill(150,150,150);
   ellipse(0,0, 50, 50);
   
   fill(150,150,150,90);
   ellipse(0,0, 190, 190);
   
   fill(i,40,70);
   ellipse(0,0, 20, 20);
    
    //Zeiger
    fill(i, 40, 70);
    pushMatrix();
    rotate(radians(6*second()-90));
    rect( 0, 0, 130, 1, s);
    popMatrix();

    pushMatrix();
    rotate(radians(6*minute()-90));
    rect( 0, 0, 140, 6, m);
    popMatrix();

    pushMatrix();
    rotate(radians(30*(hour()+minute()/60.0)-90));
    rect( 0, 0, 90, 6, h);
    popMatrix();
  }
}

