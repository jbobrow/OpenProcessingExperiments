
size (300, 300);
background(50);
noFill();
stroke(HSB, 300);
strokeWeight(3);


for (int x = 0; x < width; x += random(100, 200)) {
  pushMatrix();
  translate(width/2, height/2);  //moves the location of origin to the center
  rotate(radians(x));            //changes the angle
  stroke(x, x, 300);      
  translate(100,0);             //moves origin 100 to the right from center
  ellipse(0,0,100,100);
  stroke(x, 100, x);
  rectMode(CENTER);
  rect(0,0,100,100);
  line(10,20,30,40);
  popMatrix();
}



