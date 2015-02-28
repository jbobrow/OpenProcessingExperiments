
PImage img;
int[] positionX = new int[100];
int[] positionY = new int[100];
int i = 0;

void setup(){
  background(255,107);
  img = loadImage("spider.jpg");
  size(700, 500);
  stroke(0, 100);
}
 
void draw(){
  image(img,150,100);
   positionX = append(positionX, mouseX);
   positionY = append(positionY, mouseY);
     
  for(int j=0; j < positionX.length; j++){
      int distance = int(dist(positionX[j], positionY[j],mouseX, mouseY));
      float r = random(0, 300);
      if(distance < 70 && r < 50)  line(positionX[j],positionY[j],mouseX, mouseY);
  }
}

void mousePressed(){
    if(mousePressed){
    stroke(random(0,255));
    } 
}

void mouseReleased(){
    stroke(255,100);
  }

