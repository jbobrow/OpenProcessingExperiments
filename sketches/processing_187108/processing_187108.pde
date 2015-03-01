
PImage desktop;
PImage cursor;
PImage error;
PImage bsod;
boolean glitch = false;
boolean clicked = false;
boolean red = false;
boolean matrix = false;
//Wait is used to provide a delay before the bsod
int wait = 0;
//creates more distortions over time
int z = 0;
String charList = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
int y3 = 0;
boolean firstM = true;
/*@pjs font="matrix.ttf";*/

void setup(){
  noSmooth();
  noCursor();
  size(640,480);
  frameRate(10);
  textFont(createFont("matrix.ttf"),20,true);
  bsod = loadImage("bsod.jpg");
  desktop = loadImage("desktop.png");
  error = loadImage("error.png");
  cursor = loadImage("cursor.png");
  background(0);
}
void draw(){
   
  ///
  // provides delay
   if (red == true){
   wait ++;
   }
   //draws the blue screen
    
  if (wait > 35){
  glitch = true;
  }
       /*
      blur
      color shift
   // matrix screen
   scrolling font import
   opacity relative to y
*/
  //alters the blue screen
  if (glitch){
   
  image(bsod,0,0);
  //larger rectangle movement
  int x1 = int(random(0,width));
  int y1 = int(random(0,height));
  int x2 = int(x1+random(-30, 30));
  int y2 = int(y1+random(-30, 30));
  int w = z*2 + 300;
  int h = z*2 + 100;
  int w2 = z*2 + 0;
  int h2 = z*2 + 0;
  copy(x1,y1,w,h,x2,y2,w,h);
  x1 = int(random(0,width));
  y1 = int(random(0,height));
  x2 = int(x1+random(-30, 30));
  y2 = int(y1+random(-30, 30));
  w = z*2 + 200;
  h = z*2 + 100;
  copy(x1,y1,w,h,x2,y2,w,h);
  //Small and large fragments
  x1 = int(random(0,width));
  y1 = int(random(0,height));
  x2 = int(x1+random(-300,300));
  y2 = int(y1+random(-300,300));
  w = z*2 + 10;
  h = z*2 + 10;
  w2 = z*2 + int(random(0,60));
  h2 = z*2 + int(random(0,60));
 copy(x1,y1,w,h,x2,y2,w2,h2);
  x1 = int(random(0,width));
  y1 = int(random(0,height));
  x2 = int(x1+random(-300,300));
  y2 = int(y1+random(-300,300));
 copy(x1,y1,w,h,x2,y2,w,h);
 //small vertical fragments
  x1 = int(random(0, width));
  y1 = 0;
  x2 = int(x1 + random(-7, 7));
  y2 = int(random(-5, 5));
  w = z*2 + int(random(7, 40));
  h = z*2 + height;
 copy(x1,y1, w,h, x2,y2, w,h);
 z += 1;
 //takes the program to the matrix
  if (keyPressed){
    glitch = false;
    red = false;
    wait = 0;
    matrix = true;
  }
  }
   
  if (matrix){
    if(firstM){
    background(0);
    firstM = false;
    }
    else{
    //pulls the modifier for the mouse
    int moX = int (map (mouseX/2, 0, 320, 0,32));
    int moY = int (map (mouseY/2, 0, 240, 0,10));
    //for(int y3 = 1; y3 < 30; y3++){
    noStroke();
    fill(0);
    rect(0,0,640,16);
     
    for(int x3 =0; x3 < 40; x3++){
    int rand = int(random(0,15));
    if (rand < 14){
    fill(0,255,0,int(random(80,255)));
    text(charList.charAt(int(random(0,62))),16*x3 + moX,16 + moY);
    }
    }
    copy(0,0,640,480,0,16,640,480);
    
     
    //translate(0,16);
    y3 +=1;
    }
    //}
     
     
  }
   
  if(matrix == false && wait < 35) {
  //draws the desktop
   
  image(desktop,0,0);
  //draws the error message
  if (clicked == false){
   
  image(error,120, 139);
  }
 //blue pill box
 if (mousePressed &&
     mouseX > 401 && mouseX < 482 &&
     mouseY > 302 && mouseY < 324 ){
   clicked = true;
     }
 //red pill box
 if (mousePressed &&
     mouseX > 187 && mouseX < 285 &&
     mouseY > 302 && mouseY < 324){
     clicked = true;
     red = true;    
     }
  //draw a cursor image at mouse x, mouse y
   
  image(cursor,mouseX, mouseY);
  }
}
//Resets the image if Delete or Backspace is pressed
void keyReleased(){
  if (keyCode == DELETE || keyCode == BACKSPACE){
    clicked = false;
    red = false;
    glitch = false;
    wait = 0;
    matrix = false;
  }
}



