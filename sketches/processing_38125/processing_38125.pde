
void setup(){
  size( 300, 300);
background(255,0,0);
colorMode(RGB, 200);
}
void draw(){
  
noStroke();

fill(random(50),0,random(200)); //random blue hue
for ( int i= 0; i <360; i+=20) { //this sets the variable i and its interval as well as rotation limit
  pushMatrix();

  translate(width/2, width/2); //resets the origin to the center
  rotate(radians(i)); // sets the rotation radius to i
  translate(100, 0); // the new origin is at the point 100 to the right of the center origin
 

  ellipse(0, 0, 10, 10); //defines the ellipse at translated origin
  popMatrix();

  int rad1 = 100; //sets the variable rad 1 at 100
  int rad2 = 75; //sets the variable rad 2 at 75

fill(random(50),0,random(200)); //random blue hue

  for (int h=0; h<360; h+=20) { //this sets the variable h and its interval as well as rotation limit
    pushMatrix();

    translate(width/2, height/2); //resets the origin at the center
    rotate(radians(i)); //defines same radius as above
    translate(rad1, 0); // moves the origin to the origin of the first ellipse above
    rotate(frameCount*.025); //this creates a frame by frame movement of the ellipses around their respective origins, as well as change the random colors at the same rate
    translate(rad2, 0); // shifts the origin 75 units to the right of first ellipse origin
    ellipse(0, 0, 5, 5); // defines small ellipse size and origin

    popMatrix();
  }
}
}

