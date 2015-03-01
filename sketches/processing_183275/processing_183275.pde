
void setup() {
 size(900,600);
 background(227,25,25);}
 
  void draw() {
 background(227,25,25);

  if (mouseY<height/2) {
 
  fill(250);
  
  ellipse(300,200,100,200);
   ellipse(600,200,100,200);
  } 
  else { 
 fill(0);
 ellipse(300,200,190,190);
 ellipse(600,200,190,190);
 ellipse(450,350,290,300);
   
}

  }


