
float angle = 0.0;
PFont frutiger;
String rotateme = "MAKE ME A FAN";
void setup()

{
  size(500, 500);
smooth();

  frutiger = loadFont("Frutiger-Bold-48.vlw");
  textMode(CENTER);
  textAlign(LEFT,BOTTOM);
  rectMode(CENTER);
}

void draw()
{

  background(0);
  noFill();
 for(int i=0; i<width; i+=20){
   fill(i);

 if(mousePressed)
 {
  pushMatrix(); //add after
     translate(mouseX,mouseY);
  
rotate(angle);
  //rect(0,0,20,20);
  
  text(rotateme, 0, 0, 50);
  
  popMatrix();
  fill(255,0,0);
  text("stop following meeeee!", mouseX+100, mouseY+80, 50); 

 }
  else{
   text(rotateme,width/2,height/2, 50,50);
    
  }
  
  angle+=0.1;
}
}

