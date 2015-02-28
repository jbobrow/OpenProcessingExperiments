
int counter;
int x = 0;
int y = 0;

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
  x = width/2;
  y = height/2;
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(x, y,80*sin(counter),80*sin(counter));
  }
}

void keyPressed(){
    if(key == CODED){
        if(keyCode == UP)
            y++;
        if(keyCode == DOWN)
            y--;
        if(keyCode == LEFT)
            x++;
        if(keyCode == RIGHT)
            x--;
    }
}
