
// Setup the Global Variables
boolean isSketching = false;
boolean firstClick = false;
// PrintWriter output;
int oldX;
int oldY; 

void setup() {
  size(800, 600);
  background(150);
  smooth();
  colorBar();
  // Create a new file in the sketch directory
 // output = createWriter("positions.txt"); 
  
}

void mousePressed() {
  if (isSketching == true) {
    vertex(mouseX, mouseY);
    //output.println(" vertex(" + mouseX + "," + mouseY +");");
    println(" vertex(" + mouseX + "," + mouseY +");");
    if(firstClick == true){
      firstClick = false;
    }else{
        line(oldX,oldY,mouseX,mouseY);
    }
    oldX = mouseX;
    oldY = mouseY; 
    }
  }

void colorBar(){
 for (int i = 0; i < 31; i = i+1) {
  noStroke();
  fill( (250*i/30) );
  rect(((800/30)*i), 580, (800/30), 10);
} 
}

void keyPressed() 
{
  if (key == ' ') {
    if (isSketching == false) {
      beginShape();
      stroke(mouseX*250/800);
      fill(mouseX*250/800);
      /* More old Week 1 stuff 
        // output.println("fill(" + (mouseX*250/800) +");");
        // output.println(" beginShape();");
      */
      println("fill(" + (mouseX*250/800) +");");
      println(" beginShape();");
      firstClick = true;
      isSketching = true;
    } 
    else {
      isSketching = false;
      endShape(CLOSE);
      //output.println("endShape(CLOSE);");
      println("endShape(CLOSE);");
    }
  }
   if (key == TAB) {
    /*  This is outdated, used in the first assignment to write the coordinates to
    a file. Unecessary for assignment 2, as we are outputting images instead.
    output.flush(); // Writes the remaining data to the file
    output.close(); // Finishes the file
    exit(); // Stops the program
    */
    
    save(month() + "-" + day()  + "-" + hour()  + "_" + minute ()  + "-" + second() + ".jpg");
  }
}

void draw() {
}

