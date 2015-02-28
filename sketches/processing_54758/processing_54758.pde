
int x = 5;
float b = 300;
int y = 12;
float f=12;
PFont myfont;

void setup(){
  size(800,400);
  myfont=loadFont("Fonttt.vlw");
  background (201,238,255);
}

void draw (){
 
 //background(random(255),random(255),255);
  //line(200,200,mouseX,mouseY);
 // fill(0,mouseX,mouseY,mouseX);
  //rect(10,100, mouseX, mouseY);
//ellipse(400,400,b,b);
   
  fill(255-mouseX,255-mouseY,200);
  textFont(myfont);
  textSize(mouseX);
  text("SORRY...",1,300);
  
    fill(255,mouseY,mouseY,255-mouseX);
  textFont(myfont);
  textSize(200-mouseY);
  text("we're closed...",10,350);
  
   
}
  


