
//Natalie DeCoste
//Problem Set 3
//Question 3, REMIX

int x = 4; //changed value of x to give text a smaller margin 
PFont fontA;
  
void setup() 
{
  size(355, 190); //changed size of sketch to perfectly fit text 
  background(255); //changed background colour to white 

  // Load the font. Fonts must be placed within the data 
  // directory of your sketch. Use Tools > Create Font 
  // to create a distributable bitmap font. 
  // For vector fonts, use the createFont() function. 
  
  fontA = loadFont("HelveticaNeue-CondensedBold-48.vlw"); //changed font to Helvetica
  

  
  textFont(fontA, 45); //changed font size just to be larger in general  

  noLoop();
}

void draw() {
  fill(0);
  text("Hi my name is", x, 40); //changed y values to spread text out more 
  fill(51);
  text("Natalie DeCoste", x, 85);
  fill(204);
  text("and this is", x, 130);
  fill(230); //changed fill colour to be visible on white background 
  text("my REMIX", x, 175); 
}

