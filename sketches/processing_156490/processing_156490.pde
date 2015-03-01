
PImage Space;
//floats are for spiral effect//
float angle=0.0;
float offset=250;
float scalar=5;
float speed=1;
//int and Boolean are for key press and hover//
//int btPosX;
//int btPosY;
//int btWidth;
//int btHeight;
//*Same as above*//
int btPosX, btPosY, btWidth, btHeight;
Boolean isActive = false;
Boolean isHovering = false;

void setup(){
  size(500,500);
  background(0);
  Space = loadImage("Space.jpg");
  //for spiral//
  fill(0);
  noStroke();
  smooth();
  //keyPressed//
  btPosX = 185;
  btPosY = 160;
  btWidth = 125;
  btHeight = 200;
  
}

void draw(){
//spiral//
  float x=offset+cos(angle)*scalar;
  float y=offset+sin(angle)*scalar;
  ellipse(x,y,250,250);
  angle +=speed;
  scalar +=speed;

//beginning of code for space button//
  fill(0);
  rect(185,160,125, 200);
 
  if(isHovering ==true){
//changes the color of the rectangle when you hover over it//
    fill(255);
    rect(btPosX, btPosY, btWidth, btHeight);
    text("click for space", btPosX, btPosY); 
    textSize(18);   

} 
  rect(btPosX, btPosY, btWidth, btHeight);
  
{
//image(Space, x, y,w,h); shows image when you click rect (button)//
  if (mousePressed == true) {
    image(Space, btPosX, btPosY, btWidth, btHeight);
  } else {
    fill(0);
  }
}
}


void mouseMoved(){
//Shows when Mouse has been moved//
  println("My mouse is moving!");
  if(mouseX > btPosX && mouseX < btPosX + btWidth
    && mouseY > btPosY && mouseY < btPosY + btHeight  ) {
    isHovering = true;
  } else {
    isHovering = false;
  }
}

void mousePressed() {
//Shows when Mouse has been pressed//
  println("Mouse pressed!");
  if (mouseX > btPosX && mouseX < btPosX + btWidth
    && mouseY > btPosY && mouseY < btPosY + btHeight) {
    isActive = true;
  }else{
    isActive = false;
  }
  
}


