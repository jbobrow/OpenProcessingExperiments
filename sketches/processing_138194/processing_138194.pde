

//Text and image are two important elements in media art. 
//What a surprise when they meet together.
//I think it is interesting to draw my portraiture by text.
PImage img;
int smallPoint, largePoint;
int t=20;
//set the canvas and load the image file.
void setup() {
  size(720, 960);
  img = loadImage("IMG_0009.JPG");
  
  imageMode(CENTER);
 
  background(255);
}
//Set the imagetexter and drawing by moving mouse.
void draw(){

 String P = "I wanna go to QingHai.";

 
  textSize(t);
color pix = img.get(mouseX, mouseY);
for(int i=0;i<P.length()-1;i++){

  char n=P.charAt(i);
  
  
  fill(pix, 128);


 pix = img.get(mouseX, mouseY);
  text(n,mouseX, mouseY);
mouseX+=random(10,15);
if(mouseX>width){mouseX=0;
}

} 
}
//enter the shift+'+', increasing the textsize.
//enter the '-', decreasing the textsize.
//enter the 'delete', reset the canvas.
///enter the "S" and save the screenshot.
void keyPressed(){
  if(key=='+'){
    t+=1;
  }
   if(key=='-'){
    t-=1;
  }
  if(keyCode==DELETE){
    clear();
  
    background(255);
   
     if(keyCode=='s'){
    saveFrame("screenshot.jpg");
     }
  }
}


