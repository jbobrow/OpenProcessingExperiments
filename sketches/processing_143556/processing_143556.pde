
void setup(){
size (500,500);
background (0);

}

void draw (){
 
  int s = second(); 
  int m = minute(); 
  int h = hour();    
 
  line(s, 0, s, 33);
  line(m, 33, m, 66);
  line(h, 66, h, 100);
  
  background (0);
  noStroke ();
  translate (width/2,height/2);
  for (int i=0; i<360; i+=30)
  {
    
        pushMatrix();
    fill(25,25,25);
    ellipse (0,0,290,290);
    popMatrix ();
    pushMatrix();
    
    rotate (radians(i));
    translate (0,150);
    fill(255);
    ellipse (0,0,10,10);
    popMatrix ();
    
    pushMatrix();
    fill (255);
    rotate (radians(6*second()-90));
    rect (0,0,140,1,s);
    popMatrix ();
    
    pushMatrix();
    fill (100);
    rotate (radians(6*minute()-90));
    rect (0,0,130,3,m);
    popMatrix ();
    
    pushMatrix();
    rotate (radians(30*(hour()+minute()/60.0)-90));
    rect (0,0,100,3,h);
    popMatrix ();
    
    pushMatrix();
    fill (70,70,70,100);
    ellipse (0,0,30,30);
    popMatrix ();
    

  }
  
  

}
