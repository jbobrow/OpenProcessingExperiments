
int blue = 60;
  int green = 130;
  int mouse = 0;
  int q = 0;
  boolean start = false;
  void setup(){
  textSize(20);
  size(700,700);
  background(0);
  colorMode(HSB);
  noFill();
  stroke(60,255,255);
  rect(300,650,100,50);
  if(mouseX > 250){
  fill(130,255,255);
    }
    else{
      fill(60,255,255);
    }
  text("To clear screen, simply press any key.", 170 , 230);
  text("Click the color button to slightly change colors.", 140, 270);
  text("press any key to begin!", 240 , 310);
  textSize(32);
  text("Color", 311, 685); 
  
}
void draw(){
  if((start == false) && (keyPressed == true)){
    background(0);
    start = true;
  } 
  noFill();
  if(mouseX < 350){
    stroke(green,255,255);
  }
  else{
    stroke(blue,255,255);
  }
  if((mousePressed == true) && (mouseY < 640) && (mouseY > 60) && (mouseX < 640) && (mouseX > 60) && (start == true)){
    mouse = 20;
  }
  else{
    mouse = 0;
  }
  if(keyPressed == true){
    background(0);
    rect(300,650,100,50);
    if(mouseX > 250){
    fill(130,255,255);
    }
    else{
      fill(60,255,255);
    }
    textSize(32);
    text("Color", 311, 685);
  }
  if((mouseY > 640) && ((mouseX > 300) && (mouseX < 400)) && (mousePressed == true) && (start == true)){
    if((blue<255) && (green<255)){
    blue = blue + 20;
    green = green + 20;
    }
    else{
      blue = 60;
      green = 130;
    }
  }  
 translate(350,350);
  ellipse(mouseX-350,mouseY-350,mouse,mouse);
  ellipse(-mouseX+350,mouseY-350,mouse,mouse);
}
