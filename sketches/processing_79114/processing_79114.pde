

float x=100;//Global variable for the x position.
float y =0;//Global variable for the y position.
float speedX =5;// Variable for the ball's speed. When (+) it will move to the right, when (-) it will move to the left.
float speedY =7;//Variable for the ball's speed for the Y coorinate.
float gravity =0.1;//Variable for gravity (acceleration).

int lineY = 10;


void setup(){
  size(600,600);//Sketch window size is set to 600 by 600.
  frameRate(90);//The timing of the animated frame is set to the speed of 90
  smooth();
  
}
   
      
  void draw(){
  background(123,180,242);//The background is set up to grey.
  for(int y=0; y < height; y+=10){
  stroke(0);//Stroke is set to Black.
 line(0,y,width,y);
 println(y);//Prints the Y coorindate 
 
 
  }
  
  while(lineY<height){
    line(0,lineY,width,lineY);
      lineY= lineY +10;
    }
    
  x = x + speedX;//Adding  speed of the x location and moving it by 1 pixel.
  y = y + speedY; //Adding speed to location
  
 //speed = speed + gravity; // Adding gravity to speed.
  if((x > width) || (x < 0)) {
    
    speedX = speedX * -1 ; // Reverse the speed by multiplying it by -1.
  }
  if ((y> height) || (y< 0)){
    speedY =speedY * -1;
  }
  
  //Displaying circle at x location.
  
 //Target.
  stroke(0);//Stroke is set to Black.
  fill(255);//Fill is set to white
  ellipse(x,y,250,250);
  
  stroke(0);//Stroke is set to Black.
  fill(0);//Fill is set to Black.
  ellipse(x,y,200,200);
  
  stroke(0);//Stroke set to Black.
  fill(0,0,255);//Fill set to Blue.
  ellipse(x,y,150,150);
  
  stroke(0);//Stroke is set to Black.
  fill(255,0,0);//Fill is set to Red.
  ellipse(x,y,100,100);
  
  stroke(0);//Stroke is set to Black.
  fill(241,236,37);//Fill is set to yellow.
  ellipse(x,y,50,50);//Ellipse is positioned at 
  
 //crosshairs
 stroke(255,0,0);// Stroke is set to red.
 noFill();
 strokeWeight(3);//The stroke weight has been increased to 4.
 ellipse(mouseX,mouseY,50,50);
 
 stroke(255,0,0);//Stroke is set to red.
 noFill();
 line(mouseX-40,mouseY,mouseX+40,mouseY);
 line(mouseX,mouseY-40,mouseX,mouseY+40);
 
  }



