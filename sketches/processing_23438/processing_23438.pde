
/* This sketch was my first one, inparticular plays with 
translation and for loops.
User interaction: mouse pressed --> redraw
key pressed --> save jpg image
*/

float num_plants = random(5,15); //number of plants -2 (two are drawn outside loop)

void setup() {
  size(600,600); //screen size
  smooth(); //smooth the lines
  colorMode(HSB); //hue, saturation, brightness
  stroke(10,50,50); //stroke colour -->dark brown
  background(255); //white background
  noLoop(); //loop's draw once
}

void draw() {
  background(255); //redraws background when re-looped

  float xposition = (random(100,500));
  float xposition2 = (random(5,30));

  translate(xposition,0); //first plant position along x axis
  plant(); //draw plant
  translate(-xposition,0); //reset translation back

  translate(xposition2, 0);//second plant position along x axis
  plant(); //draw plant
  translate(xposition2, 0); //reset translation back

  pushMatrix(); //save current screen
  for(int i = 0; i<num_plants; i++) { //draw remaining plants
    translate(xposition2*random(0.1,5), 0); //*random scale to vary distances between plants
    plant(); //draw plant
    }
  popMatrix(); //resents screen back to like it was at pushMatrix
}

void plant() { //creates a plant
  float xpos = 0; //x position starting point
  float pL = 50; //length of stem
  float startY = height - pL; //starting y position of first stem
  float ypos2 = startY - pL; //start of subsequent stems
  float num_seg = random(5,20); //number of plant segments --> will affect plant height
  float yscale = 0.92; //scale factor --> new scale of each plant segment

  float e = 5; //stem and leaf join --> diameter
  float Lw = 20; //leaf width
  float Lh = 10; //leaf height

  fill(random(60,80),random(100,220),random(100,220));  //first plant segment
  ellipse(xpos, startY, e, e); //join between stem and leaves
  ellipse(xpos-(0.5*e)-(Lw/2), startY, Lw, Lh); //left leaf (notes below: *1)
  ellipse(xpos+(0.5*e)+(Lw/2), startY, Lw, Lh); //right leaf
  line(xpos, startY -(0.5*e), xpos, startY + pL); //stem

  fill(random(60,80),random(100,220),random(100,220)); //second plant segment
  ellipse(xpos, ypos2, e,e); //join between stem and leaves
  ellipse(xpos-(0.5*e)-(Lw/2), ypos2, Lw, Lh);  //left leaf
  ellipse(xpos+(0.5*e)+(Lw/2), ypos2, Lw, Lh); //right leaf
  line(xpos, ypos2-(0.5*e), xpos, ypos2+pL); //stem

  pushMatrix(); //save current screen
  for(int i=0; i<num_seg; i++) { //subsequent plant segments that are repeated to make whole plant
    fill(random(60,80),random(160,220),random(160,220)); //greens!
    scale(yscale, yscale); //as plant grows segments gradually gets smaller
    ellipse(xpos, ypos2, e,e); //join between stem and leaves
    ellipse(xpos-(0.5*e)-(Lw/2), ypos2, Lw, Lh); //left leaf
    ellipse(xpos+(0.5*e)+(Lw/2), ypos2, Lw, Lh); //right leaf
    line(xpos, ypos2-(0.5*e), xpos, ypos2+pL); //stem
  }
  popMatrix(); //go back to last saved screen
}

void keyPressed() {
  save("plants.jpg");
}

void mousePressed() {
  redraw(); //will re-run draw loop which resets picture
}

/* *1 --> x position = starting x position (xpos) + half diameter of join + half width of leaf
 */

