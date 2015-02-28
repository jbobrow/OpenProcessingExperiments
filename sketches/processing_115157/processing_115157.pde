
void setup ()
{
  size (400,400);
  background(20,31,100);
  noCursor();
   smooth(2);
}

void draw()
{
   background(20,31,100);  
//translate(mouseX-200,mouseY-200);
 moni();
}

void moni ()
{
  translate (-150,-150);
   //patas
   fill(0);
   
   stroke(0);
  rect(192,210,4,30);
  rect(184,235,12,5,3,3,3,3);
  rect(205,210,4,30);
  rect(205,235,12,5,3,3,3,3);
  
   fill(125,216,28);
   stroke(125,216,28);
  rect(192,210,4,15);
  rect(205,210,4,15);
  
    //antenas
  line(192,185,185,165);
  line(208,185,215,165);
  ellipse(185,165,5,5);
  noFill();
  stroke(228,232,49); 
  ellipse(185,165,15,15);
  stroke(248,250,149,50);
  ellipse(185,165,28,28);
  fill(125,216,28);
   stroke(125,216,28);
  ellipse(215,165,5,5);
   noFill();
  stroke(228,232,49); 
  ellipse(215,165,15,15);
  stroke(248,250,149,50);
  ellipse(215,165,28,28);
  
  //cuerpo
  fill(125,216,28);
   stroke(125,216,28);
  ellipse(200,200,40,40);
  
  //ojo
  fill(255);
   stroke(255);
  ellipse(200,193,20,20);
  
  fill(0);
   stroke(0);
  ellipse(200,191,10,10);
  
    fill(255);
   stroke(255);
  ellipse(198,190,3,5);
  
  //sonrisa
  noFill();
  stroke(0);
  strokeWeight(2);
  curve(195,155,185,205,215,205,205,155);
  
}
