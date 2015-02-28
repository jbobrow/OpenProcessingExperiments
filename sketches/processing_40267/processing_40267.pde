
PImage img;

int[] x = new int[300];
int xcoord = 0;

void setup(){
  size(300,300);
  noStroke();
    
  img = loadImage("AbstractArt.jpg");
  background(img);
}
  
  void draw(){
  
    for (int i = 0; i < width; i+=5){ //sets spacing for ellipses
      
      color c = img.get(xcoord,i); //color of each ellipse will match pixel at location
      int bright = int(brightness(c) / 5);//brightness of pixels at given x coordinate will control size of ellipses drawn
      
      x[i] = bright;
      
      fill(c);
      
      ellipse(xcoord,i,x[i],10);
       
      if(xcoord > width){
        xcoord = 0;
      }
    }
    xcoord++;
  }

