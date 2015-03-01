
//declare variables
PImage dots;
PFont arialFont;

void setup() {
   size(600,850);
   dots=loadImage("dots.jpg");
   image(dots,0,0);
     
   arialFont=loadFont("Arial-ItalicMT-20.vlw");
  
}

void draw() { 
 //text
  textFont(arialFont);
  fill(0);
  text("Connect the dots.",215,40);

  //drawing
  strokeWeight(2);
  stroke(86,194,250);
  if (mousePressed){
  line(pmouseX,pmouseY,mouseX,mouseY);
  }

}



