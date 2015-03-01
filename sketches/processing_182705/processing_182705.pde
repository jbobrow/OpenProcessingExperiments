
/*
Donahue_Rub
Draw triangles with the mouse. 
The center circle invites you to press down
*/

int counter;
float hue, alpha, sat, bright;

void setup() {  //setup function called initially, only once
  size(400,400);
  background(255);  //set background to black 
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode

  hue=200;
  alpha=105;
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  hue=random(100,170);
  alpha=random(60,100);
  fill (hue, 255, 255, alpha);
  //fill(random(170),100,205,50);
  
  if(mousePressed == true) { //add some interaction
    triangle(mouseX, mouseY, mouseX+15, mouseY+15, mouseX-15, mouseY+15);//have the triangle follow the mouse
  }
  else {//otherwise the middle circle moves
    hue=random(170,200);
    alpha=random(60,100);
    fill (hue, 255, 255, alpha);
    //fill(random(170,225),200,95,50);
    ellipse(width/2, height/2, 30*sin(counter), 30*sin(counter));
    
    hue=random(100,140);
    alpha=random(60,100);
    fill (hue, 255, 255, alpha);
    //fill(random(170,225),200,95,50);
    ellipse(width/2, (height/2)-40, 30*sin(counter), 30*sin(counter));
    
    hue=random(100,140);
    alpha=random(60,100);
    fill (hue, 255, 255, alpha);
    //fill(random(170,225),200,95,50);
    ellipse(width/2, (height/2)+40, 30*sin(counter), 30*sin(counter));
  }
}
