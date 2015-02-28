
/*Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name:CHOI Joo Hee
 ID:201420114
 */


void setup() {
  size (600, 600);
  smooth();
  background(255);
  noLoop();
}

void draw() {

  for (int j=0; j<width; j+=70) {
    for (int c=0; c<height; c+=70) {
     strokeWeight(3); 
     ellipse(j,c,50,50);
     rectMode(CENTER);
     rect(j,c,20,20);
     ellipse(c,j,100,100);
     noFill();
     stroke(0);
     strokeWeight(5);
     rect(c,j,40,40);     

   
       
    }
}
}

