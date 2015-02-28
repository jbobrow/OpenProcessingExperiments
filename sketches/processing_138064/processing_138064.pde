
//Final Assignment
/*For my final piece I wanted to make something fun, colorful, and beautiful that challenged me to come up with new ways to apply what we've learned.
My goal for this assignment was to test out some newly acquired knowledge about using trigonometry functions and the golden ratio to create
amazing looking designs that seem to shift from swirling one way to swirling the other way and even spiraling in on themselves. I wanted to see
it in motion, so I mapped the range of angles to mouseX and the overal size range to mouse Y. The galaxy motif came about from its appearance.
After that, I really wanted to figure out how I could stagger the color of each star to create a pulsing effect. Finally, there's a hidden message in my sketch! 
When the blank space in the middle is at its largest (mouse should be in bottom right hand corner area) click the mouse and see what else I have to say! 
Or you can look at the code below. Either way. */

//Global Variables
color[] starColor = {#50CCAC, #D7246D, #C5FF17, #FFEC7F, #5767BC};
int colorCount = 0;
boolean secretShow = false;

//Setup
void setup(){
  size(800,800);
  background(000000);
  frameRate(5);
}//setup
//Draw
void draw(){
  background(000000);
  float x = 0;
  float y = 0;
  float angle = map(mouseX, 0, width, 136, 138);
  float radius = map(mouseY, 0, height, 25, 100);
  float radiusIncrease = 1.005;
  float rotation = 0;
  int starRadius = 10;
  int starAngle = 72;

  for (int i = 0; i<360; i++){   
     if(colorCount >=5){
      colorCount -=5;
    }//if   
    fill(starColor[colorCount]);
    //fill(starColor[int(i/72)]);
    radius *= radiusIncrease;
    rotation += angle;
    x = (width/2)+cos(radians(rotation))*radius;
    y = (height/2)+sin(radians(rotation))*radius;
    beginShape();
      noStroke();
      for (int s = 0; s < 5; s++){
        vertex(x+cos(radians(starAngle))*starRadius, y+sin(radians(starAngle))*starRadius);
        starAngle+=144;
      }//for s
    endShape();
      colorCount++;
  }//for i
  colorCount++;
  if (mouseX < 650 || mouseY < 650) secretShow = false;
  if (secretShow){
    String hiddenMessage = "I hope you had as much fun as I did learning Processing. Good luck on your final! Bye!";
    textAlign(CENTER);
    textSize(15);
    fill(#50CCAC);
    rectMode(CENTER);
    text(hiddenMessage,(width/2), (height/2)+20, 150, 150);
  }//if

}//draw

void mousePressed(){
      if (mouseX > 650 && mouseY > 650) secretShow = true;
}//mousePressed()

