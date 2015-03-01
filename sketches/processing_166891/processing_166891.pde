
// //////////////////////////////////////////////
// First Processing sketch
// in the web editor, from template
// "Triangles and Black Orb = spiky face with eye", 2014

// Click to draw, type "s" to save, I think loll 
// //////////////////////////////////////////////

int counter;

// They say OpenGL is the focus of 2+, so I put that.

void setup() {  
  size(250, 500, OPENGL);
  background(0);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

// Save a screenshot and hopefuly don't replace last one

void keyPressed()
{ 
  if (key == 's') { save("firstpr_" + random(3)); }
}

// Triangles, one point, some light and an ellipse, it ends up being like that because
// I don't fully get how that works, wanted to do white with a shade like in the examples.

void draw() {  //draw function loops 
  counter++;
  smooth();
  
  if(mousePressed == true) { 
  
    strokeWeight(1); 
    fill(random(255),200,200,200);
    triangle(mouseX, mouseY, random(width), random(height), 55, 55, 1, 1);
    strokeWeight(random(5)); 
    point(random(width), random(height));
    strokeWeight(1); 
    directionalLight(51, 102, 126, -1, 0, 0);
    translate(20, 50, 0);
    ellipse(55, 55, 110, 110);
    }
  else {
          
    }
 }
