
void setup(){
size (500,500);
background (255);

}

void draw (){
 
  int s = second(); 
  int m = minute(); 
  int h = hour();    
 
  line(s, 0, s, 0);
  line(m, 33, m, 66);
  line(h, 66, h, 100);
  
  background (255);
  noStroke ();
  //translate (width/2,height/2);


  fill (255,0,0);
  rect (0,0,8*s,150);
  
  fill (0,23,255);
  rect (0,150,8*m,8*m);
  
  fill (16,255,0);
  rect (475,0,25,8*h);
}
