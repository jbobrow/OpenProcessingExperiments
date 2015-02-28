
/*This entire code was written by someone who speaks Spanish, but the functions are all the same.
Neat. :)

Hitting 'c' will make the screen flash pink.
Hitting any other key will make the spinning shapes change positions.*/

/*Decalre all variables and initialize*/
float angulo=0.0;
PImage img;
float x = 1.0;
float y = 1.0;

/*Setting up the canvas*/
void setup(){
  size(1000,750);
  img = loadImage("heart.jpg");
  smooth();
  noStroke();
  background(0);
  image(img,0,0);
}

/*Drawing the image and animating it*/
void draw(){
  
  /*Tint allows a trail for my shapes*/
  tint(255,10);
  /*Using an image as the background*/
  image(img,0,0);
  /*The rotation is reset every single time we draw(), so it's ok to draw the image without manually resetting the angle*/
  
  /*Set the x and y values with respect to the screen so that the colours change (1-255) no matter where you are on the screen for a smoother transition.*/
  x=mouseX*255/width;
  y=mouseY*255/height;
  
  /*First shape changes its grey value based on both x and y*/
  fill((x+y)/2,15);
  /*allow for constant rotation*/
  angulo=angulo+ 0.02;
  /*set the origin of the first shape around the center of the screen*/
  translate(500,325);
  /*rotate by the angle calculated*/
  rotate(angulo);
  triangle(0,0,400,500,100,300);
  
  
  /*draw shape 2*/
  translate(100,100);
  /*green value changes with x, blue with y*/
  fill(0,x,y,40);
  rotate(angulo);
  triangle(0,0,300,600,100,100);
  
  /*draw shape 3*/
  translate(200,200);
  /*red value changes with x, green with y*/
  fill(x,y,0,100);
  rotate(angulo);
  triangle(0,0,500,300,300,200);
  /*This line was used to debug the values of x and y, since somewhere along the line they kept spitting out only 0.0's
  println(x +" "+y);*/
}
 
  void keyPressed(){
    /*time to flash pink for the lovely heart*/
    if(key=='c'){
      background(255,150,150);
    }
    /*Change the angles every time a key is pressed to keep it fresh*/
    angulo=angulo+ 1.0;
}


