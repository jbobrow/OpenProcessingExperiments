
PFont font;
float a = 0;
float b = 4;
int counter = 0;
int click = 0;
int speedX = 0;
int speedY = 0;
int sX = 40;
int sY = 40;
int locX;
int locY; 
int txX;
int txY;
int l1;
int accelX;
int accelY;


String[] say = new String[7];



void setup() {
  size (700, 700);
  background (0);
  font = loadFont("8BIT.vlw");
  textFont (font);
  say [0] = "stop it";
  say [1] = "im serious stop it";
  say [2] = "stop bothering me";
  say [3] = "I dont have any money";
  say [4] = "Stop it you hippie";
  say [5] = "IM GOING TO KILL YOU";
  say [6] = "EVER SEEN YOUR FACE EXPLODE";
  locX = (width/2 - sX/2);
  locY = (height/2 - sY/2); 
//  txX = locX + 30;
//  txY = locY - 10;
  accelX = int(random(-2, 2));
  accelY = int(random(-1, 1));
}

void draw() {
  rect(locX, locY, sX, sY);
  locX += speedX;
  locY += speedY;
  if ((locX<0) || (locX> (width-sX))){
    speedX = -speedX;
  }
  if ((locY<0) || (locY > (height - sY))){
    speedY = - speedY;
  }
  
  if (click == 1){
    counter ++;
    speedX = 0;
    speedY = 0;
    if (counter > 80){
    background (0);
    speedX = accelX;
    speedY = accelY;
    counter = 0;
    click = 0;
  }
  }
    
//    if (mousePressed == true){
//      if ((mouseX>locX)&&(mouseX<(locX+sX))&&(mouseY>locY)&&(mouseY<(locY+sY))){
//  click = 1;
//  accelX ++;
//  accelY ++;
//  txX = locX + 30;
//  txY = locY - 10;
//  background (0);
//  Collections.shuffle(Arrays.asList(say));
//  l1 = say[1].length()*8;
//  if (locX < width/2){
//  text (say[1], txX, txY);
//  } 
//  if(locX > width / 2){
//    text (say[1], txX - l1, txY);
//  }
//  }
//  println(l1);
//}
    
}

void mouseClicked() {
  if ((mouseX>locX)&&(mouseX<(locX+sX))&&(mouseY>locY)&&(mouseY<(locY+sY))){
  click = 1;
  accelX ++;
  accelY ++;
  txX = locX + 30;
  txY = locY - 10;
  background (0);
  Collections.shuffle(Arrays.asList(say));
  l1 = say[1].length()*8;
  if (locX < width/2){
  text (say[1], txX, txY);
  } 
  if(locX > width / 2){
    text (say[1], txX - l1, txY);
  }
  }
  println(l1);
}


