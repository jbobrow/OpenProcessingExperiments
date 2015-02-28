
//Nicolette Hashey

int x=0;
int y=0;
int w=100;
int h=100;
int i=1;
int p=1;

void setup() {
  size(500, 500);
  background(0);
}

void draw() {

  for (int x=0; x<width; x+=100) {//vertical
    for (int y=0; y<height; y+=100) {//horizontal
      while(i<6){
        noStroke();
        fill(#FF0000);
        ellipse(100+x,100+y, w, h);//make red ellipse
        w=w-10;//decrease diameter
        h=h-10;
        fill(255);
        ellipse(100+x, 100+y, w, h);//make white ellipse
        w=w-10;//decrease diameter
        h=h-10;
        i++;
      }
      
      x+=100;//increase x coordinate
    }
    y+=100;//increase y coordinate
  }
}



