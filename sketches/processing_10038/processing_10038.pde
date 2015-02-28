

PFont andale;

void setup() { 
  size(1000,800);
  smooth ();
  andale = loadFont("AndaleMono-255.vlw"); 
  textFont (andale);
  textAlign (CENTER);
  textSize (150);
}  

void draw(){ 

  background(0);  

  fill (255); 
  String s =  str(hour()%12); 
  if (s.length()==1) s= "0" + s; 
  String m = str(minute()); 
  if (m.length()==1) m= "0" + m;
  String se = str(second()); 
  if (se.length()==1) se= "0" + se;  
  s= s + ":" + m + ":" + se; 

  text(s,width/2,250);



  int s1 = second();  // Values from 0 - 59
  int m1 = minute();  // Values from 0 - 59
  int h1 = hour();    // Values from 0 - 23

  //ellipse abhängig von zeit malen
  fill (255,30);
  stroke (255,50);
  ellipse(width/2, height/2, 200+s1*10, 200+s1*10);
  ellipse(width/2, height/2, 100+m1*10, 100+m1*10);
  ellipse(width/2, height/2, 50+h1*22, 50+h1*22);

} 



