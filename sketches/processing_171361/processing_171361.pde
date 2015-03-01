
String creativity = "creative";
String coding = "coding";

float x;
float y;

int value = 1;
 
void setup (){
  size(500,500);
  frameRate(10);
  background(0);
}
 
void draw(){   
  value++;
   
  fill(255,20);
  
  if(0 < 300){
    textSize(value);
  }

  text(creativity, 0, 266);
  text(coding, 0, 433);

if(mousePressed){
   
  fill(0,50);
  
  if(0 < 300){
    textSize(value);
  }

  text(creativity, 0, 266);
  text(coding, 0, 433);

}
}

