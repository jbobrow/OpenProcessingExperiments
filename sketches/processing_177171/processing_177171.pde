
int counter;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(0);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(100),160,1000,700);
  
  if(mousePressed == true) { //add some interaction
    fill(random(255),300,623,1000);
    rect(25,25,75,450);
    rect(112.5,25,10,450);
    rect(400,25,75,450);
    rect(377.5,25,10,450);
  
  }
  else {
    rect(width/2, height/2, 80*sin(counter), 80*sin(counter));
    rect(25,25,75,450);
    rect(112.5,25,10,450);
    rect(377.5,25,10,450);
    rect(400,25,75,450);
  }
}

