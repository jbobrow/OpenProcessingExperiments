
// Archer the Seal
void setup() {
  size(800,800);
}

void draw() {
  
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
// Right Arm
  noStroke();
  fill(195);
  quad(mouseX+410, mouseY+335, mouseX+420, mouseY+400, mouseX+460, mouseY+330, mouseX+450, mouseY+310);

  noStroke();
  fill(195);
  triangle(mouseX+450, mouseY+310, mouseX+460, mouseY+330, mouseX+495, mouseY+300);

// Left Arm
  noStroke();
  fill(195);
  quad(mouseX+305, mouseY+460, mouseX+320, mouseY+480, mouseX+380, mouseY+430, mouseX+350, mouseY+340);

  noStroke();
  fill(195);
  triangle(mouseX+305, mouseY+460, mouseX+320, mouseY+480, mouseX+273, mouseY+480);

// Right Leg
  noStroke();
  fill(195);
   quad(mouseX+490, mouseY+410, mouseX+510, mouseY+445, mouseX+545, mouseY+425, mouseX+560, mouseY+380);

 // Left Leg
  noStroke();
  fill(100);
  quad(mouseX+520, mouseY+430, mouseX+480, mouseY+460, mouseX+560, mouseY+490, mouseX+545, mouseY+445);

// Lower Body
  noStroke();
  fill(160);
  ellipse(mouseX+430, mouseY+435, 190, 100);

// Upper Body
  noStroke();
  fill(160);
  ellipse(mouseX+380, mouseY+380, 110, 180);

//Body Spots
  noStroke();
  fill(100);
  ellipse(mouseX+350, mouseY+380, 50, 50);

  noStroke();
  fill(120);
  ellipse(mouseX+410, mouseY+360, 20, 20);

  noStroke();
  fill(80);
  ellipse(mouseX+370, mouseY+450, 40, 40);

  noStroke();
  fill(80);
  ellipse(mouseX+385, mouseY+430, 20, 20);

  noStroke();
  fill(60);
  ellipse(mouseX+450, mouseY+405, 35, 35);

  noStroke();
  fill(60);
  ellipse(mouseX+480, mouseY+425, 15, 15);

  noStroke();
  fill(130);
  ellipse(mouseX+440, mouseY+460, 25, 25);




// Head Base
  noStroke();
  fill(185);
  ellipse(mouseX+360, mouseY+280, 105, 105);

// Eyes
  stroke(0); 
  fill(0);
  ellipse(mouseX+340, mouseY+290, 25, 25); //Left Eye

  stroke(255);
  fill(255);
  ellipse(mouseX+334, mouseY+283, 10, 10); //Left Large Reflection

  stroke(255);
  fill(255);
  ellipse(mouseX+340, mouseY+290, 6, 6); //Left small Reflection

  stroke(0); 
  fill(0);
  ellipse(mouseX+380, mouseY+283, 25, 25); //Right Eye

  stroke(255);
  fill(255);
  ellipse(mouseX+374, mouseY+276, 10, 10); //Right Large Reflection

  stroke(255);
  fill(255);
  ellipse(mouseX+380, mouseY+283, 6, 6); //Right small Reflection


// Cheeks
  stroke(200);
  strokeWeight(2);
  fill(220);
  ellipse(mouseX+340, mouseY+325, 55, 55);

  stroke(200);
  strokeWeight(2);
  fill(220);
  ellipse(mouseX+394, mouseY+315, 55, 55);

// Nose
  stroke(80);
  strokeWeight(2);
  fill(140);
  ellipse(mouseX+364, mouseY+310, 35, 35);

// Horn
  stroke(90);
  strokeWeight(2);
  fill(120);
  ellipse(mouseX+350, mouseY+240, 25, 25);

  stroke(100);
  strokeWeight(2);
  fill(140);
  ellipse(mouseX+347, mouseY+230, 20, 20);

  stroke(120);
  strokeWeight(2);
  fill(150);
  ellipse(mouseX+345, mouseY+220, 17, 17);

  stroke(140);
  strokeWeight(2);
  fill(170);
  ellipse(mouseX+343, mouseY+212, 15, 15);

  stroke(160);
  strokeWeight(2);
  fill(190);
  ellipse(mouseX+341, mouseY+205, 12, 12);

  stroke(180);
  strokeWeight(2);
  fill(200);
  ellipse(mouseX+339, mouseY+198, 10, 10);

// Whiskers
  stroke(0);
  fill(0);
  line(mouseX+335, mouseY+315, mouseX+300, mouseY+320);

  stroke(0);
  fill(0);
  line(mouseX+335, mouseY+325, mouseX+310, mouseY+335);

  stroke(0);
  fill(0);
  line(mouseX+397, mouseY+305, mouseX+430, mouseY+297);

  stroke(0);
  fill(0);
  line(mouseX+400, mouseY+315, mouseX+425, mouseY+315);

}


