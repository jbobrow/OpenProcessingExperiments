


//import processing.pdf.*;// this is a  library wich is going to let the file saved asa pdf

void setup(  )  {// void setup is to set the canves where the sketch is going to take place
//beginRecord(PDF, "dotswall.pdf"); //the name of the file that is going to be saved
size(800,900); // seting up the canves size
background(0); //The background color of the canvas is black. The color the Processing is using is RGB.
smooth(); //this is for smooth edges
}


void draw(){   // what is going to be sketched in the canvas

ellipse(random(800),random(800),10,10);// Drawing the ellipse where the X and Y axis is random. However, 
//the size of the ellipse does not change only the placement of the ellipse changes randomly.
//Therefore, the ellipse jumps out of the screen randomly.

line(random(800),random(800),10,10);//X and Y  - the line will spread randomly throughout the canvas
//but the position of the line will start from one point and spread out randomly. 
//Therefore 10,10 is the position of the line on the canvas.

stroke(255, random(30,225), random(70,225));//The stroke is going to decide on the color of the line and the ellipse. 
//The choices of the color is random.

strokeWeight(random(2,10));//The strike weight is deciding on the weight of the line which is spreading  throughout the canvas. 
//The weight is going to be between 2 and 10.






}
//void keyPressed() {//this action tell the computer whene the key 'e' is pressd then finsh the recording
//the file will be saved
  //if (key == 'e') {
   // endRecord();
   // exit();
 // }
//}


  
  







