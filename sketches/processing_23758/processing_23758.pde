
float x = 0.0;//increasing variable for puddle
float r = 190;//increasing variable for stream

void setup(){
  frameRate(20);
  size(680,470);
  
  //setting up the background image
  PImage bg;
  bg = loadImage("snowmanpouringicing2.jpg");
  background(bg);
  stroke(255);//255 = white, 0 = black
  strokeWeight(8);//thickness of initial icing stream
  smooth();
  fill(255);
}



void draw(){
  //stream of icing coordinates (x1, y1, x2, y2)
  line(300,190,300,r);
  r++;
  if(r<295){//if the stream hasn't reached the buns, keep going
    loop();
    }
  else{//if the stream has reached the buns, make a puddle
    r=295;
    boolean puddle = true;
    if(puddle == true){
      ellipse(300,295,20+x,5+x/4);//icing puddle in the pan (x, y, width, height)
      x += 2;//make the puddle increase in size
      if (x>=300){//once puddle reaches certain size, will stop growing
        x = 0.0;
      }
   } 
  }
}


