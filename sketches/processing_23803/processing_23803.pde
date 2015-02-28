
// MAKE THIS A MOVIE
// Press "m" to export movie.
//ALL VIDEO related Lines of COdes are Commented out for WEB explorting



//import processing.video.*;

//MovieMaker mm;
PImage  bg;

float x = 0;
float y = 0;
float wfill = height;
float wsize = 5;

void setup() {
  // use full screen size 
  size(480,723);
  bg=loadImage("2.jpg");
  background(bg);
  smooth();
  frameRate(30);
  
//  mm = new MovieMaker(this, width, height, "Water.mov",
 //                      10, MovieMaker.MOTION_JPEG_A, MovieMaker.HIGH);
}

void draw(){
  
  if(wfill>0){
    wsize = (height-mouseY)/10;
    noStroke();
    
   // bg=loadImage("tap.jpg");
    blend(bg,0,0,width,height,0,0,width,height,BURN);
    tint(0,mouseY/2,mouseY,10+mouseY);
    image(bg,0,0);
    
    
    
    //water filling up
    //rect(0,wfill,width,height);
    //wfill-=wsize/8;
    
    //drawing the droplets
    //droplet color
    fill(255);
    // increasing the water flow by mouseY position
    for(int j=0;j<wsize;j++){
      //determining droplet positions
      x=random(200,270);
      y=random(410,height);
      //droplet size
      for(int i=0;i<wsize/5;i++){
        ellipse(x,y+i,i/1.2,i);

      }
    }
    
  }else{
    wfill=height;
  }
  
//  mm.addFrame();
  
}

void keyPressed() {
  if (key == 'm') {
    //mm.finish();  // Finish the movie if space bar is pressed!
  }
}

