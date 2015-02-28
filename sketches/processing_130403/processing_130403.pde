
//Copyright Mina Kim 2014
//minakim0128@gmail.com
//Homework 4

//if you click on the plate, you will get tomato, 
//and if press keyboard it will empty your plate.
// Also, scroll your mouse wheel to get colorful candy.

void setup ()
{
  size (400,400);
  background (47,79,79);
  noStroke ();
  fill (60);
  ellipse (150,220,500,180);
  fill (230);
  ellipse (200,200,500,180);
  fill (200);
  ellipse (200,200,300,100);
 
 String s = "click on the plate to get a tomato, scroll the mouse wheel to get a candy; and press keyboard to empty your plate";
  noFill();
  text(s, 10, 10, 130, 130);
 }





void draw ()
{
  noFill ();
} 

//get tomato on your plate

void mousePressed ()
{
  fill(200,0,0);
  noStroke ();
  ellipse (mouseX,mouseY,50,50);
  fill(0,200,0);
  ellipse (mouseX-10,mouseY-15,20,5);
  ellipse (mouseX-10,mouseY-15,5,20);
}


// empty your plate by pressing keyboard

void keyPressed ()
{
  fill (random(255),random(255),random(255));
  noStroke ();
  rect (0,0,800,800);
  fill (60);
  ellipse (150,220,500,180);
  fill (230);
  ellipse (200,200,500,180);
  fill (200);
  ellipse (200,200,300,100);
  String s = "click on the plate to get tomato, and press keyboard to empty your plate";
  noFill();
  text(s, 10, 10, 130, 100);
  
}



void mouseWheel(MouseEvent event) {
  println();
  fill(random(255),random(255),random(255));
  ellipse(mouseX, mouseY, 30,30);
  
}



