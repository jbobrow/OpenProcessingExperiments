

//message
String message = "Junopolis";

//circle
PFont f;
float r = 100;
PImage yay;

void setup() {
  yay= loadImage("yay.jpg");
  size(600, 600);
  f = createFont("Futura",60,true);
  textFont(f);
  textAlign(CENTER);
  smooth();
}

void draw() {
  background(mouseX,mouseY/2,128+mouseY);
  image(yay,0,0,300,300);
  image(yay,300,300,300,300);
  
 
  if ((mouseX>= 100) && (mousePressed))
    println("gohome");
    text("gohome",mouseX,mouseY);
  
  // Start in the center and draw the circle
  translate(width / 2, height / 2);
  stroke(0);
  //how can I fill the circle with image :(
  ellipse(0, 0, r*2, r*2);
  
  float arclength = 0;

  for (int i = 0; i < message.length(); i++)
  {
    char currentChar = message.charAt(i);
    float w = textWidth(currentChar);

    arclength += w/2;
    
    float theta = PI + arclength / r;    

    pushMatrix();
    translate(r*cos(theta), r*sin(theta));
    rotate(theta+PI/2); 
     fill(0);
    text(currentChar,0,0);
    popMatrix();  
    arclength += w/2;
  }
}



