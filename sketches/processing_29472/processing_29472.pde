
int Spacing = 50;
int x = 0;
int y = 0;

 
void setup() {
  size(500,500);

}
 
 
void draw() {
  background(255);
  noStroke();
 
  for(int x=0; x<500;x=x+100) {
  
     
    for (int y=0 ;y<500;y=y+100) {
        triangle(x, y, x, y+Spacing, x+Spacing, y+Spacing);
     triangle(x, y, x+Spacing, y, x+Spacing, y+Spacing);
     frameRate(5);
      int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
     fill(r,g,b);
    }
  }
 for(int x=0;x<500;x=x+100) {
    for (int y=0;y<500;y=y+100) {
   triangle(x+50, y+50,x+50, y+Spacing+50,x+Spacing+50, y+Spacing+50);
      triangle(x+50, y+50, x+Spacing+50, y+50, x+Spacing+50, y+Spacing+50);
      
       int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
     fill(r,g,b);
    }
  }
 
  for(int x=0;x<500;x=x+100) {
    for (int y=0;y<500;y=y+100) {
 int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
     fill(r,g,b);
     
      triangle(x+50, y+Spacing, x+Spacing+50, y+Spacing,x+Spacing+50, y);
      triangle(x+50, y+Spacing, x+50, y,x+Spacing+50, y);
    
    }
  }
 
 
  for(int x=0;x<500;x=x+100) {
    for (int y=0;y<500;y=y+100) { 
     
      triangle(x, y+Spacing+50, x+Spacing, y+Spacing+50, x+Spacing, y+50);
     triangle(x, y+Spacing+50, x, y+50, x+Spacing, y+50);
 
       int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
     fill(r,g,b);
    }
  }
}



