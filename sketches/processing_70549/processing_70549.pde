
void setup() {
  size( 600, 600 );
}

void draw () {
background (255);
  rectMode( CORNERS );
  ellipseMode( CENTER );
  
  //feet
  strokeWeight (3);
  stroke (139, 137, 112);
  fill (255, 250, 205);
  rect ((mouseX-300)+225, (mouseY-400)+510, (mouseX-300)+270, (mouseY-400)+495);
  rect ((mouseX-300)+330, (mouseY-400)+510, (mouseX-300)+375, (mouseY-400)+495);
  //arms
   strokeWeight (8);
  stroke (72, 61, 139);
  fill (mouseX, 127 ,mouseY);
  line ((mouseX-300)+225, (mouseY-400)+390, (mouseX-300)+255, (mouseY-400)+345);
  line ((mouseX-300)+345, (mouseY-400)+345, (mouseX-300)+375, (mouseY-400)+390);
  //ears
  strokeWeight (3);
  ellipse ((mouseX-300)+270, (mouseY-400)+150, 30, 120);
  ellipse ((mouseX-300)+330, (mouseY-400)+150, 30, 120);
  //inside ears
  stroke (255, 192, 203);
  fill (255, 192, 203);
  ellipse ((mouseX-300)+270, (mouseY-400)+180, 10, 120);
  ellipse ((mouseX-300)+330, (mouseY-400)+180, 10, 120);
  //legs
  stroke (72, 61, 139);
  fill (mouseX, 127 ,mouseY);
  ellipse ((mouseX-300)+255, (mouseY-400)+465, 60, 60);
  ellipse ((mouseX-300)+345, (mouseY-400)+465, 60, 60);
   //belly
  ellipse ((mouseX-300)+300, (mouseY-400)+420, 120, 120);
  //shoulders
  ellipse ((mouseX-300)+270, (mouseY-400)+330, 60, 60);
  ellipse ((mouseX-300)+330, (mouseY-400)+330, 60, 60);
  //paws and chest
  stroke (139, 137, 112);
  fill (255, 250, 205);
  ellipse ((mouseX-300)+225, (mouseY-400)+390, 30, 30);
  ellipse ((mouseX-300)+375, (mouseY-400)+390, 30, 30);
  ellipse ((mouseX-300)+300, (mouseY-400)+375, 90, 150);
  //scarf
  stroke (255, 192, 203);
  fill (255, 192, 203);
  rect ((mouseX-300)+255, (mouseY-400)+315, (mouseX-300)+345, (mouseY-400)+285);
  rect ((mouseX-300)+315, (mouseY-400)+390, (pmouseX-300)+340, (pmouseY-400)+315);
  //scarfdesign
  rectMode( CENTER );
  stroke (135, 72, 83);
  pushMatrix ();
  translate ((pmouseX-300)+327, (pmouseY-400)+370);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
   pushMatrix ();
  translate ((pmouseX-300)+327, (pmouseY-400)+340);
  rotate (radians (45));
  rect (0,0, 17, 17);
  popMatrix();
  //head
  stroke (72, 61, 139);
  fill (mouseX, 127 ,mouseY);
  ellipse ((mouseX-300)+300, (mouseY-400)+234, 135, 135);
  //mouth
  stroke (139, 137, 112);
  fill (255, 250, 205);
  ellipse ((pmouseX-300)+300, (pmouseY-400)+261, 75, 75);
  //face
  stroke (72, 61, 139);
  strokeWeight (3.5);
  line ((pmouseX-300)+255, (pmouseY-400)+240, (pmouseX-300)+285, (pmouseY-400)+210);
  line ((pmouseX-300)+315, (pmouseY-400)+210, (pmouseX-300)+345, (pmouseY-400)+240);
  line ((pmouseX-300)+285, (pmouseY-400)+285, (pmouseX-300)+309, (pmouseY-400)+250);
  line ((pmouseX-300)+291, (pmouseY-400)+250, (pmouseX-300)+315, (pmouseY-400)+285);
  line ((pmouseX-300)+291, (pmouseY-400)+250, (pmouseX-300)+309, (pmouseY-400)+250);
  }
   void mousePressed() {
     println("In order to live free and happily, you must sacrifice boredom.");
   }
