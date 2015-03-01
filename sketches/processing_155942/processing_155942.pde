
//int circleX = 0; //you're defining your own variable in these four steps
float circleY = 0.6; 
int circleWidth = 50;
int circleHeight = 20; //int = integer 
int circleX;
int strokeColor = 255;
int strokeWeight = 2;
int change = 2;

String sentence = "It worked!";

color c = color(20, 140, 180); //means there is a variable called C and it stands for color (e.g. 200,0,10)

void setup() {
  size(800, 600);
  circleX = 0;
 // frameRate(30);
}

void draw() {
  background(255);
  //draw a circle
  stroke(mouseX/4);
  strokeWeight(mouseY/10);
  //stroke(mouseX/10);
 //strokeWeight(mouseY/10);
  fill(mouseX/5, mouseY/5, 100);
  ellipse(circleX, circleY, circleWidth, circleHeight);
 // if (mousePressed == true) {
 // stroke(mouseX/10);
  //strokeWeight(mouseY/10);  
  //line(mouseX, mouseY, pmouseX, pmouseY);
  
 
  //line(pmouseX, pmouseY, mouseX, mouseY); //pmouseX p=previous -- therefore, it's connecting the previous mouse position with the current one, creating a constant line

  //change the color, size, and position of the circle
  strokeColor = strokeColor - change/8; //you could also say strokeColor += change;
  strokeWeight = strokeWeight - change; // you could also say strokeWeight += change;
  circleX += change; //same as circleX = circleX + change;
  circleY = circleY + change/2; //same as circleY += change*0.5;
  circleWidth = circleWidth + change/2;
  circleHeight = circleHeight + change/2;
  //exit(); stops running
    // + - /
  println(sentence); //everytime the draw function runs it will show It worked! in the console
}



