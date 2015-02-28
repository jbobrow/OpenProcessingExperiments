

int[] positionsX = new int[100];
int[] positionsY = new int[100];
int i = 0;
PImage book;
PImage pencil;
 
void setup(){
  size(628, 500);
  book = loadImage("book.jpg");
  pencil= loadImage("pencil.png");
  background(0);
  image(book,0,0);
  
 stroke(0, 10);
  
  
}
 

void draw(){ 
  
  //image(pencil,mouseX,mouseY);

if (mouseX>102 && mouseX<560 && mouseY>83 && mouseY<385){  
  

if(mousePressed){
   positionsX = append(positionsX, mouseX);
   positionsY = append(positionsY, mouseY);
  
   
  for(int j=0; j < positionsX.length; j++){
      int distance = int(dist(positionsX[j], positionsY[j],mouseX, mouseY));
      float r = random(0, 100);
      if(distance < 50 && r < 40)  line(positionsX[j],positionsY[j],mouseX, mouseY);
  }
  
  }
  
}
}


void keyPressed() {


if (key == ' ') {
   
    image(book,0,0);
}
}


