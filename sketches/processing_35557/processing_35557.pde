
void setup() {
  size(300, 300);
}



void draw () {

  if (mousePressed == true) {   // caution light appears when sketch is clicked
    background (100);
    
    stroke(50); // caution light wire
    strokeWeight(3);
    line(0, 50, width, 50);
    line(150, 50, 150, 100);
    
    stroke(200);  //caution light frame
    strokeWeight(1);
    fill(50);
    rect(150-40, 100, 80, 80);
    rect(150-35, 105, 70, 70);
   
   //caution light...changes from black to yellow when mouse moves up and down
    fill(mouseY+50, mouseY, 0);  
    ellipse(150, 140, 60, 60);
  } 
  else {  //this is what happens when the mouse is not clicked


    background(200);
    stroke(0);
    strokeWeight(3); // stoplight wire
    line(0, 50, width, 50);

    line(mouseX+30, 100, mouseX+30, 50); //wire hanger...moves left to right with mouse

    strokeWeight(1); // stoplight frame...moves left to right with mouse
    stroke(0);
    fill(100);
    rect(mouseX, 100, 60, 160);
    stroke(200);
    fill(50);
    rect(mouseX+5, 105, 50, 50);
    rect(mouseX+5, 155, 50, 50);
    rect(mouseX+5, 205, 50, 50);

    fill(mouseX, 0, 0); // red light...fades from black to red as mouse moves left to right, respectively
    ellipse(mouseX+30, 130, 40, 40);
    fill(mouseX+100, mouseX+50, 0); //yellow light....fades from black to yellow as mouse moves left to right, respectively
    ellipse(mouseX+30, 180, 40, 40);
    fill(0, 255 -mouseX, 0); // green light...fades from green to black as mouse moves left to right, respectively
    ellipse(mouseX+30, 230, 40, 40);
  }
}


