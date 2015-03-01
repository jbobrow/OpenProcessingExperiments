
// Wirrwar
// 03.12.2014

/*  Schreibe ein Programm, das Linien zeichnet, die an der aktuellen Mausposition beginnen und an einem zufaelligen Punkt enden. Ihre Farbe sollen GrÃ�ï¿½Ã�Â¼n- und BlautÃ�ï¿½Ã�Â¶ne sein. Der Anteil der roten Farbe ist dementsprechend Null.
Aendere dein Programm nun so, dass auch der Startpunkt der Linie zufaellig ist.
*/



float z=100; 


float x=100; 


float y=100; 


  


boolean paused = false; // set up boolean variable called pause assumes it starts with key not pressed 


  


void setup(){ 


  size (800,800); 


  background (255); //white background 


  smooth(); // setting smoothness 


} 


  


void draw() {  


     if(!paused) runMyCode(); //if keypressed is false run the code called runMyCode 


}  


  


void runMyCode() { // running of the code if key pressed is false 


     //filling all variables with random values 


    x=random(width);// random x position between 0 and 100 


    y=random(height);// random y position between 0 and 100 


    


  //use values to draw an ellipse 


    


    


  //if mouse is pressed lines become white 


  // else the lines are random 


    


  if ((mouseX<width/2) && (mouseY<height/2) && (mousePressed)) {  


 //     stroke (255,0,0);//stroke with red 


      line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions 


  } else if ((mouseX>width/2) && (mouseY<height/2) && (mousePressed)) {  


      stroke (0,255,0);//stroke with green 


      line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions 


} else if ((mouseX<width/2) && (mouseY>height/2) && (mousePressed)) {  


      stroke (0,0,255);//stroke with blue 


      line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions 


} else if ((mouseX>width/2) && (mouseY>height/2) && (mousePressed)) {  


      stroke (0);//stroke with black 


      line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions 


} else{ 


      stroke ((0),random(255),random(255),random(255));//fill with random colour and opacity 


      line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions 


} 


} 


   


  


    


  


void keyPressed() { 


     paused = !paused; 


}  

