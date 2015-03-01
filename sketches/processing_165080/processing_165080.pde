
// sets the colours for what I want
color normal = color(204,100,100);
color highlight = color(100,204,100);

int x=100;
int y=100;
  
int widthx=300;
int heighty=200;
  
int xend=x+widthx;
int yend=y+heighty;

// sets the size of the window
void setup(){
size(500,500);
}

// allows the window to refresh
void draw() {
  
  //if statement
  if (x<mouseX && mouseX<xend
      && y<mouseY && mouseY<yend) {
    fill(highlight);
    strokeWeight(2);
  } else {
    // if the above is false then this is what happens
    fill(normal);
    strokeWeight(2);
  }
  
  //makes a rectangle
  rect(x, y , widthx,heighty);
}


