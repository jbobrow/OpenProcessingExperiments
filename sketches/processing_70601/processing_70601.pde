
void setup (){
  size (500, 500);
  noStroke();
  
}

void westinshape (int x, int y){


fill(#5398ed); 
triangle (x, y, x, y + 50, x + 25, y + 50); //Draws Blue triangle
fill (#bd2767);
triangle (x,y,x + 25,y, x + 25,y + 50);  //Draws Red Triangle
fill (#eeeb06);
ellipse (x + 25, y + 50, 25, 50); //draw yellow circle
fill (#000000);
rect (x + 5, y, 5, 50); //draw black rectangle
fill (#ffffff);
rect (x, y, 5, 50); //draw white rectangle



}
void westinsothershape(int x, int y){

fill (#ffffff);
ellipse (x + 25, y + 50, 15, 40); // draw white circle


}


void draw() {
  for (int u = 0; u < 500; u+=25){
    for (int i = 0; i < 500; i+=50){ 
      westinshape(u, i);
       if ((u % 50 == 0)&& (i % 100 == 0)) {
    westinsothershape (u, i);
      }
    }
  }
}
