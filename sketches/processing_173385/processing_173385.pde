
int ax , ay ,bx, by;
   
void setup() {
       size(600, 600);
       stroke(0);
       background(#ff8000);
}



      while (mousePressed=true){
      if (mousePressed){
        ax=mouseX;
        ay=mouseY;
      }
        line(ax,ay,mouseX,mouseY);
        if (mousePressed){
          bx=mouseX;
          by=mouseY;
          line(ax, ay, bx, by);
          ax=bx;
          ay=by;
      }
    
