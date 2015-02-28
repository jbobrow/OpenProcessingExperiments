
   float a;
   float b;
   int z= -80;
int c= -80;
int sketchWidth=1280;
int sketchHeight=800;

void setup () {
  size (1280, 800);
  background (255);  

}


void draw () {
   background (random(100, 255), random(100, 255), random(100, 255));
   
// z=z+1;
//c=c-1;

fill(0);
PFont caslon = loadFont("ACaslonPro-Regular-48.vlw");
PFont caslonI = loadFont("ACaslonPro-Italic-48.vlw");
PFont caslonB = loadFont("ACaslonPro-Bold-48.vlw");
PFont helvetica = loadFont("HelveticaNeue-48.vlw");
textAlign(CENTER);

 for (int i = 0; i < sketchWidth; i = i+160) {
  for (int j = 0; j < sketchHeight; j = j+80) {
    textSize(32);
    
    a=random(200);
    float whichFont=random(100);

if (whichFont<50){
textFont(caslon, 36);}
if(whichFont<30){
textFont(caslonI, 36);}
if(whichFont<20){
textFont(caslonB, 36);}


 
   
 if (a<25) {
  
  text ("nerd", i, j);
  } 
  
 if ((a<50) && (a>25)){
    
  text ("bird", i, j);
  
  } 
  
 if ((a<75) && (a>50)) {
  
  text ("turd", i, j);
   
  }
  
if ((a>75) && (a<100)) {
    
  text ("word", i, j);
}
      
     if ((a>100) && (a<125)) {
  
  text ("fart", i, j);
    
  } 
  
 if ((a<150) && (a>125)){
    
  text ("smart", i, j);
  
  } 
  
 if ((a<175) && (a>150)) {
  
  text ("larp", i, j);
   
  }
  
if (a>175) {
    
  text ("heart", i, j);
}
   
  }
  }

  for (int i = 80; i < sketchWidth; i = i+160) {
  for (int j = 40; j < sketchHeight; j = j+80) {
    textSize(32);
  
      a=random(100);
textFont(helvetica, 24);
  
 if (a<25) {
  
  text ("and", i, j);
  } 
  
 if ((a<50) && (a>25)){
    
  text ("but", i, j);
  
  } 
  
 if ((a<75) && (a>50)) {
  
  text ("with", i, j);
   
  }
  
if (a>75) {
    
  text ("or", i, j);
}
  }}

 delay(100);
 
 if (mousePressed) {
   saveFrame("quotes####.jpg");
 }
   
 }


