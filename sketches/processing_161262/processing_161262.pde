


void setup() {  //setup function called initially, only once
  size(550, 550);
  background(25);  //set background Black
  colorMode(B);   //set color "B" Brightness
  counter = 0;
  PFont fontA = loadFont("Chalkduster");
  textFont(fontA, 20);
}

void draw() {  //draw function loops 
  rect(202, 310, 155, 55);
  noFill();
  rect(30, 20, 65, 55);
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  text("Hello DJ Menace:: HOW ARE YOU TODAY!!",20,23);
  println("Hello DJ Menace:: HOW ARE YOU TODAY!");
  println("Have A Blessed Day");
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
    
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
