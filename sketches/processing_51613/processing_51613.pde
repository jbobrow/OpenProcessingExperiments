

                
                void setup(){
  size(900,400);
  smooth();
}





void draw(){
  for(int x=0;x<width;x+=10){
    for(int y=0;y<height;y+=10){
       if(mouseX>x&&mouseX<x+10&&mouseY>y&&mouseY<y+10){
         fill(0,0,0);
       }  else{
         noFill();
       }
      line(x, y, mouseX, mouseY);
    }
  }
  }


   void mouseReleased(){
     background(random(255),random(90),random(80));
   }





