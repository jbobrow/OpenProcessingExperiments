
int x=150;
int y=150;
void setup() {
  background(255);
  size(300,300);
    smooth();
    strokeWeight(3);
    rect(0,0,300,300);
    
    rectMode(CORNER);
    fill(0,0,0);
    noStroke();  
    rect(x,y,5,5);
    print("initiate");
       
    for(int i=0; i<100; i++){
      float a = random(0,300);
     float b = random(0,300);
    rect(a,b,10,10);
    }
    
}

void draw() {
  color black = color(0,0,0);
  loadPixels();
  
//  x=x+(random(-1,1));
//  y=y+(random(-1,1));


if (pixels[(y*300)+(x+5)]!= black){
  x=x+1;
  print("a");
}


else if (pixels[(y+5)*300+x]!= black) {
  y=y+1;
  print("c");
}

else if (pixels[(y-1)*300+x]!= black) {
  y=y-1;
  print("d");
}
else if (pixels[y*300+(x-1)]!= black) {
  x=x-1;
  print("b");
}
else {
  x= 10;
  y= 10;
}

  
 rect(x,y,5,5);
}

