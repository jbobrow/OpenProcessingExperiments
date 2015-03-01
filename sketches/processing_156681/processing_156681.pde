
//declare
int value = 0;


void setup(){
//load (in setup)
  background (255,200,200);
  size (600,600);

  }
  
  void draw (){
  //draw it at 0,0 (in draw)

  fill(mouseY);
  rect(200, mouseX/4, 150, 150);
 ellipse(mouseX,mouseY,width/4,height/4);
  if(mouseX >0 && mouseX<width/2 && mouseY>0 && mouseY<height/5 )
  {fill(200);
    }
    else {
    fill(250);
  
    }
   
    }

