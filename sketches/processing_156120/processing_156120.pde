
PImage pink;
PImage blue;
PFont font;
float speed; //pulsing speed for blue image
boolean state1 = true; //blue image is pulsing and pink image is in corner
boolean state2 = false; //pink image is pulsing and blue image is in corner
float pMouseX;
float pMouseY;


void setup(){
  size(500, 500);
  background(255);
  pink = loadImage("photography-damon-hunter-05.jpg");
  blue = loadImage("timthumb.jpg");
  font = (createFont("Futura-MediumItalic-48.vlw",100));
  
}

//new functions: copy();
//diffX(); diffY();

  
void draw(){
 
  speed = 10;
  float scale = map(sin(frameCount/speed), -1, 1, 1, 1.5); //scale of blue pulsing
  
  if (state1 == true){
    image(blue, 0, 0, blue.width*scale, blue.height*scale); //blue pulsing
    //float state2 = copy(blue, 0, 0, 250, 250, 250, 250, 250, 250);
    copy(pink, width/2, height/2, 250, 250, 250, 250, 250, 250); //pink
  } else if (state2 == true){
    image(pink, 0, 0, pink.width*scale, pink.height*scale); //pink pulsing
    copy(blue, width/2, height/2, 250, 250, 250, 250, 250, 250); //blue
  }
  
    if(mousePressed){
    image(pink, 0, 0, pink.width*scale, pink.height*scale); //pink pulsing
    copy(blue, width/2, height/2, 0, 0, 250, 250, 250, 250); 
  } else {
    image(blue, 0, 0, blue.width*scale, blue.height*scale); //blue pulsing
    //float state2 = copy(blue, 0, 0, 250, 250, 250, 250, 250, 250);
    copy(pink, width/2, height/2, 0, 0, 250, 250, 250, 250);
  }
  
    if(pMouseX<width/2){
    image(blue, 0, 0, blue.width*scale, blue.height*scale); //blue pulsing
    //float state2 = copy(blue, 0, 0, 250, 250, 250, 250, 250, 250);
    copy(pink, width/2, height/2, 250, 250, 250, 250, 250, 250); //pink
  } else {
    image(pink, 0, 0, pink.width*scale, pink.height*scale); //pink pulsing
    copy(blue, width/2, height/2, 250, 250, 250, 250, 250, 250); //blue
  }

  float diffX = (mouseX-pMouseX); //stores previous mouse position and subtracts 
  //current position)
  float diffY = (mouseY-pMouseY);
  
  println("diffX" + diffX);
  println("diffY" + diffY);
  
  if(diffX>0){
    image(blue, 0, 0, blue.width*scale, blue.height*scale); //blue pulsing
    //float state2 = copy(blue, 0, 0, 250, 250, 250, 250, 250, 250);
    copy(pink, width/2, height/2, 250, 250, 250, 250, 250, 250); //pink
  }
  
  if(diffX<0){
    image(pink, 0, 0, pink.width*scale, pink.height*scale); //pink pulsing
    copy(blue, width/2, height/2, 250, 250, 250, 250, 250, 250); //blue
    
  }
  

  
  pMouseX = mouseX;
  pMouseY = mouseY;
  
  
  textFont(font);
  fill(255);
  textAlign(CENTER, CENTER);
  text("hey there", width/2, height/2);
  
  
  if (keyPressed){
    if (key=='s'){
      saveFrame();
    }
  }

  

 /* BELOW IS WHAT I'M UNCLEAR ON
 void mouseWheel(){
  float scroll = event.getCount(); DO I HAVE TO MAKE A FUNCTION FOR EVENT?
  println(scroll);
  
  if((state1==true && scroll<0)){
    state1 =! state1;
    state2 =! state2;
  }
  
  else if((state2==true && scroll>0)){
    state2 =! state2;
    state1 =! state1;
  }
}
*/
  
  
  
  
 
 
  
  }



