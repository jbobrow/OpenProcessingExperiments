
     

void setup ( ) {

  size (500,500);
  background (220,60);
  smooth();
}

void draw () {
 
}


void keyPressed () {



  fill ( random (45),random (104),random (185),40);
  stroke (141,54,104,10);
   quad(100,100,width/2,height/2,random (100,255),mouseX,mouseY,random (250,40));//v



  //helping the o 
if (key=='o')
fill ( random (74),random (68), random (213),30);
quad(width/2,height/2,mouseX,mouseY,mouseX,mouseY,random (250,40),random (40,250));//o

//adding elements
  if (key == 'q') {
    fill (249,11,11,30);
    ellipse (mouseX,mouseY,random (30,60),random (20,80));
  }

  if(key =='s') {
    saveFrame();
  }
}
                
