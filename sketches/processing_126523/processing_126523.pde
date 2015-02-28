
//set this to true if you want to painter to tile from one side of the screen to the other. 
//set it to false if you want the random painter to "bounce" off of the sketch bounds
boolean tilepaint = true;
//picks a random base hue to start with. Can be a fixed number if you want
int hueBase = int(random(360));
//set the hue range. A wider range brings in a more colors.
int hueRange = 72;

class Walker{
float x;
float y;
float H;
float S;
float B;

Walker(float newx, float newy,float newH, float newS, float newB){
  x = newx;
  y= newy;
  H = newH;
  S = newS;
  B = newB;
}

void display(){
float r = random(25);
noStroke();
fill(H,S,B,50);
ellipse(x,y,int(random(r)),int(random(r)));
}

void step(){
  float choice = int(random(4));
  
  
  if (choice ==0||x <=0){
      x++;}
  else if(choice ==1||x >=width){
      x--;}
  else if (choice ==2||y <=0){
      y++;}
  else if (choice ==3||y >=height){
      y--;}
       
   //if you've selected true for tilpaint then it will run this set of functions.
   if(tilepaint){
       if(x>width){
           x=0;
       }
       else if(x<0){
           x=width;
       }
       else if(y>height){
           y=0;
       }
       else if(y<0){
           y=height;
       }
   }
}}
Walker[] w = new Walker[150];


void setup(){
  size(700,500);
 for(int i =0;i<w.length;i++){
 float hue = hueBase + (random(hueRange)-hueRange/2);
  w[i] = new Walker(random(width),random(height),hue ,random(360),random(360));
 }
  background(255);
  colorMode(HSB, 360);

}
void draw(){
  for(int i =0;i<w.length;i++){
  w[i].step();
  w[i].display();
  }

}

void keyPressed() {
 if(key=='s'){ 
    saveImage();}

    if(key=='b') {
    filter(BLUR);
    }  }
void saveImage() {
  String fileName = timeStamp()+".png";
  PImage imageSave = get(0,0,width,height);
  imageSave.save(fileName);
}

String timeStamp() {
 String timestamp = year()+"_"+month()+"_"+day()+"_"+minute()+"_"+second()+"_"+millis();
 return timestamp;
}
