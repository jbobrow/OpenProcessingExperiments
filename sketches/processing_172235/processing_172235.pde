
import processing.video.*;
Capture cam;
int currentTintClr;
String activeClrStr="None";
boolean isTinted=false;
int tints[] = {#74e571, #800000,#ffd700, #000080,#d2691e,#ff69b4};

float colorbits;
int counter = 0;
int x = 0;
int y = 0;

boolean strokeVar = false;

int smallPoint;
int i = 0;
void setup()
{
  size(1280,720);
  smooth();
  //println(Capture.list());
  cam = new Capture(this, 1280, 720, 30);
  cam.start();
  noStroke();
  background(255);
   
}
void draw(){
   
    if (colorbits<128){
      colorbits += 0.2;}

    smallPoint = (mouseY+20)/10;
   // readCam();
    
     if(mousePressed==true && mouseButton== LEFT){
          colorbits=8;
          background(cam.get(0, 0));}
    if (smallPoint < 10){    
       for (int i = 1; i < (2000/smallPoint); i++){
          pointilize();}
    }
    else if (smallPoint >= 10){    
       for (int i = 1; i < (500/smallPoint); i++){
          pointilize();}
    
  }
  
     if (isTinted == true){
     redraw();
     fill(tints[(i % tints.length)],1);
     //println(i);
     rect(0,0,1280,720);
   }
}
void renderPallete(){
  int sqrDim = 25;
  for (int i=0;i<tints.length;i++) {
    fill(tints[i]);
  }
}

void captureEvent(Capture cam)
{
  cam.read();
}
void isFiltered()
{
   
  if(isTinted){
        tint(currentTintClr);
  }else{
    noTint();
  }
 
}
void keyPressed()
{
  
   if (key == ENTER){
    if (strokeVar == false){
      stroke(1);
      strokeVar = true;
      //println("derp");
    }
   else if (strokeVar == true){
      strokeVar = false;
      noStroke();
      //println("derp2");
    }
       
  }
  
  
  if (key == 'S' || key == 's'){
        saveFrame("Pointilism-######.png");
  }
 
  
 if (key == ' '){
   isTinted = false;
   isFiltered();
   i = -1;
 }
 
  if (key != ' ' && key != ENTER && key != 'S' && key != 's'){
      i++;
      isTinted = false;
      //activeClrStr = "Lime";
      currentTintClr = tints[(i % tints.length)];
      isTinted = true;}
      
}

void pointilize() {
  
    if (x<cam.width){
      x += smallPoint;}
    else{
      x=0;}
    if (y<cam.height){
      y += smallPoint;}
    else{
      y=0;}
  
  
  float pointillize = map(mouseX, 0, width, smallPoint, smallPoint);
 // int x = int(random(cam.width));
 // int y = int(random(cam.height));
  color pix = cam.get(width-x, y);
  fill(pix,colorbits); //8 color setting
  
 // println (smallPoint);
      
  if (mouseX<=256) {
    rect(x, y, pointillize, pointillize);}
  else if (mouseX>256 && mouseX<=512) {
    triangle(x, y+pointillize, x+(pointillize/2), y, x+pointillize, y+pointillize);}
  else if (mouseX>512 && mouseX<=768) {
    ellipse(x, y, pointillize, pointillize);}
  else if (mouseX>768 && mouseX<=1024) {
    triangle(x, y, x+10+(pointillize), y+10+(pointillize/1.2), x+20+(pointillize), y+30+(pointillize));}
  else {
    rect(x, y, pointillize, pointillize);
    triangle(x, y+pointillize, x+(pointillize/2), y, x+pointillize, y+pointillize);
    ellipse(x, y, pointillize, pointillize);
    triangle(x, y, x+10+(pointillize), y+10+(pointillize/1.2), x+20+(pointillize), y+30+(pointillize));

  }
}


//void readCam(){
//    if(cam.available()) {
//    cam.read();
//  }
//}



