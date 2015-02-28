
float circlewidth = 10;
float circleheight = 10;
int globalOpacity = 30;

void setup() {
  size(800, 600);
  background(255);
}

//creating function for the wormhole ellipse or "sun"
void wormholeGrow() {
  circlewidth = circlewidth+=1;
  circleheight = circleheight+=1;
  if (circlewidth > 500 && circleheight > 500) {
      circlewidth = 10;
      circleheight = 10;
    }
}

void draw() { 
    //"grass"
  stroke((mouseX+900)*.255,(mouseX+999)*.255,(mouseX+100)*.255,20); //pear stroke
  for(int pos = 0;pos<width/2;pos+=20){
    line(height/2,0,pos,height);
  } 
  
  fill((mouseX+999)*.255,(mouseX+450)*.255,(mouseX+100)*.255,globalOpacity); //peru gold fill
    
  //fill(0,mouseY,mouseX); //basic blue, green palette
  //stroke((mouseX+999)*.255,(mouseX+999)*.255,(mouseX+999)*.255,20); //very light strokes
  //stroke(mouseX,mouseX,mouseX,100);
  stroke((mouseX+999)*.255,(mouseX+999)*.255,(mouseX+450)*.255,globalOpacity); //wheat gold strokes
  strokeWeight(mouseY);
  //ellipse(width/2, height/2, circlewidth,circleheight); //for only a fixed circle in the centre  
  ellipse(mouseX, mouseY, circlewidth,circleheight);
  wormholeGrow();
}

void mouseDragged() {
  fill((mouseX+800)*.255,(mouseX+450)*.255,(mouseX+100)*.255,globalOpacity); //rose gold fill
  //fill((mouseX+450)*.255,(mouseX+450)*.255,(mouseX+50)*.255,globalOpacity); //vegas gold fill
  //fill(mouseX,mouseY,mouseX); //basic pink, green palette
  //ellipse((500-mouseX+1), (500-mouseY+1), circlewidth,circleheight); //creates twinned wormhole in centre when dragging
  ellipse((500-mouseX+1), (500-mouseY+1), circlewidth,circleheight); //mirrored wormhole
  wormholeGrow();
}

void mousePressed() {
    fill((mouseX+450)*.255,(mouseX+450)*.255,(mouseX+800)*.255,globalOpacity*5); //wild blue yonder fill to simulate dew
    //stroke(0,(mouseX+200)*.255,(mouseX+300)*.255,globalOpacity*2);
    //fill(mouseY,mouseX,0); //basic yellow, orange palette
    ellipse((500-mouseX+1), (500-mouseY+1), circlewidth*.5,circleheight*.5); //mirrored wormhole that is smaller
}

void mouseReleased() {
  circlewidth = 0;
  circleheight = 0;
}
