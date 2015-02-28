
//Ellipse or arcs - pattern02

//variable
int whitespace=25;
 
size(500, 500);
smooth();
background(0);
noStroke();
 
//pattern start 

for (int i=299;i>0;i--) {
  if (i%2==0) {
    fill(255);
  }
  else {
    fill(0);
  }
  ellipse(300+(whitespace*i/10), 200, whitespace*i, whitespace*i);
}
 
 


