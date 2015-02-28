
int x; 
PFont mouseFont;
PFont bickhamFont;
PImage myImage;



void setup() {
  size (600,600);

  x=0;
 
  mouseFont = loadFont("LiSungLight-48.vlw");
  bickhamFont = loadFont("BickhamScriptPro-Semibold-48.vlw");
  myImage = loadImage("snoopy1.jpg");
}

void draw (){
      background (255,244,113);
  tint(255,244,113,50);  
  image(myImage,200,130);

  text ("hellooooooooo", mouseX, mouseY);
  fill(255);
  textFont(bickhamFont);
  text("lalala", random(500),random(500));
  
  
  fill(0);
  textFont(mouseFont);
  


  
  

  
  

}

