
void setup(){
  size(600,600);
  background(255);
}
int i;
void draw(){
  translate(width/2,height/2);
  rotate(radians(i));
  stroke(0);
  strokeWeight(0.3);
  noFill();
  translate(width/2,height/2);
  rectMode(CENTER);
  rect(i/20,i/20,i/4,i/4);
  if(i<10000){
    i=i+10;
  }
  
  if(mousePressed) { 
      if (mouseButton==CENTER) {
         save("myoutput#.jpg");
      }
  }  
 
}


