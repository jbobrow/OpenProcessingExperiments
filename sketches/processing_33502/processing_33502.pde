
int greennX = 300;
int greennY = 200;
int yelX = 300;
int yelY = 200;
int kittyX = 200;
int kittyY = 150;
PImage greenn;
PImage yel;
PImage kitty;

void setup(){
size(900,700);
background(0);
smooth();
greenn = loadImage("greenn.png");
yel = loadImage("yel.png");
kitty = loadImage("kitty.png");
frameRate(60);
}

void draw(){
  background(0);
  
  //greenn = loadImage("greenn.png");
  image(greenn,mouseX,mouseY,pmouseX,pmouseY);
  

  if(mousePressed){
  yel = loadImage("yel.png");
  image(yel,mouseX,mouseY,pmouseX,pmouseY);
  
 }
}

void keyPressed(){
   if(key=='b' || key=='B'){
      fill(0);
      rect(0,0,900,700);
    }
      if(key=='k' || key=='K'){
      image(kitty,mouseX,mouseY);
    }
      
}

   
  



//void keyPressed(){
   
//}


