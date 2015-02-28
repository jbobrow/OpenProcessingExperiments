
void draw() {
  fill(#C0C0C0);
  background(#FFFF00);
  stroke(#cc0000);
  //face chunks (must be here to be behind the eyes)
   fill(#330033);
  triangle(8,25,90,13,80,80);
  fill(#000099);
  triangle(8,25,50,80,20,80);
  fill(#FF0000);
  triangle(8,25,50,0,86,13);
  //nose
  fill(#FFFF00);
  arc(50,45,20,50,TWO_PI-PI/2,TWO_PI);
  //nostrals
  fill(#000000);
  ellipse(60,40,5,5);
  ellipse(50,40,5,5);
  //eyes
  fill(#FFFFFF);
  ellipse(75,30,15,15);
  fill(#A0A0A0);
  ellipse(30,35,30,15);
  //Mouth
  triangle(25,50,40,45,65,56);
  //face
  stroke(#cc0000);
  strokeWeight(2);
  line(8,25,50,0);
  stroke(#cc0000);
  strokeWeight(1);
  line(50,0,90,13);
  stroke(#cc0000);
  line(80,80,20,80);
 //eye balls
 fill(#0000CC);
  ellipse(30,35,10,10);
  ellipse(75,30,8,8);
  //inner mouth
  fill(#000000);
  triangle(25,50,35,68,65,59);
  //body
  quad(0,100,20,80,90,80,100,100);
  fill(#FFFFFF);
  quad(50,90,55,80,60,90,55,100);
  quad(30,90,35,80,40,90,35,100);
  quad(70,90,75,80,80,90,75,100);
  line(10,90,95,90);
}


