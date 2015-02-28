
int look = 0;//the default declaration for the looking direction for Blinky
int x = 0;//the default declaration for moving Blinky
int Blinky = color(227,188,227); //Sets Blinky to a pink color
 
void setup() {
  size(500, 500);//Size of the canvas
  noStroke();//No outline; everything blends together
   
}
 
void draw() {
  fill(Blinky);//sets the color of Blinky's body depending on mousePressed
  background(0);//sets the background color to black
  
 //Blinky's body 
 /*The +x added to all the the x-position parameters is related
 to the movement of Blinky. It allows Blinky to move left and 
 right on the x-axis*/
  rect(50+x,70,10,90);
  rect(60+x,40,10,130);
  rect(70+x,30,10,140);
  rect(80+x,20,10,140);
  rect(90+x,20,10,130);
  rect(100+x,10,10,150);
  rect(110+x,10,10,160);
  rect(120+x,10,10,160);
  rect(130+x,10,10,150);
  rect(140+x,20,10,130);
  rect(150+x,20,10,130);
  rect(160+x,30,10,140);
  rect(170+x,40,10,130);
  rect(180+x,70,10,90);
   
  //Blinky's left eye
  /*The look*10 helps determine what direction for Blinky to 
  look depending on the direction that Blinking is moving in.
  The +x shifts the eyes in the direction that Blinky is 
  moving in*/
  fill(255);//sets Blinky's left and right eyes to the color white
  rect(60+look*10+x, 50, 10, 30);
  rect(70+look*10+x, 40, 10, 50);
  rect(80+look*10+x, 40, 10, 50);
  rect(90+look*10+x, 50, 10, 30);
  
  //Blinky's right eye
  /*The look*10 helps determine what direction for Blinky to 
  look depending on the direction that Blinking is moving in.
  The +x shifts the whites of his eyes in the direction that 
  Blinky is moving in*/
  rect(120+look*10+x, 50, 10, 30);
  rect(130+look*10+x, 40, 10, 50);
  rect(140+look*10+x, 40, 10, 50);
  rect(150+look*10+x, 50, 10, 30);
  
  //Blinky's pupils
  /*The look*20 helps determine the direction of Blinky's pupils
  when he is moving around. The +x shifts his pupils in the
  direction that Blinky is moving in*/
  fill(0, 0, 255);//sets the color of Blinky's pupils to blue
  rect(60+look*20+x, 60, 20, 20);
  rect(120+look*20+x, 60, 20, 20);
  
  /*Allows Blinky to look left or right, depending on the direction
  he is moving in*/
  if(mouseX<120+x){//Blinky looks to the left when he is following the mouse in that direction
    look=0;//Causes Blinky to look left if he is moving in that direction
  }
  else if(mouseX>120+x){//Blinky looks to the right when he is following the mouse in that direction
    look = 2;//Causes Blinky to look right if he is moving in that direction
  } else {//If Blinky is not following the mouse in neither direction, he will look straight at the user
    look = 1;//Causes Blinky to look straight if he is neither moving left or right
  }
  
 /*Causes Blinky to either move left or right, following the 
 mouse*/
  if (mouseX < 120+x){//Allows Blinky to follow the mouse to the left
    x=x-1;
  }
  if (mouseX > 120+x) {//Allows Blinky to follow the mouse to the right
    x=x+1;
  }
}
 /*When the user clicks the mouse, Blinky will turn into a random
 color*/
void mousePressed(){
  if(mousePressed == true){//If the mouse is pressed, Blinky will change to a random color
    Blinky = color(random (250),random(250),random(250));//The color will be random
  }
}


