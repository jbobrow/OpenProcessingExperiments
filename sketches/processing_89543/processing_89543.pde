
void setup(){
  size(480,400);
  smooth();
}

void draw(){
  background(255,120); 
  fill (157,74,19);
  ellipse (200,200,300,300); //head
  fill (250,250,250);
  ellipse (250,150, 60, 60); //right eye
     ellipse (150,150, 60, 60);//left eye
     fill (0,0,0);
     ellipse (150, 150, 50/2, 50/2); //left pupil
      fill (0,0,0);
     ellipse (250, 150, 50/2, 50/2); //right pupil 
     noFill();
stroke(255, 102, 0);
curve(10, .5, 180, 230, 250, 230, 230, 230);
}
