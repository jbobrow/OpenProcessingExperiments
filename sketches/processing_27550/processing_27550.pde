
int counter;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(170,150,200);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 300;
}

void draw() {  //draw function loops 
  counter++;
  noStroke(0);
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    triangle(mouseX, mouseY, mouseX, 20, 86, 75);
    fill(random(255),100,255,50);
  }
  else {
    ellipse(width/2, height/2, 200*sin(counter), 200*sin(counter));
    ellipse(width/4.5, height/3.5, 110*sin(counter), 110*sin(counter));
    ellipse(width/1.3, height/3.5, 110*sin(counter), 110*sin(counter));
    ellipse(width/3, height/2, 20*sin(counter), 20*sin(counter));
    ellipse(width/1.49, height/2, 20*sin(counter), 20*sin(counter));
    ellipse(width/2, height/1.7, 90*sin(counter), 90*sin(counter));
    ellipse(width/2, height/1, 200*sin(counter), 300*sin(counter));
    
  }
font = loadFont("FFScala-32.vlw"); 
textFont(font); 
text("B", 160, 105);
textSize(130);
fill(0, 10, 13, 51);
}

                
                                                                                
