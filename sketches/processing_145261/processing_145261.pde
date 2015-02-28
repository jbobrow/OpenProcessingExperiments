
float index= 0.0;
void setup () {
  size (500, 500);
  background(0);
  smooth();
}

void draw () {
  float x= map(mouseX, 0, width, 350, 150); 
  float f=map(mouseX, 0, width, 0, 360);


  background(0);
  noFill();
  stroke(255);
  ellipse (width/2, height/2, width-x, height-x);
  fill(100);
  noStroke();
  ellipse (width/2, height/2, width-450, height-450);
  /* ellipse ((width-x)-width/2, (width-x)-height/2, 20, 20);
   ellipse(f+sin(index)*2, f+cos(index)*2, 50, 50);
   index=index+0.5;*/
  translate(width/2, height/2);
  pushMatrix();
  rotate(radians(index));
  //ellipse(40, 40, 10, 10 );
  //ellipse(-40, -40, 10, 10);
  ellipse (0, 40, 10, 10);
  ellipse (0, -40, 10, 10);
  ellipse(40, 0, 10, 10);
  ellipse(-40, 0, 10, 10);
  if (mouseX<200) {
    fill(random(255), 100, 255);
  }
  ellipse(cos(f)*(width-x)/2, sin(f)*(height-x)/2, 70, 70 );
  ellipse(cos(f+x)*(width-x)/2, sin(f+x)*(height-x)/2, 40, 40 );
  ellipse(cos(x)*(width-x)/2, sin(x)*(height-x)/2, 20, 20 );

  // ellipse((width-x-width/2)/2, (height-x)/2, 70, 70 );
  println(cos(f));
  popMatrix();
  index=index+0.5;
}



