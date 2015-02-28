
//Copyright Christopher Henley 2014
//HW No.9
/*This sketch is a look into Eadweard James Muybridge work 
in stop-motion and motion-pictures. By pressing the up key, 
the speed is increased to the left. The converse is true by 
pressing the down key. You can zoom in an out by scrolling 
the mouse wheel, and your orientation can be shifted by 
dragging the mouse. Once the rotation speed is increased 
enough, the frame will freeze, but the image will appear 
animated.*/

int number=15;
int imgSz=80;
float imgSpace=(imgSz*number)/5;

PImage images[]=new PImage[number];
float imgXVal[]=new float[number];
float imgZVal[]=new float[number];
String textString[];

float imgAngle=360/number;
float rotX,rotY;
float zoom;

color bgColor=color(0);

boolean spin=true;

void setup(){
  frameRate=20;
  size(600,600,P3D);
  imageMode(CENTER);
  rotY=0;
  for (int i=0; i<number; i++){
    images[i]=loadImage(i+".jpg");
  }
  textAlign(CORNER);
  textString=loadStrings("dataTextDoc.txt");
}

void draw(){
  pushMatrix();
    prepareWindow();
    imageArray();
  popMatrix();
  //stringArray();
}

void prepareWindow(){
  background(bgColor);
  translate(width/2,height/2,zoom);
  rotateX(radians(rotX));
  if (spin){
    rotateY(radians(frameCount*rotY));
  }
}

void imageArray(){
  for (int i=0; i<number; i++){
    pushMatrix();
    rotateY(radians(imgAngle*i));
    translate(0,0,imgSpace);
    image(images[i],0,0,imgSz,imgSz/1.333);
    text(textString[i],-imgSz/2,-imgSz/2);
    popMatrix();
  }
}

void mouseDragged(){
  if (mouseY>pmouseY){
    rotX--;
  }
  if (mouseY<pmouseY){
    rotX++;
  }
}

void keyPressed(){
  if (keyCode==ENTER){
    spin=!spin;
    rotY=0;
  }
  if (keyCode==UP){
    rotY-=1;
  }
  if (keyCode==DOWN){
    rotY+=1;
  }
}

void mouseWheel(MouseEvent scroll){
  float x=scroll.getAmount();
  zoom-=x;
}


