

 
int numFaces = 4;
int counter = 0;
int eyeBall1;
int eyeBally2;

int bX1;
int bY1;
int bX2;
int bY2;

int startTime = 0;
int delay=1100;

PImage[] images = new PImage[numFaces];

void setup(){
  size(500, 500);
  imageMode(CENTER);
  
  for(int i = 0; i < numFaces; i++){
    images[i] = loadImage("face" + i + ".jpg");
  } 

}


void draw(){
     image(images[counter], width/2, height/2, width, height);
    
     if(millis() > startTime + delay){
      counter++;
      startTime = millis();
      if(counter > numFaces-1){
        counter = 0;
      }
      println(counter);
    }
     
fill(0);
smooth();
noStroke();


  ellipse(map(mouseX+300, width/4, width, 105, 162),360, 90, 90);  
  ellipse(map(mouseX+480, width/4, width, 265, 322),360, 90, 90);
 
}


