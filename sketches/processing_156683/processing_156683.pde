
int value = 0;
PImage myImage;

void setup(){
//load (in setup)
  size (800,800);
  background (200,244,29);
  myImage=loadImage ("Tri.jpg");
}

  
  void draw (){
  //draw it at 0,0 (in draw)
background(0);
  fill(mouseY/10);
 ellipse(mouseX,mouseY,width/10,height/10);
  if(mouseX >0 && mouseX<width/2 && mouseY>0 && mouseY<height/2 )
  {fill(0,290,0);
    }
    else {
    fill(0,240,294);
  
    }
    if (mouseX > 100 && mouseX < 250 && mouseY > 200 && mouseY < 350) {
    fill(0,255,0);
    size ((mouseX*5), (mouseY*2));
    ellipse(mouseX, mouseY, 200, 200);
  }

   
    }

