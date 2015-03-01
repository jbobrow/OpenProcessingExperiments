

void setup(){
  size(600, 600);
  background(#517286); // Sets the background to blue
  smooth();
}
 
void draw(){
  draw_grass();
  draw_ears();
  draw_face();
  draw_eyes();
  draw_nose();
  draw_noseholes();
  draw_mouth();
}
 
void draw_grass(){
  fill(#1CA923); // Sets the colour to green
  for(int i=30; i<=600; i+=30){ // Loops until the end of the screen
    triangle(i-30, 600, i-15, 500, i, 600); // Draws some grass at the current position
  }
}
 
void draw_ears(){
  fill(#A9551C); // Sets the colour to orange
  triangle(250, 150, 150, 100, 150, 350); // Draw the tiger's right ear
  triangle(350, 150, 450, 100, 450, 350); // Draw the tiger's left ear
}
 
void draw_face(){
  fill(#824716); // Sets the colour to orange
  ellipse(300, 300, 350, 350); // Draws the base of the tiger's face
}
 
void draw_eyes(){
  int posX = 240;
  for(int i=0; i<2; i++){ // Loops to draw both eyes
    fill(255,255,255); // Sets the colour to white
    ellipse(posX, 215, 50, 70); // Draws the outer eye
    fill(0); // Sets the colour to black
    ellipse(posX, 215, 25, 70); // Draws the inner eye
    posX += 120;
  }
}
 
void draw_nose(){
  fill(0); // Sets the colour to black
  ellipse(300, 300, 75, 50); // Draws the tiger's nose
}
 
void draw_noseholes(){
  fill(#FFFFFF); // sets the colour to white
  ellipse(310, 300, 10, 10); // Draws the tiger's nose holes
  ellipse(290, 300, 10, 10); // Draws the tiger's nose holes
} 
 
void draw_mouth(){
  fill(#FF98F6); // Sets the colour to purple
  triangle(250, 375, 350, 375, 300, 425); // Draws the tiger's mouth
}
