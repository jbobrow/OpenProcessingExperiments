
int frames = 6;
int panel = 0;
PImage jim = new PImage[frames];
int x = 0;

/*class Mtv{
  Mtv(){
    
  }
  Mtv(){
    
  }
  void draw(){
    
  }
}*/

void setup(){
  size(700,700);
  frameRate(24);
  for(int i=0;i<jim.length;i++){
    jim[i] = loadImage(i + ".jpg");
  }
}

void draw(){
  panel = (panel+1) % frames;
  image(jim[panel % frames], 0,0);
}


