
PImage ads;
PFont r;

void setup () {
  size (600,600);
  background (0);
  
  r=createFont ("Geneva", 20);
  textFont (r);
  textAlign (CENTER);
  
  ads= loadImage ("ads.jpg");
  
 
 fill (255);

 text ("Ads appeal to our emotions", 175,100);
 text ("and can be used to persuade us", 275, 125);
 fill (#FFFF52);
 text ("click to see some examples", 275, 300);
  
}

void draw () {
  
 
  if (mousePressed) 
  image (ads, 0,0, width, height);
  
 
} 


