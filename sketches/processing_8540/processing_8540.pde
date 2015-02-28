
//concentric circles
//Owaun Scantlebury
//March 28 2010
//150kps-330 kps with P3D - smooth enabled
//Press 't' to toggle turbo mode
//Click the mouse to clear the sketch
//Hint : do not clear the background and create a PGraphics image before calling draw() gives the sketch a 100% boost in framerate
//Press 1-4 for different circle modes
//Press 5-9 to render nothing
//move the cursor along the X-axis to adjust the circle interval gap
//Processing rocks!!!
//Press 'r' to reset and see how the sketch runs without the PGraphics image being created
//Remember to press 't' to toggle turbo
//Hint click the mouse in the center of the sketch with mode '4' and toggle turbo to attain 300+ fps 
//You can attain higher frameRates when you reduce the sketch size;
public PGraphics rv;
public color n,c;

public char mode='1';
public boolean view3d = false;
public int raw;
public color [] A,B;
public PImage rt,rb;
public boolean turbo = false; 

void setup(){
    size(480,480,P3D); //400fps 
  //size(640/2,480/2,P3D);  //120fps
 // size(480/2,480/2,P3D); //600fps

  frameRate(3000);

  rt =new PImage(width,height);
  rb =new PImage(width,height);
  rv=createGraphics(width,height,P3D);
  loadPixels();
  A=pixels;
  n= A[0];
  noSmooth(); 
  lights();  
  smooth(); // creates the smooth concentric circles
  background(n);
  raw=0;


}

void mousePressed(){
  background(n);
  raw=0;
}


void draw(){

  if (turbo) {
    rv=createGraphics(width,height,P3D);
    makehint();

  }
  if (!turbo)rv=null;

  if(!online)this.frame.setTitle(str(frameRate)+" fps");






  ///if (raw<360){ //360 degrees  //Uncomment to restrict oscillation to 360 degrees
  drawShape();
  //}  //Uncomment to restrict oscillation to 360 degrees
  raw+=1;




}


void drawShape(){

  noStroke();
  translate(width/2,height/2,mouseX); 


  rotate(radians(raw));

  for (float x=0;x<width;x+=1){

    for (float y=0;y<2;y+=1){ // keep the y - axis low to keep frame rate high




      fill(x,12);
      beginShape(QUADS);
      if ( mode =='1'){
        vertex(x,sin(y),sin(x));
        vertex(x-1,y,cos(x));
        vertex(x-1,y-1,cos(x));
        vertex(x,y-1,cos(x));
      }

      if (mode=='2'){
        vertex(x,cos(y),sin(x));
        vertex(x-1,y,cos(x));
        vertex(x-1,y-1,cos(x));
        vertex(x,y-1,cos(x));
      }
      if (mode=='3'){
        vertex(x,y,x);
        vertex(x-1,y,x);
        vertex(x-1,y-1,x);
        vertex(x,y-1,x);
      }
      if (mode=='4'){
        vertex(x,y,x);
        vertex(x-1,y,x);
        vertex(x-1,y-1,x);
        vertex(x,y-1,x);
      }


      endShape(); 
    }

  }

}

void keyPressed(){

  if (keyCode==ESC){
    key='1';  //disabiling ESC so to not end sketch
  }

  if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5'|| key == '6' || key == '7' || key == '8' || key == '9' || key == '0')
  {
    mode = key;
  }
  if(key=='r'){
    turbo = false;
    setup();

  }

  if (key=='s')save("concentric.png");
  if (key=='t')turbo = !turbo;
 
}

void makehint(){
  //This is what creates the magic of the high framerate for some unknown reason
  rv.loadPixels();
  rv.beginDraw();

  rv.endDraw();
  rv.updatePixels();
}



