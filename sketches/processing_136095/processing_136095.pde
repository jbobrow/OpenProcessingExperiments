

int sizeX=10;
int sizeY=10;
ArrayList<Ellipses> ellipses;

void setup() {
  size(400,400);
  smooth();
}


void draw() {
 // fill(255,50); //rgb,alpha white background, for shadow effect of circle
 // rect(0,0,width,height); //draw rect for shadow effect of circle
  
 // fill(0); // for shadow effect of circle
  line(mouseX,mouseY,pmouseX,pmouseY);
  if(mousePressed){
  //  line(mouseX+10,mouseY,pmouseX+1000,pmouseY);
    ellipse(pmouseX,pmouseY,sizeX,sizeY);
    sizeX = sizeX+2;
    sizeY = sizeY+2;
  }
  
 // ellipses.display();
}

  void mouseReleased() {
    sizeX = 10;
    sizeY = 10;
    ellipses = new ArrayList<Ellipses>();  // Create an empty ArrayList
    ellipses.add(new Ellipses(pmouseX, pmouseY,sizeX,sizeY));  // Start by adding one element
   // Ellipses elli = new Ellipses(pmouseX, pmouseY,sizeX,sizeY);
    
  }
  
  class Ellipses{
    Ellipses(int x, int y, int sx, int sy){
    ellipse(x,y,sx,sy);
    }
  }
