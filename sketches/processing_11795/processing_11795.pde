
// Assignment #1
// Name: Ariele Martinez
// E-mail: acmartinez@brynmawr.edu 
// Date: September 7, 2010

void setup () {
  size (600, 600);
  background(255);
}

void draw () {
  strokeWeight(5);
  stroke(0);
  //vertical lines
  line (50, 0, 50, 600);
  line (250, 0, 250, 600);
  line (300, 0, 300, 225);
  line (500, 0, 500, 600);

  //horizontal lines
  line (0, 50, 50, 50); //topleft
  line (0, 225, 50, 225);
  line (250, 500, 500, 500);
  line (450, 500, 450, 600);
  line (250, 225, 500, 225);
  line (0, 550, 250, 550);
  line (0, 175, 500, 175);
  line (500, 430, 600, 430);
  //line 50, 225, 250, 225) //third line down connector
  line (0, 550, 600, 550);

//red
 
  fill(255, 0, 0);
  stroke(255, 0, 0);
  rect(255, 230, 240, 265);
 
  
  //yellow
  stroke(255, 255, 0);
  fill(255, 255, 0);
  rect (255, 0, 40, 170);
  rect(55, 555, 190, 45);

  //blue
  fill(0, 0, 255);
  stroke(0, 0, 255);
  rect(0, 0, 45, 45);
  rect(455, 505, 40, 40);



  //black
  fill(0);
  stroke(0);
  rect(0, 175, 50, 50);

}

