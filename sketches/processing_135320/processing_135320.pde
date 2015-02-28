
int numRects=10;
int maxX=5;
int maxY=5;
int counter=90;
int randColor=0;


float radsC=10;
float interval=900;
float x=0;
float y=0;

color white=color(255,255,255);
color red=color(255,0,0);
color blue=color(0,0,255);
color yellow=color(255,255,0);

void setup() {
  size(900, 600);
  fill(0);
   colorMode(RGB);
   frameRate(1);
}

void draw() {
  
  randColor=floor(random(1,10));
   maxX=floor(900/numRects);
   maxY=floor(600/numRects);
   interval=900/numRects;
   
  for(int i=0;i<maxX+1;i++){
        for(int j=0;j<maxY+1;j++){
          randColor=floor(random(1,10));
            x=interval*i;
            y=interval*j;
            
            fill(white);
            if(randColor==7){
              fill(red);
            }
            if(randColor==8){
             fill(blue); 
             
             
            }
            if(randColor==9){
              fill(yellow);
             
            }
            radsC=radians(counter);
            rect(x,y,interval*sin(radsC),interval*sin(radsC));
        }
    
    
  }
  counter=counter-5;
  if(counter<10){
    counter=90;
  }
  
}

