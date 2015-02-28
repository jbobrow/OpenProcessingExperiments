
float noiseAmount = 0.005;
int seed = ceil(random(400000));

void setup(){
  size(500,600,JAVA2D);
  noiseSeed(seed);
  makeMap();
}

void makeMap(){
  loadPixels();
  
  for(int i = 0; i<width; i++){
    for(int j = 0; j<height; j++){
      int num = i+j*width;
      color fred = color(0);
      
      float noiseVal = noise(i*noiseAmount, j*noiseAmount)*100;
      
      if(noiseVal<water){
        fred=color(0,50,205);
      }else if(noiseVal<sand){
        fred=color(200,200,50);
      }else if(noiseVal<grass){
        fred=color(50,150,0);
      }else if(noiseVal<trees){
        fred=color(20,100,0);
      }else if(noiseVal<mountains){
        fred=color(150,50,0);
      }else{
        fred=color(235,235,235);
      }
      
      pixels[num] = fred;
    }
  }
  
  updatePixels();
}

int water = 40;
int sand = 43;
int grass = 52;
int trees = 70;
int mountains = 75;


void mouseReleased(){
  makeMap();
}
void keyReleased(){
  if(keyCode==32){
    seed = ceil(random(400000));
    noiseSeed(seed);
    makeMap();
  }else if(keyCode==83){
    saveFrame("map"+year()+month()+day()+hour()+minute()+second()+millis()+".png");
  }
}

void draw(){
  
}
