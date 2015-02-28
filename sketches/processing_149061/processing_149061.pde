

/*Konkuk University 
 Department of Dynamic Media 
 SOS iDesign 
 Name:Park Seeun
 ID:201420078
 */

float x, y;
int value = 0;  
float xoff; 

void setup() { 
  size (displayWidth, displayHeight); 
  smooth(); 
  //frameRate(20);
} 


void title() {  
  fill(255); 
  textAlign(RIGHT); 
  text("ParkSeeun,Candy,Dynamic Media,2014", 500, 500);
} 


void draw() {
  noStroke();
  fill(#A3D7BD);
  rect(0, 0, width, height);

  xoff = xoff + 0.03; // 0.005-0.03 works best for most applications 
  float nx = noise(xoff)*200;

  fill(#E7D981);
  stroke(#A3D7BD);
  strokeWeight(20);
  //line(mouseX, mouseY, pmouseX, pmouseY); 

  strokeWeight(6);
  fill(#AD71AA);
  ellipse(x, y, 200+nx, 200+nx);
  fill(#E291B1);
  ellipse(width-x, y, 150+nx, 150+nx);
  fill(#F8C0D6);
  ellipse(x, height-y, 100+nx, 100+nx);

  pushMatrix();
  translate(x, height-y);  
  fill(#A3D7BD); 
  stroke(#A3D7BD);
  strokeWeight(5); 
  beginShape();  
  vertex(0, -50); 
  vertex(14, -20);  
  vertex(47, -15);  
  vertex(23, 7);  
  vertex(29, 40);  
  vertex(0, 25);  
  vertex(-29, 40);  
  vertex(-23, 7);  
  vertex(-47, -15);  
  vertex(-14, -20);  
  endShape(CLOSE);
  popMatrix();

  x = lerp(x, mouseX, 0.05);
  y = lerp(y, mouseY, 0.05);

  if (keyPressed) { 
    if (key == '1') { 
      setup();
    }
  }
} 



void mousePressed() { 
  noLoop();
} 

void mouseReleased() { 
  loop();
} 

void keyPressed() { 
  background(255); 
  redraw();
} 
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
