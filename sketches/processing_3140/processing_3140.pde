
///////////////////////////////* :Ivasion: :Lifo Fernandez: :25 July 2009:  *////////////////////////////

Layer myLayer1;
Layer myLayer2;

int nLayers = 7;
Layer[] myLayer  = new Layer[nLayers];


float yLand = 0;
float ySpeedLand;

PImage a;
void setup(){

  ySpeedLand = 0.5;

  frameRate(60);
  size(950,600,P2D);
  background(0);
  smooth();
  a = loadImage("land.jpg");

  for (int L=0;L<nLayers;L++){
    int nInvs = (2*(L*(L)))+1;//num invarors per row
    int  nParts = (2+nLayers)-(L);// num parts*parts in each invasor
    int rdmSise = (nLayers+1)-(L);
    float Speed = 1+(9-(L*1.6));
    float rdmSpeed = 1+(L-(L/2));
    color col = color(100-(L*5),205-(L*25),0+(L*10));
    //(n invaros, n parts, random sise, speed, random speed, color) 
    myLayer[L]= new Layer(nInvs,  nParts, rdmSise,     Speed, rdmSpeed,     col); 

  }
}
void draw(){
  image(a, 0, yLand);

  for(int nL=nLayers-1;nL>=0;nL--){
    myLayer[nL].Up();
  }


  yLand-=ySpeedLand;
  if (yLand<=-300 || yLand>=0){
    ySpeedLand*=-.5;
  }
}
















