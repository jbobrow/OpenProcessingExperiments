
/*The current project is produced for the Introduction to Computational Arts Course.
This sketch interacts with the user through keyboard and mouse. My idea was to create a "platform" that translates the mouse movement and key presses into shape properties. The draft of this project, that also worked for me as the 3rd assignment for the course, can be seen if you uncomment the code lines for key presses C and B below. The current version utilizes pictures. My main goal here is to produce interesting images with the use of geometrical figures. Periodicity of the geometrical designs when altered in size and orientation can lead to optical experiences that remind us of optical illusions.
In this sketch you will be able to work with two images.I worked with lots of other images but unfortunately could not use them here due to license issues.
INSTRUCTIONS FOR USER: There are three ways to interact with this platform.The mouse click,the mouse movement and the E key. Try each one and pairs of them(e.g.mouse movement while one of the buttons is pressed.) Press S to save a screenshot of the figure you created.
Hope you ll enjoy it.*/


//START
//Declare PImage variable type
//Two images will be used.Try to use it with your own ideas as well.

PImage illusion1;
PImage illusion2;

//SETTING window size,colormode and background color
//the background is white till the user interacts with it
  void setup() {
  size(800,720);
  illusion1=loadImage("pattern11.jpg");
  illusion2=loadImage("pattern5.jpg");
  colorMode(HSB, width,height,100);
  //background(random(width),random(height),random(200));
  background(#FFFFFF);
  }

//DRAWING
void draw(){
  //when a mouse hit occurs, background is set to a new color based on the mouse coordinates 
  if(mousePressed== true){
  background(mouseX,mouseY,50);
  noStroke();
  fill(mouseX+50,mouseY,50);
  
}
  }

//INPUTS
//for key presses
//C and D fixed as comments.You can uncomment them and play with them as well.
void keyPressed(){

  //when key 's' is pressed,a screenshot is saved in .png format 
if (key=='s' || key=='S')
saveFrame("figure.png");

//when e or q is pressed one of the figures appears on the screen.The mouse position is used for definition of the image appearance position and the size of the image.
  if(key=='e' || key=='E'){
     pushMatrix();
  translate(400,360);
  rotate(radians(5+mouseX));
  image(illusion1,0,0,mouseX,mouseX);
  popMatrix();
 }
  
  if(key=='q' || key=='Q'){
     pushMatrix();
  translate(400,360);
  rotate(radians(5+mouseX));
  image(illusion2,0,0,mouseX,mouseX);
  popMatrix();
 
  }
  //C and D! you can uncomment them and play with the beginning of this idea 
//when c is pressed rectangles are drawn.Their angles and colors are modulated by the inputs 
//if (key=='c'||key=='C'){
//  pushMatrix();
//  translate(200,200);
//  rotate(radians(5+mouseX));
//  stroke(10);
//  fill(mouseX,mouseY,50);
//  rect(0,0,150,150);
//  popMatrix();
//  }
//  


//when d is pressed lines are drawn.Their angles and lengths are modulated by the inputs 
//if (key=='d'||key=='D'){
//  pushMatrix();
//  translate(200,200);
//  rotate(radians(5+mouseX));
//  stroke(10);
//  fill(mouseX,mouseY,50);
//  line(0,0,10,130);
//  popMatrix();
//  }  

}


