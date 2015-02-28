


//========================== global vars
int nextNum = 1;
float xstart1, xstart2, xstart3;


//========================== int

void setup(){
  size(500,300);
  frameRate(300);
  clearBackground();
  smooth();
  xstart1 = 1 * width/6;
  xstart2 = 3 * width/6;
  xstart3 = 5 * width/6;
  
}
    
void clearBackground(){
//  background(255);
//  int gap = 10;
//  strokeWeight(1);
//  stroke(155,50);
//  
//  for(int x=0; x<width; x+=gap){
//    line(x,0,x,height);
//  }
//  for(int y=0; y<height; y+=gap){
//    line(0,y,width,y);
//  }
}

void keyPressed(){
  save("tmp.jpg");
}

//========================== frame loop

void draw(){
  create();
}

void mousePressed(){
  clearBackground();
  xstart1 = 1 * width/6;
  xstart2 = 3 * width/6;
  xstart3 = 5 * width/6;
}

//========================== objects

void create(){
  float vibrate = 0.1;
  stroke(random(255),random(255));
  strokeWeight(random(60));
  strokeCap(PROJECT);
  
  float xpos = xstart1 + random(3);
  float ypos = random(height);
  if (nextNum == 2) {
    xpos = xstart2 + random(3);
  } else if (nextNum == 3) {
    xpos = xstart3 + random(3);
  } 
  line(xpos-width/6,ypos,xpos+width/6,ypos);
  stroke(random(255),random(255),random(255),random(255));
  strokeWeight(10);
  line(xpos+width/6+random(10),0,xpos+width/6+random(10),height);
  line(xpos+3*width/6+random(10),0,xpos+3*width/6+random(10),height);
  line(xpos+5*width/6+random(10),0,xpos+5*width/6+random(10),height);
  nextNum++;
  if (nextNum > 3) { nextNum = 1; }

}
  
    



    
