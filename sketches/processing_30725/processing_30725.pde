
PImage image1; // Add more images if you have more than 3
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;
PImage image7;
ArrayList frames;
int i= -1;
float rectX, rectY;      // Position of square button
float circleX, circleY;  // Position of circle button
float rectSize = 50;     // Diameter of rect
float circleSize = 53;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;
PImage currentImage;
 
void setup(){
  size(800,500);
  smooth();
  rectColor = color(0); //Change the color of the buttons
  rectHighlight = color(51);
  circleColor = color(255);
  circleHighlight = color(204);
  currentImage = loadImage("095.JPG");;
  circleX = width/1.15+circleSize/2+10;
  circleY = height/1.15;
  rectX = width/1.15-rectSize-10;
  rectY = height/1.15-rectSize/2;
  ellipseMode(CENTER);
  image1=loadImage("094.JPG");//Change image names to those in file
  image2=loadImage("095.JPG");
  image3=loadImage("096.JPG");
  image4=loadImage("097.JPG");
  image5=loadImage("098.JPG");
  image6=loadImage("102.JPG");
  image7=loadImage("103.JPG");
  image1.resize(800,500);
  image2.resize(800,500);
  image3.resize(800,500);
  image4.resize(800,500);
  image5.resize(800,500);
  image6.resize(800,500);
  image7.resize(800,500);
 
  frames = new ArrayList(7);//CHange this if you have more than 3 images
  frames.add(image1);
  frames.add(image2);
  frames.add(image3);
  frames.add(image4);
  frames.add(image5);
  frames.add(image6);
  frames.add(image7);
  
 
}
  void draw(){
    i++;
    if(i <= 5){ //Change this if you don't want the buttons to show up at 3rd image
    imageMode(CENTER);
    image((PImage) frames.get(i),width/2,height/2);
    delay(2000);
    }
      
   if(i>5){ //You must change this if you change the one above
      update(mouseX, mouseY);
      background(0);
      image(currentImage,width/2,height/2);
   
  if(rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
   
  if(circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);

}
  }
void update(float x, float y)
{
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}
 
void mousePressed()
{
  if(circleOver) {
    currentImage = (PImage)frames.get(frames.size()-2);
  }
  if(rectOver) {
    currentImage = (PImage)frames.get(frames.size()-1);
  }
}
 
boolean overRect(float x, float y, float width, float height)
{
  if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
 
boolean overCircle(float x, float y, float diameter)
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

