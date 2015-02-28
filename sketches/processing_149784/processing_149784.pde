
String word = "quiet";
float xpos, ypos;
PImage picture;

float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;

void setup(){
  frameRate(15);
  picture=loadImage("me.png");
  size(495,500);
  textSize(40);
  fill(255);
  xpos =width/2;
  ypos =height/2;
  PFont font = loadFont ("AkzidenzGroteskBE-XBdCnIt-48.vlw");
  textFont(font);
  smooth();
  textAlign(LEFT);
}
 
void draw(){
  background(pathR,pathG,pathB);
  pathR=centerR+R*sin(a);
  a=a+.03;
   
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
   
  pathB=centerB+B*sin(a2);
  a2=a2+.03;

   
  for(int i=0; i<=width; i+=80){
   
  pushMatrix(); 
  float angle = atan2(mouseY,mouseX-i); 
  translate(i,0);
  rotate(angle);
  text(word,0,0); 
  popMatrix();
    image(picture,100,190);

    }
  }



