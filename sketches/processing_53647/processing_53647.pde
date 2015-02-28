
class DesignEllipses{
  
  int alignEllipsesX = 0;
  int alignEllipsesY = 0;
  int count = 0;
  
  void ellipses(int x, int y, int xx, int yy){
    if(count>45){
      xx-=90;
      yy-=90;
      fill(255,0,0);
      rects.designRect(x-alignEllipsesX,y-5+alignEllipsesY, xx, yy);
      if(newRect){
        fill(255,0,0);
        ellipse(x-alignEllipsesX, y+alignEllipsesY, xx, yy);
        fill(0,0,0);
        ellipse(x-alignEllipsesX, y+alignEllipsesY, xx-3, yy-3);
        fill(255,0,0);
        ellipse(x-alignEllipsesX, y+alignEllipsesY, xx-20, yy-20);
        fill(0,0,0);
        ellipse(x-alignEllipsesX, y+alignEllipsesY, xx-23, yy-23);
        fill(255,0,0);
        ellipse(x-alignEllipsesX, y+alignEllipsesY, xx-40, yy-40);
        if(alignEllipsesY < 43){
          alignEllipsesX+=5;
          alignEllipsesY++;
        }else if(alignEllipsesY == 43){
          
        }else{
          alignEllipsesY = 0;
          alignEllipsesX = 0;
        }
      }
    }else if(count>40){
      generateProcedure(6, x, y, xx, yy);
    }else if(count>35){
      generateProcedure(5, x, y, xx, yy);
    }else if(count>30){
      generateProcedure(4, x, y, xx, yy);
    }else if(count>25){
      generateProcedure(3, x, y, xx, yy);
    }else if(count>=20){
      generateProcedure(2, x, y, xx, yy);
    }else if(count>=15){
      generateProcedure(1, x, y, xx, yy);
    }else if(count>=10){
      fill(255, 0, 0);
      text("You ", 30, 100);
      text("are ", 185, 100);
      text("here", 315, 100);
    }else if(count>=5){
      fill(255, 0, 0);
      text("You ", 30, 100);
      text("are ", 185, 100);
    }else if(count>=0){
      fill(255, 0, 0);
      text("You ", 30, 100);
    }
    count++;
  }
  
  void writeText(){
    fill(255, 0, 0);
    text("Travelling to...", 8, 70);
  }
  
  void generateProcedure(int proc, int x, int y, int xx, int yy){
    if(proc == 1){
      fill(255,0,0);
      ellipse(x, y, xx-40, yy-40);
    }else if(proc ==2){
      fill(255,0,0);
      ellipse(x, y, xx-20, yy-20);
      fill(0,0,0);
      ellipse(x, y, xx-23, yy-23);
      fill(255,0,0);
      ellipse(x, y, xx-40, yy-40);
    }else if(proc ==3){
      fill(255,0,0);
      ellipse(x, y, xx, yy);
      fill(0,0,0);
      ellipse(x, y, xx-3, yy-3);
      fill(255,0,0);
      ellipse(x, y, xx-20, yy-20);
      fill(0,0,0);
      ellipse(x, y, xx-23, yy-23);
      fill(255,0,0);
      ellipse(x, y, xx-40, yy-40);
    }else if(proc ==4){
      xx-=30;
      yy-=30;
      fill(255,0,0);
      ellipse(x, y, xx, yy);
      fill(0,0,0);
      ellipse(x, y, xx-3, yy-3);
      fill(255,0,0);
      ellipse(x, y, xx-20, yy-20);
      fill(0,0,0);
      ellipse(x, y, xx-23, yy-23);
      fill(255,0,0);
      ellipse(x, y, xx-40, yy-40);
    }else if(proc ==5){
      xx-=60;
      yy-=60;
      fill(255,0,0);
      ellipse(x, y, xx, yy);
      fill(0,0,0);
      ellipse(x, y, xx-3, yy-3);
      fill(255,0,0);
      ellipse(x, y, xx-20, yy-20);
      fill(0,0,0);
      ellipse(x, y, xx-23, yy-23);
      fill(255,0,0);
      ellipse(x, y, xx-40, yy-40);
    }else if(proc ==6){
      xx-=90;
      yy-=90;
      fill(255,0,0);
      ellipse(x, y, xx, yy);
      fill(0,0,0);
      ellipse(x, y, xx-3, yy-3);
      fill(255,0,0);
      ellipse(x, y, xx-20, yy-20);
      fill(0,0,0);
      ellipse(x, y, xx-23, yy-23);
      fill(255,0,0);
      ellipse(x, y, xx-40, yy-40);
    }else{
    }
  }
  
  void designNewEllipse(int x, int y, int xx, int yy){
    fill(255,0,0);
    ellipse(x, y, xx, yy);
    fill(0,0,0);
    ellipse(x, y, xx-3, yy-3);
    fill(255,0,0);
    ellipse(x, y, xx-20, yy-20);
    fill(0,0,0);
    ellipse(x, y, xx-23, yy-23);
    fill(255,0,0);
    ellipse(x, y, xx-40, yy-40);
  }

}

