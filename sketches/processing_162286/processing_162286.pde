
void setup(){
  size(600,600);
  background(74,190,155);
  
}

void draw(){
  
  strokeWeight(2);
  
  /*Ansigt*/
  ellipseMode(CENTER);
  ellipse(300,300,150,200);
  
 /*Øjne*/
 ellipse(270,280,20,20);
 ellipse(330,280,20,20);
 
  /*Skæg*/
  rectMode(CENTER);
  rect(300,390,150,175,0,0,70,70);
 
  /*knold*/
  ellipse(300,185,40,50);
  
  /*Hår*/
  rect(300,230,139,60,70,70,0,0);
  
   /*Næse*/
  arc(300, 300, 30, 30, 0, PI+QUARTER_PI, OPEN);

 /*mund*/
 arc(center, center+30, 20, 20, 0, 3.14,OPEN);

  
  
 
 
 
 
  
}

