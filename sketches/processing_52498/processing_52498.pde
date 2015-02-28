
void setup () {
  //set up the side of the window
  
  size (600,600,P3D);
  smooth ();
  frameRate (30);
}

void draw () {
  //draw a black backgorund
  background (200,139,206);
  
  //set ellipse and rects to center mode
  ellipseMode (CENTER);
  rectMode (CENTER);
  
  
  //draw robots body
  stroke (0);
  fill (220,32,98);
  rect (mouseX,mouseY,20,100);
  
  //draw robots head
  stroke (244,0,0);
  fill (3);
  rect (mouseX,mouseY-30,60,60);
  
//drwa robot's eys
{
    fill (mouseX,4,mouseY);
    ellipse (mouseX-19,mouseY-30,16,32);
    ellipse (mouseX+19,mouseY-30,16,32);
    ellipse (mouseX+1,mouseY-40, 16,32);
    
    //draw robot's legs
    stroke (2);
    line (mouseX-10,mouseY+50,pmouseX-10,pmouseY+60);
    line (mouseX+10,mouseY+50,pmouseX+10,pmouseY+60);
    
    //draw robot's arms
    stroke (2);
    line (mouseX-10,mouseY+20,pmouseX-10,pmouseY+20);
    line (mouseX+10,mouseY+20,pmouseX+10,pmouseY+20);
  }
  
  
  println ("Greeeeeeeluuurrrrppppppweeeekkkkk");
}


