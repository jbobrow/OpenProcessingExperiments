
int monstertjeY;
int monstertjeX;
int pmonstertjeY;
int pmonstertjeX;  //variabelen naam

void setup() {
  size(500, 500); //grootte document
  smooth();
  frameRate(30);
  monstertjeY = height;
  monstertjeX = width/2;
  pmonstertjeY = height;
  pmonstertjeX = width/2;   //variabelen waarde
}

 
void draw() {
  background(0); //achtergrond kleur
   
  rectMode(CENTER);        //body
  stroke(255);
  fill(monstertjeX,0,monstertjeY);
  rect(monstertjeX, monstertjeY, 50, 80);
   
  line(monstertjeX-70, monstertjeY-25, monstertjeX-25, monstertjeY+10); //left arm
  line(monstertjeX+70, monstertjeY-25, monstertjeX+25, monstertjeY+10); //right arm
  line(monstertjeX-20, monstertjeY+40, pmonstertjeX-30, pmonstertjeY+80); //left leg
  line(monstertjeX+20, monstertjeY+40, pmonstertjeX+30, pmonstertjeY+80); //right leg
   
  ellipseMode(CENTER);    //head
  stroke(255);
  fill(monstertjeX,0,monstertjeY);
  ellipse(monstertjeX, monstertjeY-40, 100, 75);
   
  ellipseMode(CENTER); //left eye
  stroke(255);
  fill(255);
  ellipse(monstertjeX-15, monstertjeY-35, 20, 25);
   
  ellipseMode(CENTER); // left eye pupil
  stroke(0);
  fill(0);
  ellipse(monstertjeX-10, monstertjeY-40, 10, 15);
   
  ellipseMode(CENTER); //right eye
  stroke(255);
  fill(255);
  ellipse(monstertjeX+15, monstertjeY-35, 20, 25);
   
  ellipseMode(CENTER); // right eye pupil
  stroke(0);
  fill(0);
  ellipse(monstertjeX+10, monstertjeY-35, 10, 15);
   
  stroke(monstertjeX,0,monstertjeY);
  line(monstertjeX-40, monstertjeY-95, pmonstertjeX-5, pmonstertjeY-50); // left antenna
  line(monstertjeX+40, monstertjeY-95, pmonstertjeX+5, pmonstertjeY-50); // right antenna

  monstertjeY = monstertjeY - 1;
  pmonstertjeY = pmonstertjeY - 1;
  monstertjeX = mouseX;
  pmonstertjeX = pmouseX;
}
void mousePressed(){
  
  println("Meow");
}

