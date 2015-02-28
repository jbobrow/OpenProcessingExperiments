
int H=0; //color Hue variable
int A=10; //color Alpha variable
int S=70; //color Saturation variable
int B=75; //color Brightness variable
int W=400; //window Size variable

/////////////////////////////////////////////////

void setup(){
  size(400,400);
  colorMode(HSB,100,100,100,100);     //makes the color range 1-100
  strokeCap(ROUND);                   //round the end of the lines
  background(100);
  frameRate(30);
  smooth();

}             /////////////////////////////////////////////////

void draw(){

  if(H>=99){  //this if statement makes the Hue cycle and loop from 0 to 100
    H=0;      
  }           
  else{       
    H=H+1;    
  }            /////////////////////////////////////////////////

  stroke(0,0,50,100);
  strokeWeight(2);  

  if(keyPressed) {    //this if statement clears the screen when "C" is pressed on the keyboard
    if (key == 'c' || key=='C') {
      fill(0,0,85,100);
      rect(1,1,width-3, height-3);
    }
  }            /////////////////////////////////////////////////

  if(mousePressed) {  //this if statement makes the color change from grey to colored when the mouse is clicked
    fill(0,0,85,0);
    rect(1,1,width-3, height-3);
    S=70;
    B=75;
    A=80+(abs(mouseY-pmouseY)/20);
  } 
  else {
    fill(0,0,85,5);
    rect(1,1,width-3, height-3);
    S=0;
    B=60;
    A=100;
  }            /////////////////////////////////////////////////

  strokeWeight(2+abs(pmouseX-mouseX)); //this makes the thickness of the line increase based on how fast the mouse moves
  stroke(H,S,B,A);
  line(pmouseX, pmouseY, mouseX, mouseY); //this draws lines between the mouse location and the previous mouse location
}






