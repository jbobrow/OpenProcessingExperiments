
void setup(){
  size(600,300);
  smooth();
  
  background(0);
}
void draw(){
 
  strokeWeight(1); 
  stroke(155,155,155);
 fill(0);
 ellipse(300,150,20,20);
 
 
 noStroke();
 fill(255);
 ellipse(290,140,25,25);
 
 
 
  strokeWeight(3); 
  stroke(219,96,20,20);
 fill(67,27,0,80);
 ellipse(300,150,60,60);
 
 strokeWeight(2);
 stroke(250,200,220);
  fill(255,150,186);
 ellipse(368,150,10,10);
 
 
 
 
 strokeWeight(2);
 stroke(250,200,220);
  fill(255,150,186);
 ellipse(232,150,10,10);
 
  
  strokeWeight(65);
  stroke(255,193,100);
   fill(255,255,255,20);
 ellipse(300,150,200,mouseX);
  
   

}

