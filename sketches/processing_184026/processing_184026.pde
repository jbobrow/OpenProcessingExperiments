
//----------------------------//
//Four Crazy Coloured Lines!//
//By Brandon Messner//
//----------------------------//

void setup() {
  background(0);
  size(900,900);
}

void draw() {
  float x=random(0,255); //Random color component
  
  int m=width/10; //margins will be proportional to width
  //background(0); //Delete '//' to make single lines
  
  
  //Everything is based on the whole width and height and also the width/2 and height/2 to end up with central axes.
  //We use 'm' (our margin size) and subtract it from the total width and height to get the outside borders
  //The interior borders are created by adding a space sized 'm/2' on both sides of the central axes to make for a total of an 'm' sized space between the boxes of colored lines. 
  
  strokeWeight(5);  //Big lines!
  
  stroke(x,x,0);  
  line(m,random(m,height/2-m/2),width/2-m/2,random(m,height/2-m/2)); //Upper Left
  
  stroke(0,0,x);
  line(width/2+m/2,random(m,height/2-m/2),width-m,random(m,height/2-m/2)); //Upper Right
  
  stroke(0,x,0);
  line(m,random(height/2+m/2,height-m),width/2-m/2,random(height/2+m/2,height-m)); //Lower Left
  
  stroke(x,0,0);
  line(width/2+m/2,random(height/2+m/2,height-m),width-m,random(height/2+m/2,height-m)); //Lower Right
  
}
