
//6.2 HW
//Danielle Scesney

PImage pic; 

void setup() {
  size(300, 300);
  pic = loadImage("1.jpg"); //sets up image.

  smooth();
  strokeWeight(2);
}


void draw() {
  background(50);

//set up the spacing between each line and ellipse. 
  for (int x=0; x<=width; x+=20) {

    //selects colors from image. collects x and y value.
    int a = int(random(0, pic.width));
    int b = int(random(0, pic.height));

    //println(a);

//picks a color value.
    color colorvalues = pic.get(a, b);
    //randomly fills ellipse with color from image.
    fill(colorvalues);
    stroke(255);
    //ellipse. y-coordinate placement based on randomly picked b value selected from the picture. size based on a color value.
    ellipse(x, b/10, a/50, a/50);
    
    //lines bisect ellipses. color also based on image.
    stroke(colorvalues);
    line(x,0,x,300);

    noLoop();
  }
}



