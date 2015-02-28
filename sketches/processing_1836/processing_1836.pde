
int anchocampo = 250;
int altocampo = 500;

void setup (){
  
  size (800,600);
  background (40);
  
  rectMode(CENTER);
  fill (0,255,0);
  stroke (255);
  strokeWeight(8);
  rect(width/2, height/2,anchocampo ,altocampo);
  line(275, height/2, 525,height/2);
  noFill ();
  ellipse (width/2, height/2, 100,100);
  
  rect(400,75,100,50);
  rect(400,525,100,50);
  
}

