
//Elise's Processing Homework #2
void setup(){
  size(600,600);
  background(185,234,202);
  smooth();

  for(int i = 0; i < 1000; i+=10){
    noFill();
    stroke(map(i,0,600,0,255));
    ellipse(width/2,height/2,i,i);
  }

  //Face: Top Left
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,100,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,100,165,165);
   
  fill(255);
  ellipse(125,75,20,20);
   
  fill(255);
  ellipse(75,75,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(75,125,125,125);
  
  //Face: Middle Left
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,300,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,300,165,165);
   
  fill(255);
  ellipse(125,275,20,20);
   
  fill(255);
  ellipse(75,275,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(75,325,125,325);
  
  //Face: Bottom Left
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,500,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(100,500,165,165);
   
  fill(255);
  ellipse(125,475,20,20);
   
  fill(255);
  ellipse(75,475,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(75,525,125,525);
  
  //Face: Top Center
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,100,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,100,165,165);
   
  fill(255);
  ellipse(325,75,20,20);
   
  fill(255);
  ellipse(275,75,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(275,125,325,125);
  
  //Face: Bottom Center
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,500,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,500,165,165);
   
  fill(255);
  ellipse(325,475,20,20);
   
  fill(255);
  ellipse(275,475,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(275,525,325,525);
  
  //Face: Top Right
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(500,100,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(500,100,165,165);
   
  fill(255);
  ellipse(525,75,20,20);
   
  fill(255);
  ellipse(475,75,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(475,125,525,125);
  
  //Face: Middle Center
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(500,300,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(500,300,165,165);
   
  fill(255);
  ellipse(525,275,20,20);
   
  fill(255);
  ellipse(475,275,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(475,325,525,325);
  
  //Face: Bottom Right
  fill(98,126,160,100);
  noStroke();
  ellipseMode(CENTER);
  ellipse(500,500,185,185);
   
  fill(98,126,160);
  noStroke();
  ellipseMode(CENTER);
  ellipse(500,500,165,165);
   
  fill(255);
  ellipse(525,475,20,20);
   
  fill(255);
  ellipse(475,475,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(475,525,525,525);
}

void draw(){
  //Smile: Middle Center
  fill(mouseX,mouseY,31,15);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,300,185,185);
   
  fill(mouseX,mouseY,31);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,300,165,165);
   
  fill(255);
  ellipse(325,275,20,20);
   
  fill(255);
  ellipse(275,275,20,20);
   
  strokeWeight(10);
  stroke(255);
  line(275,325,325,325);
   
  strokeWeight(10);
  stroke(255);
  line(265,315,275,325);
   
  strokeWeight(10);
  stroke(255);
  line(335,315,325,325);
}

