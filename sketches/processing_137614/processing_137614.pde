
// life is beautiful
//live your life
//Instructions: click mouse to see dynamism
//Instructions: click  Delete or backspacekey to clear the screen
//Instructions: click 'S' or 's 'key to save the screenshot

PImage smiley;//An object for image is created
PFont f;  //a var for font
//code blocks
void setup()
{
  size (800, 500);
  background(130);
   //load image 
   smiley = loadImage("happyimg.jpg");
   image(smiley,0,0,800,500);
   //customized font
    f = createFont("Arial",16,true); 
    
}
   //code blocks
  void draw()
   
 {
//displays a text
  textFont(f,20);               
  fill(0);  
  text("CLICK TO SEE THE SIGNS OF FEELINGS",274,38);
  println("The Mouse's X position is " + mouseX +
          " The Mouse's Y position is " + mouseY );
          fill(233, 224 , 71);
          //construct smiley
  strokeWeight(7);
  ellipse(250, 250, 300 ,300);
  fill(0);
  ellipse(200, 210 , 30, 70);
  fill(0);
  ellipse(300, 210 , 30, 70);
  fill (255);
  bezier(150, 295, 200, 370, 300, 370, 350, 295);
 
  line(150, 295, 350, 295);
  //mouse event
  if(mousePressed==true)
 {
   textFont(f,20);               
  fill(0);  
   text("BEING SAD IS WASTE OF TIME",474,144);
 strokeWeight(7);
 fill (255);
  ellipse(250, 250, 300 ,300);
  fill(0);
  ellipse(200, 210 , 30, 70);
  fill(0);
  ellipse(300, 210 , 30, 70);
  fill (255);
  bezier(173, 334, 225, 298, 287, 298, 331, 331);
  
}
 //key event
 {
    if(key==DELETE|| key==BACKSPACE)
    background(360);
    if(key=='s'||key=='S')
    //image save
    saveFrame("Screenshot.png");
  }
  

 
  }
 
