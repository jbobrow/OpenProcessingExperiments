
 void setup() {
       size(400, 400);
       stroke(255);
     }

     void draw() {
      int ax, ay,bx, by,flag;
      flag=0;
      if (mouseClicked){
      ax=mouseX;
      ay=mouseY;
      flag=1;}
      if (flag==1){
      line(ax,ay,mouseX,mouseY);
      }
       }
     

