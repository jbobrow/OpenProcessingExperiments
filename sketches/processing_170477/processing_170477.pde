
void setup() {
  size (400, 400); //sets canvas size to 400
}

void draw() {
  background(random(612), random(701), 698); //randomizes background color to blue/purple/green

  int i = 0; //declares a variable called i equal to 0

    while (i<400) { //while the variable i, is less than 400 (canvas size)
    stroke(random(-445), random(0), 0); //totally random values for the color the lines are going to be drawn in
    line(mouseX, mouseY, 0, i); 
    line(mouseX, mouseY, i, 0);
    line(mouseX, mouseY, 400, i);
    line(mouseX, mouseY, i, 400);
    //mouseX, MmouseY is telling all the line to follow where your curser is
    i=i+2; //increases the value of i by 2

      if (keyPressed) {
      background(random(255), random(71), -4744);// if any button on the keyboard is pressed then get random colors, WHILE the button is pressed
    }
   else if (keyCode == DOWN) { //if the button is DOWN then keep the backgrounds on until another key is pressed
 
  background(random(0,255), random(412));
}
else{  line(mouseX, mouseY, 7, 0);} //else just make that line
}

}
