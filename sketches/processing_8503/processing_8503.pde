
int anzImages = 6;
int pause, time;
float alph;
Boolean show, looping;

PImage[] images = new PImage[anzImages];  
 
int actImage = 0;
int nextImage = 0;
 
  
void setup() {  
  background(255);
  size(400,400);
  show = false;
  looping = true;
  pause = 3000; 
  time = millis();
  initImages();
  alph = 0;
  
}  
  
void draw() {
  if(millis() >= (time + pause) && !show){
    show = true;
  actImage = nextImage;
  nextImage = getNext();
  alph = 0;
  }
   displayImage(); 

} 
void displayImage(){
  if(alph<255){
    alph += 2.75;
  background(255); 
  tint(255, 255);  
  image(images[actImage],0,0,width,height); 
  tint(255, alph);  
  image(images[nextImage],0,0,width,height);
  }
  else if(alph>=255 && show){
  show = false;
  time = millis();
  }
}
void initImages(){
  for(int i = 0; i < anzImages; i++)  
  { 
    images[i] = loadImage("image_"+(i+1)+".jpg");      
  }
}


int getNext(){
  return nextImage<anzImages-1?++nextImage:0;
}

void keyPressed() {
  if(key == ' '){
    looping = !looping;
    if(looping)loop();
    else noLoop();
  }
}


