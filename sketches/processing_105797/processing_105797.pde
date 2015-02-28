
//map function

void setup(){
  size(400,400);
  //colorMode (RGB, width); 
}

void draw(){
background (150);

float newValue = map(mouseX, 0, width, 0, 255);

//rect on top
rectMode(CENTER);
fill(newValue); //this is drawing from the convertion
rect(width/2, height/4, 100, 100);

//line
line(mouseX, height-20, mouseX, height-60);


//printing values
text(newValue, mouseX, height-65);
println(mouseX);
}
