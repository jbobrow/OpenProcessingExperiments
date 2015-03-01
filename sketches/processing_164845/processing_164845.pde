
int counter;
 
void setup() {  
  size(350, 350);
  background(254,221,120);  
  colorMode(HSB);  //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}
 
void draw() {  
  counter++;
  noStroke();
  fill(random(220),100,255,50);
   
  if(mousePressed == true) { 
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/4, height/4, 80*sin(counter), 80*sin(counter));
  
    ellipse(width/2, height/2, 40*sin(counter), 40*sin(counter));
    
    ellipse(width/8,height/8, 40*sin(counter), 40*sin(counter));
    
    ellipse(width/2, height/4, 60*sin(counter), 60*sin(counter));
    
    ellipse(width/8, height/2, 60*sin(counter), 60*sin(counter));
    
    ellipse(width/1.2, height/1.2, 60*sin(counter), 60*sin(counter));
    
    ellipse(width/1.5, height/1.5, 100*sin(counter), 100*sin(counter));
    
    ellipse(width/1.2, height/2, 60*sin(counter), 60*sin(counter));
    
    ellipse(width/1.4, height/9, 40*sin(counter), 40*sin(counter));
    
    ellipse(width/2.9, height/1.4, 60*sin(counter), 60*sin(counter));
    
    ellipse(width/7, height/1.3, 80*sin(counter), 80*sin(counter));
    
    ellipse(width/2.4, height/1.1, 40*sin(counter), 40*sin(counter));
  }
}



