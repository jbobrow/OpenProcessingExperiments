
void setup () {
  
  size (600,800);
  smooth ();
  
}


void draw () {
  
    background (255,255,255);
    
  
//face circle
    fill (200,240,250); 
   ellipse (280,200,200,200);
//eye background  
  fill (250,200,250);
  ellipse (245,185,30,30);
  ellipse (310,185,30,30);
//nose 
  ellipse (280,220,20,20);
 
//moving eyes
  fill (0,0,0);
  float ax = map(mouseX, 0, width, 240, 250);
  float ay = map(mouseY, 0, height, 180, 190);

  ellipse(ax,ay,10,10);
  
  float bx = map(mouseX, 0, width, 305, 315);
  float by = map(mouseY, 0, width, 180, 190);
  
  ellipse(bx,by,10,10);
  
 //mouth circles
 ellipse (250,250,20,20);
 ellipse (270,255,20,20);
 ellipse (290,255,20,20);
 ellipse (310,250,20,20);
 

 
 //hat
 rect (230,50,100,70);
 rect (205,100,150,20);
 
 

 
 //first body
  fill (210,150,210);
  ellipse (280,390,200,200);
  
  //buttons
 fill (0,0,0);
 ellipse (280,450,15,15);
 ellipse (280,400,15,15);
 ellipse (280,350,15,15);
 
 //second body
  fill (200,250,210);
  ellipse (280,600,250,250);
  
  
  //hands and arms
  line (100,300,180,400);
  line (460,300,380,400);
  ellipse (100,300,20,20);
  ellipse (460,300,20,20);
  
 
  //feet
  fill (0,60,60);
  ellipse (200,725,80,30);
  ellipse (360,725,80,30);

}

