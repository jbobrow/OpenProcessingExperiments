
class Walker{
float x;
float y;
float R;
float G;
float B;

Walker(float newx, float newy,float newR, float newG, float newB){
  x = newx;
  y= newy;
  R = newR;
  G = newG;
  B = newB;
}

void display(){
float r = random(25);
noStroke();
fill(R,G,B,50);
ellipse(x,y,r,r);
}

void step(){
  float choice = int(random(4));
  
  if (choice ==0){
    x++;}
    else if(choice ==1){
      x--;}
     else if (choice ==2){
       y++;}
       else if (choice ==3){
       y--;}
       
}}
Walker[] w = new Walker[150];


void setup(){
  size(700,500);
 for(int i =0;i<w.length;i++){
  w[i] = new Walker(random(width),random(height),random (255),random(255),random(255));
 }
  background(255);

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


