
import processing.video.*;

//like int x
Capture video;

//use 4:3 ratios: 320x240, 640x480, 
int camw = 40;
int camh = 30;
int fps = 5;
int newx = 0; //my x
int newy = 0; //my y
int xjump = 22;
int yjump = 22;
int rectdrift = 8;
int linemax = 40;

void setup() {
  background(0);
  noCursor();
  
  //automating size calculation, so that saying one pixel takes up 9 pixels
  size(880, 660,P3D);
  smooth();
  //initialize capture
  video = new Capture(this,camw,camh,fps);
    //(,width,height,framerate in seconds)
    //the this refers to me or I, like the applet itself
    //capture connects to the computer's camera it needs to know who to contact
    //this program versus another
  
}

void draw() {
  
  if (video.available() == true) {  // does the user have a webcam?
      video.read();                   // yes they do, so grab an image from it.
  }
  
  image(video, 0, 0, camw, camh); // draw the image from the webcam
  PImage slice = get(0,0, width/2, height);  // create a copy image of just the left hand side
  
  
  rotateY(PI);            // rotate the canvas 180 around the y axis
  translate(-width,0);    // shift the canvas back to where we can see it.
   
  // the 2 steps above rotate and shift the drawing surface,
  // so when we later draw the left hand side image,
  // it will appear mirrored.
 
  tint(255);  // tell Pd to tint any future pixels a grey colour
 image(slice, 0, 0);     // draw the copy of the left hand side image
   
  noTint();               // turn off tinting to make the bed
                          // for next time round the draw() loop
 
 
  
 // image(video,0,0); //video starting at top left hand corner
  
  //jim cambell style: low rez arrays
  //let Processing know we're about to access and play with pixel [] arrayf
  video.loadPixels();
  
  
  
  for(int y = 0; y < video.height; y++) {
     for(int x = video.width-1; x >= 0; x--) {
        int location = x + y * video.width;
        color c = video.pixels[location]; 
    
    drawPoints(c);
  //    drawRect(c);
   /* 
    float linelength = random(linemax);
    strokeWeight(1);
    stroke(c,random(255));
    int pick = int(random(4));
    if(pick == 0) {
    line(newx,newy,newx+random(linelength),newy+random(linelength));
    } else if(pick == 2) {
      line(newx,newy,newx-random(linelength),newy+random(linelength));
    } else if(pick == 3) {
        line(newx,newy,newx+random(linelength),newy-random(linelength));
    } else if(pick == 4) {
          line(newx,newy,newx-random(linelength),newy-random(linelength));
    }
    */
     newx+=xjump;
     //same as newx = newx + xjump;
     }
   newx = 0;
   newy+=yjump;
 
  }
  
  newy = 0;
  
  video.updatePixels();
  
}

void drawRect(color c) {

 


  fill(c,220);
    stroke(40,100);
    rect(newx+random(rectdrift), newy+random(rectdrift), xjump-random(rectdrift),yjump-random(rectdrift));


}
  

void drawPoints(color c){
   strokeWeight(13); //13
   float r = red(c);
   float g = green(c);
   float b = blue(c);
 //this is how you do grey scale!!
 
     stroke(c); //from location
     blendColor(c, c, SUBTRACT                                                                                                                                             );
     point(newx,newy,150);
    //ellipse(newx+random(rectdrift),newy+random(rectdrift),xjump-random(rectdrift),yjump-random(rectdrift));
     rect(newx+random(rectdrift), newy+random(rectdrift), xjump-random(rectdrift),yjump-random(rectdrift));
    

}


//whenever the camera is ready to send you a new frame, read the frame
void captureEvent(Capture v) {
  v.read();
}

void keyPressed() {
  switch(keyCode){
    
    case UP:
      rectdrift++;
      //linemax++;
      break;
    case DOWN:
      rectdrift--;;
      //linemax--;
      break;
  }
  
     switch(keyCode) {
      case 'I':
       loadPixels();
          for (int i=0;i<pixels.length;i++){
          color c = pixels[i];
          float rr = c >> 16 & 0xff;  //red
          float  gg = c >> 8 & 0xff;  //blue
          float    bb = c & 0xff;       //green
        color invertcolor = color (255-rr,255-gg,255-bb);
        pixels[i]=invertcolor;
      }
      updatePixels();
     
     break;
     }

}






// mirroring aspect of code borrowed from OilZilla on Open Processing >>>>> used here to mirror colors of pixels

