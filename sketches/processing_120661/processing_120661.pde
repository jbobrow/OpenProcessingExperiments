
void setup(){ //this makes the image move
size (400,400); // Setup Sketch
smooth(); //smoothness of the screen
background (255);
frameRate(10); // Reduces amount of "snow" on screen slightly.
}

void draw(){ //drawing of image again and again.
  
fill(255); // this is the snow around our snowman but so it dosnt go ontop of the snowman
ellipse(mouseX,mouseY,10,10);
  
ellipseMode (CENTER); // Set ellipse to center for drawing of body.
rectMode (CENTER); // Set Center for snowys hat.
  
fill(255); // Snowmen are white
stroke(0); // Black outline for visibility
ellipse(200,200,100,100); // Snowys Body
ellipse(200,319,140,140); // Snowys lower body
ellipse(200,114,75,75); // Snowys Head

// Time to draw Snowys eyes and nose

fill(0,mouseY,mouseX); // Location of mouse changes Snowys' eye colour
ellipse(180,100,15,15); // Snowys Right eye
ellipse(220,100,15,15); // Snowys Left eye

// Time to draw Snowys nose!

fill(255,165,0); // Snowmen have orange noses!
ellipse(200,120,18,18); // Snowys nose is also circular.

// Time to draw snowys hat!

fill(mouseY,mouseX,0); // Location of mouse changes colour of hat
rect(200,60,50,50); // Main body of the hat!
line(160,85,240,85); // Draw the rim of the hat.

// Time to draw Snowys arms

fill(139,90,43); // Snowy has brown arms because they are wooden!
line(100,150,150,200); // Snowys left arm
line(250,200,300,150); // Snowys right arm
 
// Time to draw snowys splendid buttons

fill(mouseX); // Mouse Location changes the colour of the buttons
ellipse(200,200,15,15); // Middle button
ellipse(200,175,15,15); // Top button
ellipse(200,225,15,15); // Bottom button
}

// Add key and mouse press's for added interactivity!

void mousePressed() { println("Merry Coding!");}
void keyPressed() { println("I love snow!");}
