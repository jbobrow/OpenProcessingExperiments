

PImage cityImage;
PImage taxiImage;
PImage scionImage;

//cab speed
int cabspeed = 175;
int cabposition = -800;

//scion speed
int scionspeed = 200;
int scionposition = -200;

void setup(){
  
  size(600,400);

}

void draw (){
  //background
  cityImage = loadImage("city.jpg");
  image(cityImage,0,0,width,height);
  
  //taxi
  taxiImage = loadImage("cab.png");
  image(taxiImage,cabposition,55);
  
  cabposition = cabposition + cabspeed; 
  
  //scion
  scionImage = loadImage("scion.png");
  image(scionImage,scionposition,175,550,375);
  
  scionposition = scionposition + scionspeed;
  
  for(int a=0; a<width; a+=20){
    float colorValue = map(a,0,600,0,255);
    fill(50,colorValue,178,50);
    noStroke();
    rect(a,0,40,50);
  
  }
    
}

  

  
  





