
int col1;
int col2;

 void setup () {
//setup function called initially, only once

  
size(250, 250);

  
background(255);
  
//set background white
  colorMode(HSB);   

//set colors to Hue, Saturation, Brightness mode

  
counter = 0;

}



void draw() {

  //draw function loops

 
fill(random(255),random(255),random(255));

rect(100, 100, 100, 100);


fill(random(255),random(255),random(255));

rect(0, 0, 100, 100);


fill(random(255),random(255),random(255));

rect(0, 100, 100, 100);


fill(random(255),random(255),random(255));

rect(100, 0, 100, 100);

fill(random(255),random(255),random(255));

rect(50, 50, 100, 100);

}
