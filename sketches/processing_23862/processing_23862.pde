
//UP = speed up
//DOWN = slow down
//LEFT = size down
//RIGHT = size up
//ENTER = display background
//P = Pause
//S = saving png
//D = display numbers

PFont font;
PImage bg;
int r=0,g=0,b=0,counter=0,on=0,loc,size=10,fr=20;
int [] objectX = new int[1000];
int [] objectY = new int[1000];
boolean RedUp = true, stop,photo,display;
color c = color(200,150,150);


void setup() {
  size(480,723);
  bg=loadImage("1.jpg"); 
  background(bg);
  //background(255);
  smooth();
  font = createFont("Helvetica",19);
}

void draw(){
  loadPixels();
  bg.loadPixels();
  
  if(photo){
    fill(255,50);
    rect(0,0,width,height);
  }else{
  //changing bg color
    tint(r,150,150);
    image(bg,0,0);
  } 
  
  if(RedUp){
    r++;
  }else{
    r--;
  }
  if(r==255 || r==0) RedUp=!RedUp;
  
  //draw on spot
  if(mousePressed && mouseY<height && mouseX<width) bubble();
  
  //mouse position's pixel number
  on=mouseX+mouseY*width;
  
  //make sure array doesn't go out of bound
  if(counter==500) counter =0;
  
  //draw circle
  for(int i=0;i<counter;i++){
    if(objectY[i]> 5){
    loc = objectX[i] + objectY[i]*width;
    c = bg.pixels[loc];
    fill(c,150);
    noStroke();
    //println("circle:  " + objectX[i] +" x " + objectY[i] + "   COUNTER: "+counter);
    rect(objectX[i],objectY[i],1+size,1+size); 
    objectY[i]-=random(fr);
    }
  }
  
  //display speed + size
  if(display){
    fill(80);
    textFont(font,11);
    text("speed: "+fr+"  size: "+size + "  Pause = P / Save PNG = S / Display = D / Background = ENTER",20,700);
  }
}

void bubble(){
  objectY[counter]=mouseY;
  objectX[counter]=mouseX;
  counter++; 
}

void keyPressed(){
  //Square size
  if(keyCode == RIGHT) size++;;
  if(keyCode == LEFT && size>0) size--;;
  //Speed
  if(keyCode == UP) fr++;;
  if(keyCode == DOWN && fr>0) fr--;;
  //Background display
  if(keyCode == ENTER) photo = !photo;
  //Saving png
  //if (key == 's' || key == 'S') saveFrame("Green"+"_##.png");
  //Numbers display
  if(key == 'd') display = !display;
 
  //pauseing the screen
  if(key == 'p') stop = !stop;
  if(stop) noLoop();
  else loop();
}

