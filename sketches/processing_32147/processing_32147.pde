
/*Conor Russomanno
Assignment 1 - Print Poem to Console
*/

void setup() {
  background(0);
  size(600,400);
  smooth();
  //frameRate(0.1);
}

//draw smiley and printe poem
void draw() {
  fill(230, 200, 15); 
  ellipse(300,200,300,300); //face
  
  fill(0);
  ellipse(250,175,50,50); //left eye
  ellipse(350,175,50,50); //right eye
  ellipse(300,300,30,30); //mouth
  
  //print poem
  println("I will not play at tug o' war.");
  println("I'd rather play at hug o' war,");
  println("Where everyone hugs");
  println("Instead of tugs,");
  println("Where everyone giggles");
  println("And rolls on the rug,");
  println("Where everyone kisses,");
  println("And everyone grins,");  
  println("And everyone cuddles,");  
  println("And everyone wins.");
  println(" ");  
  
}

