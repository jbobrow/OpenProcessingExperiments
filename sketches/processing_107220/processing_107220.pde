
void setup(){

  size(800,600);
  frameRate(5);
  reset();
}

void reset(){

  p1 = new Point( width/2, height / 6 );
  p2 = new Point( width/6, 5 * height / 6 );
  p3 = new Point ( 5 * width / 6, 5 * height / 6);
  i = 0;
}

Point p1, p2, p3;
  int i =0;
  int cuantos = 30;
   float q = 0.05F;
   float p = 1 - q;
  int px1, py1, px2, py2, px3, py3;

void draw(){
  
 // triangle(p1.X, p1.Y, p2.X, p2.Y, p3.X, p3.Y);
  
   //for (int i = 0; i < 40; i++)
   {
     
     fill(0, 0, 255 - (i * 255 / cuantos) , (i + 10) * 255 / cuantos);
     
     triangle(p1.X, p1.Y, p2.X, p2.Y, p3.X, p3.Y);
     
     px1 = int(p * p1.X + q * p2.X);
     py1 = int(p * p1.Y + q * p2.Y);
     px2 = int(p * p2.X + q * p3.X);
     py2 = int(p * p2.Y + q * p3.Y);
     px3 = int(p * p3.X + q * p1.X);
     py3 = int(p * p3.Y + q * p1.Y);
     p1.X = px1; p2.X = px2; p3.X = px3;
     p1.Y = py1; p2.Y = py2; p3.Y = py3;
     
     
   }
   if (i++ > cuantos)
     noLoop();
  // print((i + 2) * 255 / cuantos + "\n");
}

void mousePressed(){

}

void mouseReleased() {
    background(204);
    reset();
  loop();  
}


class Point{

  int X;
  int Y;
  
  Point(int x, int y){
    X = x;
    Y = y;  
  }

}


