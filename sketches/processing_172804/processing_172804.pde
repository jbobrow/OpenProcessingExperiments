
int frames = 3;
int panel = 0;

PImage beastMode = new PImage[frames];

void setup(){
  size(500, 500);
  final_dest = loadImage("final_dest.png");
  for(int i=0;i<beastMode.length;i++){
    beastMode[i] = loadImage("power_"+i+".png");
  }
  frameRate(8);
  
}

void draw(){
  //background
    final_dest.resize(700, 700);
    image(final_dest, -100, -50);
  
  //Goku
    if(keyPressed){
      if(key == 's'){
      panel = (panel+1) % frames;
      image(beastMode[panel%frames],50,295);
      }
    }
    else {
    image(beastMode[panel%frames],50,295);
    }

}


