


void setup (){
  
size (500, 400);
//might need to change

}

void draw () { 
  if (key == 'q' || key == 'Q') {
    
   group ();
  }
  else if (key == 'w' || key == 'W') {
    groupTwo ();
  } 
  else if (key == 'e' || key == 'E') {
    groupThree ();
  }
}

void group (){
//runs the cod as a loop at the default frame rate
  background(127);
  //sets background color to grey
  noStroke();
  //sets it so there is no stroke on the rectangles 
  for (int i = 0; i < height; i += 20) {
  //set the integer i (the rectangle) to repeat 20 times  
    fill(54, 199, 211);
    //Fills the rectangles in blue 
    rect(0, i, width, 10);
    //sets the rectangles to 10 px tall by the full width of the canvas (640px)
    fill(255);
    //Fills the rectangles in white
    rect(i, 0, 10, height);
    //sets the rectangles to be as tall at the the canvas (360px) and 10px wide 
  } 
}

  
  void groupTwo (){

    background(232,95,95);
//set backroung color to pink/salom(ish)
    
    fill(13,255,159);
//filled the dots in lime green
stroke(13,255,159);
//put a lime green stroke around all the dots 

for (int i = 0; i < 500; i = i+20) {

  //set dots to repeat every 20 px apart in width
  for (int j = 0; j < 500; j = j+20) 
    //sets dots to repeat every 20 px apart in height
    point(i, j);
    //defines points
  }
  }
  
  void groupThree (){
background(139,220,234);
//set background to blue 
    
    stroke(255, 255, 255);
//created a white stroke around the rectangles 
fill(84,178,215);
//filled the inside of the rectangles dark blue 
rect(25, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(50, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(75, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(100, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(125, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(150, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(175, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(200, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(225, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(250, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(275, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(300, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(325, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(350, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(375, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(400, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(425, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(450, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(475, 20, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

stroke(84,178,215);
//changes stroke to dark blue

fill(255,255,255);
//changes fill to white
rect(25, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(50, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(75, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(100, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(125, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(150, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(175, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(200, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(225, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(250, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(275, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(300, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(325, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(350, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(375, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(400, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(425, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(450, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(255,255,255);
//changes fill to white
rect(475, 120, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

stroke(255, 255, 255);
//turned the stroke back to white

fill(84,178,215);
//and turned the fill back to dark blue
rect(25, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(50, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(75, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(100, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(125, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(150, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(175, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(200, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(225, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(250, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(275, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(300, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(325, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(350, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(375, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(400, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(425, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(450, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(475, 220, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(25, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(50, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(75, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(100, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(125, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(150, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(175, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(200, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(225, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(250, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(275, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(300, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(325, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(350, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(375, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(400, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(425, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(450, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations

fill(84,178,215);
//filled the inside of the rectangles dark blue
rect(475, 320, 10, 60);
//created a rectangle that is 10px wide by 60 px tall, and determined its locations
  }


