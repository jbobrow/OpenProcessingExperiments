
void setup() {
  size(400,400);
  smooth();

  //textAlign(CENTER);
}

void draw() {
  background(234,227,227);
 
 ellipse(20,20 ,20,20);// draw a ellipse at the coord(20,20), width=20, heigt=20

for (int i=0; i <= width ; i += 85) {
  for (int j = 0; j <= height ; j += 5) {
    ellipse( i,j, 15,40);
  }
}
 
if(mousePressed) {
    background(random(487),0,random(0)); //if pressed background changes colour randomly
    
}
  //left eye

  int x = mouseX; // if the mouse is one the right side of the creatures square fac then draw..
  if ( x > 250) {
    fill(255,255,0);
    noStroke();
    ellipse(219,165,87,85);
  }
  //right eye

  if (x <120) { // if the mouse is on the left side of the creatures square face then draw..
    fill(169,207,229);
    ellipse(150,165,29,32); 
    noStroke();
  }


  noFill();
  fill(255,252,252);
  arc(217,163, 90,90,0,PI/2);

  // for the inner black eyes

  fill(28,3,3);
  ellipse(148,167,9,15);
  ellipse(210, 157, 25,20);
  fill(255,255,255);
  ellipse(150,165,3,5);
  ellipse(215,155,15,9);
  noFill();

  //for nose
  fill(3,0,0);
  smooth();
  ellipse(150,220,67,30);
  stroke (198,227,13);
  ellipse (165,220,25,13);
noFill();



  //for head
 
  stroke(85,61,1);
  rect(115,115,155,140);
  stroke(250,250,250);   
  stroke(255,102,0);
  curve(390,257,245,115,100, 85,135,125 );


  // teeth
  fill(126);
  triangle (114, 257, 120, 277, 127,257);
  triangle (129,257,134,277,141,257);

  //for neck
  stroke(126);
  line(215,285,215,255);
  line(220,285,220,255);

  //for body
  fill(0,0,0);
  rect(195, 285, 115,20);
  noFill();

  //for tail
  fill(26,10,90);

  line(295,285,350,255);
  noFill();
  //for speech bubble
  //smooth();
  //stroke(0,0,0);
  //line( 65,85,78,98);
 
  
  //for speech bubble:text
  if (mousePressed) {
  textSize(25);
  fill(111,29,170);
  text( "", 245,95);
  
  }


}


