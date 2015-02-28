
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

void setup() {

  size(500, 500);
}


void draw() {
  background(255, 255, 255);
  
  stroke(0);
  fill(79, 216, 132);
  rect(mouseX, mouseY+25, 20, 50);

  stroke(0);
  fill(79, 216, 132);
  rect(mouseX+75, mouseY+25, 20, 50);

  stroke(0);
  fill(79, 216, 132);
  rect(mouseX, mouseY+25, 15, 45);

  stroke(0);
  fill(79, 216, 132);
  rect(mouseX+75, mouseY+25, 15, 45);



  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(300, 190, 180, 100);

  stroke(0);
  fill(79, 216, 145);
  ellipseMode(CENTER);
  ellipse(300, 190, 170, 90);

  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(300, 190, 160, 80);

  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(300, 190, 150, 70);

  stroke(0);
  fill(85, 216, 150);
  ellipseMode(CENTER);
  ellipse(300, 190, 140, 60);

  stroke(0);
  fill(85, 255, 150);
  ellipseMode(CENTER);
  ellipse(300, 190, 130, 50);



  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(200, 150, 100, 100);

  stroke(0);
  fill(79, 216, 132);
  ellipseMode(CENTER);
  ellipse(200, 150, 90, 90);

  fill(255, 255, 255);
  ellipseMode(CENTER);
  ellipse(175, 130, 20, 20);

  fill(0);
  ellipseMode(CENTER);
  ellipse(173, 135, 9, 9);

  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(173, 135, 10, 10);
}  

