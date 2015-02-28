
size (800,600);

background (0);
smooth();

float i=0;

while (i<height){
  
  stroke (255-i,0,255-i);
  line (0,i,width,i);
  i=i+1;
  
  }

//ubica el axis X y Y en el centro
rectMode(CENTER);
translate(width/2,height/2);

//dibuja el campo de futbol
stroke(255);
strokeWeight(4);
fill(47,185,57);
rect(0,0,400,600);
line(200,0,-200,0);

noFill();
ellipse(0,0,100,100);

rect(0,-300,100,50);
rect(0,300,100,50);

