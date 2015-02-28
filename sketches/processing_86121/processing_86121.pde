
int j = 0;
float k = 0;
float h = 0;
int i = 0;
void setup()
  {
  size(600, 600);
  background(0);
}
void draw()
  {
     float y = random(190, 255);
     float x = random(255);
     float r = random(200, 255);
     float Xcoordinate = random(600);
     noFill();
     while(i < 700) { // This is the bottom left-hand triangle
        stroke(r,0,x);
        line(h,i,Xcoordinate,Xcoordinate);
        h = h + 1;
        i = i + 600;
     }
      i = 0;
      h = 0;
        while(j < 700) { // This is the top right-hand triangle
        stroke(0,x,r);
        line(j,k,Xcoordinate,Xcoordinate);
        k = k + 1;
        j = j + 600;
     }
     j = 0;
     k = 0;
}
