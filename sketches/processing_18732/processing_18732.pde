
void setup () {
size(250,250);
smooth();
noFill();
}
 
int a = 50;
int b = 70;
 
void draw (){
  background(0);
  
 
  stroke(142,11,255,(random(255)));
  strokeWeight((random(6)));
  ellipseMode(CENTER);
  ellipse(125,125,250,a*2);
   
  stroke(182,70,244,(random(255)));
  strokeWeight((random(3)));
  ellipseMode(CENTER);
  ellipse(125,125,250,b*2);
   
  stroke(142,11,225,(random(255)));
  strokeWeight((random(6)));
  ellipseMode(CENTER);
  ellipse(125,125,250,a*1.75);
   
  stroke(182,70,224,(random(255)));
  strokeWeight((random(6)));
  ellipseMode(CENTER);
  ellipse(125,125,250,b*1.75);
}


