
int counter;

void setup() {  //setup function called initially, only once
  size(500,500);
  background(0);  //set background black
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 1;
}

void draw() {  //draw function loops 
//ellipse(counter,counter,100,20);
  //counter+=10;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 50, 20);
    ellipse(counter,counter,100,20);
    counter +=10;
    if(counter=500)
    {counter=0;
     ellipse(counter+10,counter,100,20);
    
 }
}
