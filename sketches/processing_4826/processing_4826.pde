
float grijs;
float x = 0;
float y = 0;
float snelheid = 3;

void setup() {
  size(500,500);
  smooth();
}

void draw() {
  // Achtergrond 
  background(#C61A28);
  
  // achtergrond veranderen
  if(mouseY < 250) 
  { background(#C61A28);
  }
  else 
  { background(#28B5DE);
  }
  
  // positie veranderen
  if (y > 450 || y < 0) { 
    snelheid = snelheid * -1;
  }

  grijs = random(0,255);
  y = y + snelheid;
  
  fill(grijs,100);
  ellipse(350,y,50,50);
  ellipse(150,y,50,50);
  ellipse(450,y,100,100);
  ellipse(50,y,100,100);
  
  println (x);
  println (y);
  
  // lijn
  stroke(0);
  strokeWeight(abs(mouseX-pmouseX));
  strokeCap(ROUND);
  line(pmouseX,pmouseY,mouseX,mouseY);
}

