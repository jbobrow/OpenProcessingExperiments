
float sx1, sy1, sx2, sy2;

void setup() {  
  size(250, 250);
  background(255);  
  Slider bar = new Slider(20, 20, width-20, 20, (width-40));
  
}

class Slider{
    int value, maxvalue, rectx, recty, mx, my;
    PVector pos, pos2;
    slider(int x, int y, int x2, int y2, maxvalue){
     pos = new PVector(x, y);
     pos2 = new PVector(x2, y2);
     value = 0;
     vector = new PVector(pos2.x-pos.x, pos2.y-pos.y);
     //vector.unit()
     mx = x;
     my = y;
   }
   void draw(){
       strokeWeight(4);
       if (mousePressed==true){
           float dist = sqrt(pow(mouseX-mx, 2) + pow(mouseY-my, 2));
           if (mouseX < mx){ dist *= -1 } 
           value += dist
       }
       rectx = pos.x + (vector.x*(value/maxvalue));
       recty = pos.y + (vector.y*(value/maxvalue));
       line(pos.x, pos.y, pos2.x, pos2.y);
       rect(rectx-4, recty-4, rectx+4, recty+4); 
   }
   void click(){
       if (mouseX > rectx-4 && mouseX < rectx+4){
           if (mouseY > recty-4 && mouseY < recty+4){
               mx = mouseX;
               my = mouseY;
           }
       }
   }
}   

void draw() {  //draw function loops 
    background(255);
    bar.draw()
}

void mousePressed(){
    bar.click()
}
