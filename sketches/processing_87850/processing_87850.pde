
/* Define globals */
color colorBack = color(100,100,150);
color colorPoint = color(0,0,0);
color colorRect = color(0,100,50);
color colorEllipse = color(180, 0, 40);
color green = color (0, 255, 0);
color strokeEllipse = color(50,0,0);
float attractorX ;
float attractorY;
float margin = 20;

void setup(){
  size(300,300);
  background(colorBack, 180);
  /* Randomly set the position of an attractor, where the circle collapses to infinite density */
  attractorX = random(0.0, float(width));
  attractorY = random(0.0, float(height));
}

void draw(){
  noStroke();
  /* Fill with a semi-transparent bg for trails */
  fill(colorBack, 45);
  rect(0,0, width, height);
  strokeWeight(3);
  stroke(colorPoint, 100);
  point(mouseX, mouseY);
  stroke(strokeEllipse, 80);
  fill(colorEllipse, 10);
  /* Draw an ellipse whose width aand height correspond to the mouse's position relative to the attractor*/
  ellipse(mouseX, mouseY, abs(mouseX - attractorX), abs(mouseY - attractorY));

}

/* Upon mouse click, show position of attractor */
void mouseClicked(){
  println("Attractor: " + attractorX + " " + attractorY + " ");
  stroke(0, 255);
  strokeWeight(20);
  point(attractorX, attractorY);
  stroke(255, 150);
  strokeWeight(12);
  point(attractorX, attractorY);
  stroke(0, 120);
  strokeWeight(10);
  point(attractorX, attractorY);
  /* Print a message if mouse is near attractor */
  if ((mouseX <= int(attractorX + margin) && mouseX >= int(attractorX - margin)) && (mouseY <= int(attractorY + margin) && mouseY >= int(attractorY - margin))){
    println("THE SINGULARITY IS NEAR!!");
  }
}

/* Print canvas when "P" is pressed */
void keyPressed(){
  if (key == 'p') {
    save("singularity.jpg");
  }
}

