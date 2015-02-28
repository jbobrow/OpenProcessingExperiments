
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
}void setup() {  // setup() does not return a value
  size(400, 400);
  smooth();
  strokeWeight(7);
  background(10,150, 255);
  fill(250, 210 ,200);
  ellipse(200, 250, 180, 200);
  
 
 
  
}

void draw() {  // draw() does not return a value

  fill(0,0,0);
  quad(100,30, 300,30, 270, 185, 130,185);
  fill(255,255,0);
  strokeWeight(0);  
  rect(120,30, mouseX/9,100);
  rect(185,30, mouseX/9,100);
  rect(255,30, mouseX/13,100);
  fill( 150,295, 50);
  ellipse(200, 160, 40,40);
  fill(255,0,0);
  ellipse(200,160, 25,20);
  rect(120,120,165,mouseY/20);
  fill(255,255,255);
  strokeWeight(4);
  ellipse(150, 250, mouseX/5, 45);
  ellipse(240, 250, mouseX/5, 45);
  fill(0,0,0);
  ellipse(150, 250, mouseY/10, 30);
  ellipse(240, 250, mouseY/10, 30);

  
  

  
  drawCircle();
}

void drawCircle() {  // This function also does not return a value
  fill(500, 160,90);
  strokeWeight(10);
  line(140, 295, 180, 285);
  line(215, 285, 255, 295);
  line(135, 210, 165,215);
  line(225, 215, 255, 210);
  fill(255,0,0);
  strokeWeight(5);
  rect(170, 300, 50,mouseY/5);


}
