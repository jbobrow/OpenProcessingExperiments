
/* Sandra Crisp 2014
 * Based upon a code sample by Revad
 * Homage; 25 Squares by Vera Molnar
*/

void setup(){
  size(650,650);
  frameRate(1); // the draw function is called once per second
  noStroke(); 
}

void draw(){
  background(#000000); //#BFBFC1  #505050
  // initialise the parameters (they need to be here and not in setup as they are used here)
  int h = 200; // the horizontal position of the top left corner
  int v = 200; // the vertical position of the top left corner
  int cellSize = 135; // the size of the square (bot width and height)

  
//yellow, blue, red, white, black: 1st row

//yellow 
  fill(#B99F04, 150); 
   rect(0 + random(-10,10), 0 + random(-10,10), cellSize, cellSize); 
//blue  
  fill(#2704B9, 150); 
   rect(130 + random(-10,10), 0 + random(-10,10), cellSize, cellSize); 
//red 
  fill(#FF1C08, 150); 
   rect(260 + random(-10,10), 0 + random(-10,10), cellSize, cellSize); 
//white
   fill(#FCD9F2, 150); 
    rect(390 + random(-10,10), 0 + random(-10,10), cellSize, cellSize); 
//black 
   fill(#081648, 150); 
    rect(520 + random(-10,10), 0 + random(-10,10), cellSize, cellSize); 
   

// black, white, red, blue, yellow: 2nd row 

//black
   fill(#052E29, 150); 
    rect(0 + random(-10,10), 130 + random(-10,10), cellSize, cellSize); 
//white
   fill( #DEC3C3, 150); 
    rect(130 + random(-10,10), 130 + random(-10,10), cellSize, cellSize); 
//red
   fill(#E51778, 150); 
    rect(260 + random(-10,10), 130 + random(-10,10), cellSize, cellSize); 
//blue  
   fill(#17B0E5, 150); 
    rect(390 + random(-10,10), 130 + random(-10,10), cellSize, cellSize); 
//yellow
   fill(#E5B917, 150); 
    rect(520 + random(-10,10), 130 + random(-10,10), cellSize, cellSize); 
    
//yellow, blue, red, white, black: 3rd row

//yellow 
  fill(#A3E517, 150); 
   rect(0 + random(-10,10), 260 + random(-10,10), cellSize, cellSize); 
//blue  
  fill(#17E5B0, 150); 
   rect(130 + random(-10,10), 260 + random(-10,10), cellSize, cellSize); 
//red 
  fill(#E54E17, 150); 
   rect(260 + random(-10,10), 260 + random(-10,10), cellSize, cellSize); 
//white 
   fill(#FFFFFF, 150); 
    rect(390 + random(-10,10), 260 + random(-10,10), cellSize, cellSize); 
//black 
   fill(#310421, 150); 
    rect(520 + random(-10,10), 260 + random(-10,10), cellSize, cellSize);  
 
//black, white, red, blue, yellow: 4th row

//black
   fill(#042531, 150); 
    rect(0 + random(-10,10), 390 + random(-10,10), cellSize, cellSize); 
//white
   fill( #DEFAD7, 150); 
    rect(130 + random(-10,10), 390 + random(-10,10), cellSize, cellSize); 
//red
   fill(#F2A30F, 150); 
    rect(260 + random(-10,10), 390 + random(-10,10), cellSize, cellSize); 
//blue  
   fill(#430FF2, 150); 
    rect(390 + random(-10,10), 390 + random(-10,10), cellSize, cellSize); 
//yellow
   fill(#F2DC0F, 150); 
    rect(520 + random(-10,10), 390 + random(-10,10), cellSize, cellSize);    
    
// yellow, blue, red, white, black: 5th row

//yellow 
  fill(#E2F20F, 150); 
   rect(0 + random(-10,10), 520 + random(-10,10), cellSize, cellSize); 
//blue  
  fill(#0FA4F2, 150); 
   rect(130 + random(-10,10), 520 + random(-10,10), cellSize, cellSize); 
//red 
  fill(#F20F79, 150); 
   rect(260 + random(-10,10), 520 + random(-10,10), cellSize, cellSize); 
//white 
   fill(#FADCEA, 150); 
    rect(390 + random(-10,10), 520 + random(-10,10), cellSize, cellSize); 
//black 
   fill(#393508, 150); 
    rect(520 + random(-10,10), 520 + random(-10,10), cellSize, cellSize);  
    
   
     // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }

  
}


