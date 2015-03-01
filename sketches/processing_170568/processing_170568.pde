
int frames = 70;
int panel = 1;
PImage stickman = new PImage[frames];
float xpos, ypos;

void setup(){
  size(900,900);
  for(int i=0;i<stickman.length;i++){
    stickman[i]=loadImage("stickman_"+i+".gif");
  }
}

void draw(){
  fill(255);
  rect(0,0,900,900);
  
  if(keyPressed){
    if(key == 'd' || key == 'D'){
      xpos++;
      panel = (panel+1) % frames;
      image(stickman[panel%frames],xpos,0);
    } 
  } else {
    image(stickman[panel%frames],xpos,0);
  }
}




