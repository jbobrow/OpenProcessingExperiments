
void setup() {
  size (500, 500);
  fill(255, 255, 255);
  smooth();
  noStroke();
}
 
 
void draw() {
 
  background(255, 255, 255);
  fill(0, 0, 0);
 
  float xPos;
  float yPos;
  float zPos;
  int circleSize = 20;
  int circleDistance = 20;
  //defines the x-coordinate 
  for (int x=10; x<width; x=x+circleDistance) {
    ///defines the y-coordinate   
    for (int y=10; y<=height; y=y+circleDistance) {
 
      //the position is mostly determined by a grid but it also
      //has a component of randomness
      xPos = x + random(mouseX/50);
      yPos = y + random(mouseX/50);
      zPos = random(mouseX/50);
      
 
      //80 is a "magic number" I figured out by trial and error
      //it reduces the amount of randomness
 
      //you can use the functions map and constrain for similar purposes

fill(240, 152, 200, 73); 
 ellipse ( xPos, yPos, 30, 30);
 fill (92, 222, 158, 73);
 ellipse (xPos+3, yPos+10, 20, 20);
 
//fill(240, 234, 68, 73);
//ellipse (xPos+30, yPos +30, 20,20);

//background
fill(86, 178, 237);
 rect (0, 0, 150, 500);
 rect (0, 0, 500, 80);
 rect (450, 0, 80, 450);
 rect (0, 450, 500, 80);

//baby
 fill(240, 185, 174);
       ellipse(zPos+300, zPos+180, 140, 140);
      ellipse(zPos +300, zPos+280, 150, 200);
       
       ellipse(240, 250, 130, 50);
        ellipse(360, 250, 130, 50);
        
        ellipse(190, 250, 20, 40);
        ellipse(410, 250, 20, 40);
        
        ellipse(260, 370, 50, 100);
        ellipse(340, 370, 50, 100);
        
        ellipse(260, 400, 50, 20);
        ellipse(340, 400, 50, 20);
       
       fill(227, 221, 220); 
        rect (225, 310, 150, 50);
        rect (265, 330, 72, 50);
        
        //eye
        //left eye

fill(255,255,255);
arc(zPos+260, 170, 45, 45, 0, 2*PI);
  

fill(0,0,0);
arc(zPos+260, 170, 38, 38, 0, PI/.55);



//right eye

fill(255,255,255);
arc(zPos+340, 170, 45, 45, 0, 2*PI);
  

fill(0,0,0);
arc(zPos+340,170, 38, 38, 0, PI/.55);
    }
  }  


PFont font;
 
font = loadFont("Times-Roman-35.vlw");
textFont(font, 35);
text("TICKLE ", 15, 240);
text("THE ", 15, 265);
text("BABY!", 15, 290);
fill(0,0,0);


 
  
}

