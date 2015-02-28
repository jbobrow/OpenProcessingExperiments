


var numbers = {9, 15, 24, 19, 25, 30, 23, 50, 18, 27, 33, 33,};
var days = {"January", "February", "March", "April", "May","June", "July", "August", "September", "October", "November","December", };

void setup() {
  //instructions in here happen once when the sketch is run
  size(600,600,P3D);

  background(0);
   textMode();
  textSize(30);
  
  instagram = loadImage("instagram.png");
   
}
 
void draw() {


  //instructions in here happen over and over again
  background(#FFFFFF);
  text("@coochie_bruh",200,40,50);


  //turn on the lights so that we see shading on the 3D objects
  lights();
  //move to the center of the sketch before we draw our graph
  translate(width/2, height/2);
  //Tilt about 70 degrees on the X axis - like tilting a frame on the wall so that it's on a table
  rotateX(1.4);
  //Now, spin around the Z axis as the mouse moves. Like spinning that frame on the table around its center
  rotateZ(map(mouseX, 20, width, 20, TWO_PI));
  for (var i = 0; i < numbers.length; i++) {
    //calculate the amount of green in the colour by mapping the number to 255 (255 red &amp; 255 green = yellow)
    var c = map(numbers[i], min(numbers), max(numbers), 255, 0);
    noStroke();

    fill(0, 200, c, 200);
    //calculate the height of the bar by mapping the number to the half the width of the screen minus 50 pixels
    var w = map(numbers[i], 0, max(numbers), 0, width/2);
    //move out 200 pixels from the center
    pushMatrix();
        translate(200, 0);   
        
         text(days[i], 20, 0, -10);        
        box(15,50,w);
    popMatrix();
    //after we draw each bar, turn the sketch a bit
    rotate(TWO_PI/numbers.length);



} 
}



