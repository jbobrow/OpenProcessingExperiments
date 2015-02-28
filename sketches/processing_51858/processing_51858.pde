
int counter, xx, yy;
 
void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
//  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  xx = 0;
  yy = 0;
}
 
void draw() {  //draw function loops
  counter++;
  noStroke();
  fill(random(255),200,255,300);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 60, 60);
    rect(mouseX-20, mouseY-20, 50, 50);
    line(50,20,70,100);
    //animate two - circle flying diagonally across
    ellipse(450, 450, xx, yy);
     
    if (xx <= 60)
      xx++;
    else
      xx--;
      
     if (yy <= 60)
      yy++;
    else
      yy--;

  }
  else {
  
    
  smooth();
  noStroke();
  beginShape();
  vertex(50, 15); 
  bezierVertex(50, -5, 90, 5, mouseX, mouseY); 
  vertex(50, 15); 
  bezierVertex(50, -5, 10, 5, mouseX, mouseY); 
  endShape();
  
//animate one - circle on right hand corner
  ellipse(xx, yy, 60, 60);
   if (xx <= 500)
      xx++;
    else
      xx--;
      
     if (yy <= 500)
      yy++;
    else
      yy--;

  
  }

}


