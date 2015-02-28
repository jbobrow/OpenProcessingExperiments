
size(300, 300);
background(71, 141, 3);
translate(width/2, height/2);
float r= random(255);
float g= random(255);
float b= random(255);
int x=0;
int y=1;



for (x=0; x<=500; x=x+10) {
  stroke(255, 255, 255); //keeps white stroke
  fill(r, g, b, 30 ); //utilizess random fill with a transparency
  ellipse(width-x, height-x, y, y); /* the ellipse starts at the point
  and is tranformed to the bottom right, it's diameter increases*/
  y=y+6;
}




