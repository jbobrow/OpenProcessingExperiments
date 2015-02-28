
//Chris Galea, Arch 1391, Project 2
//Contains code by Maunel Guerra's "Funny Fliud"
//Located at http://www.openprocessing.org/visuals/?visualID=3768


int n=400;

float maxheight = 100;
  float heightUp = random(20, maxheight);
  float colourtest = 30;

  

void setup () {
  size (400, 600);
  frameRate(8);
  colorMode(HSB, height/2);
  smooth();
  
  
}

void draw() {
  background(0);
  
for (int test = 0; test < width; test += 10) { 
    fill (colourtest+heightUp,400,400,75); 
    rect(test, 600, 15, heightUp-375);

//fill (colourtest+heightUp,400,400,75);   
//ellipse(test-5, heightUp+150, 20, 20); 

fill (colourtest+heightUp,400,400);  
ellipse(test-5, heightUp+50, 20, 20);


//code from  Funny Fluid by Manuel Guerra 
{point(mouseX,mouseY);
loadPixels();for(int i=n*n-n-1;i>n;i--)
pixels[i]=int((pixels[i-n]+pixels[i+1]+pixels[i-1])/3);
updatePixels();}   
// end of code from Funny Fluid

ellipse(test-5, heightUp, 10, 10);
stroke(0);
  {
   heightUp = random(20, maxheight)+50;
 
  }
  
  }}
 

  if (maxheight < 400) {
  maxheight += 10;}
  else {maxheight = 50;}
}



