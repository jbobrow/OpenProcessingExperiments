
PImage s;
 
float pushx = 90;
float pushy = 10;
float biggest = 3;
float scaler = 0;
 
void setup()
{
  size(640,480);
  smooth();
  imageMode(CENTER);
  //s = loadimage("eyesDETAIL.svg");
  s = loadImage("eyes_mosaic_1.png");
}
 
void draw(){
   
  scaler = map(mouseX, 0 , 5, 0,640);
  println(scaler);
 
background(255);
 
 
image(s,width/2 ,height/2, scaler*4, scaler*3);
image(s,width/2 ,height/2 , scaler*4/8, scaler*3/8);
image(s,width/2 ,height/2 , scaler*4/8/8, scaler*3/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8, scaler*3/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8, scaler*3/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8, scaler*3/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8/8/8);
image(s,width/2 ,height/2 , scaler*4/8/8/8/8/8/8/8/8/8/8/8/8/8, scaler*3/8/8/8/8/8/8/8/8/8/8/8/8/8);


}

