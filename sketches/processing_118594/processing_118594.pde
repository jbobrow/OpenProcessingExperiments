
float x;
float y;
float size1;
float size2;

void setup(){
  size(600, 600);
  
  makeGrid();
}

void mousePressed(){
  makeGrid();
}
  

void makeGrid(){
  x = 0;
  y = 0;
  size1 = random(60);
  size2 = random(60);
  
  background(0);
  for(int x=0;x<10;x++){
    for(int y = 0;y<10;y++){
       fill(random(40), random(255),random(255));
       ellipse(x*size1, y*size2, size1, size2);
    }
  }
}
void draw() {
       
       //HOW TO GET THIS TO GO IN A PERFECT SQUARE/MAKE THE X & Y VARIBLES 1)
}

