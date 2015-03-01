
/*
Tyler Sinclair

Here is a program that makes a pattern from a letter
*/
 
size(400,400); 
background(255,255,255); //background color
int startX = 0; //x-position
int startY = 1; //y-position
 
//color
colorMode( HSB ); //set color mode to HSB
float h, s, b, a; 
h = 150; //default hue value
s = 255; //default saturation value
b = 255; //default brightness value
a = 125; //default alpha value

 
for( int i = startX; i <= width ; i = i + 32){ 
  for( int j = startY; j <= height; j = j + 5){ 
    //generate color values
    h = random(155,200);
    s= random (0,255);
    b = random(0,255);
    a = random(0,255);
    fill( h, s, b, a );
    
    
    textSize(random(4,200));
     
    text("a", i, j);//draws the letter a
  } 
}



