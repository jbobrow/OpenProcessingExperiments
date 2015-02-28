
int counter;

void setup() //setup function called initially, only once
{  
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() //it loops
{  
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) 
  { 
    triangle(mouseX, mouseY, mouseX - 20, mouseY + 80, mouseX + 20, mouseY + 80)
  }
  
}
