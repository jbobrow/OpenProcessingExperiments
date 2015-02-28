
// SOS iDesign
// KU DYNAMIC MEDIA
// David Mrugala
 
float xW = 300;
float direction = 5; // direction and speed

void setup(){
  size(600,600);
  background(16,63,69);
}

void draw(){
  noStroke();
  fill(16,63,69,10); // adds halo or transparecy
  rect(0,0,width,height); 
  
  fill(255); // white ellipse
  ellipse (width/2, height/2, xW, xW);
  
  // counter for ellipse width and height with direction
  xW = xW + direction; 
  
  // changes the direction of counting
  if ((xW > 580)||(xW < 1)){
    direction = direction * -1;
  }  
}
