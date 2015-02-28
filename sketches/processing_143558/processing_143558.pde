
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
    rectMode (CENTER);
    fill(255);
    ellipse(0,0,10+(hour()*10),10+(hour()*10));
    popMatrix();  
    
    pushMatrix();
    rotate (radians(6*second()-90));
    noStroke ();
    fill(0);
    ellipse(0,0,400,10);
    popMatrix();
    
    pushMatrix();
    rectMode (CENTER);
    noFill ();
    strokeWeight(5);
    stroke (255);
    ellipse(0,0,40+(minute()*10),40+(minute()*10));
    popMatrix();
    
    
    }
    
  
}
