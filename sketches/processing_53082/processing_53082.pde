

float angulo=0.0;
int cae;


void setup(){
  
 size(600,600);
 smooth();
background(0);
 
}

void draw(){
  
  if(cae>=550){
  
  translate(250,cae);
  rotate(angulo);
  rect(-50,-30,150,150);
  ellipse(-175,60,50,50);


  }
  
  else{
    translate(250,cae);
    rotate(angulo);
    fill(random(200),(0),(0));
     rect(-50,-30,150,150);
     fill((0),(0),random(255));
  ellipse(-175,60,50,50);

  angulo=angulo+0.1;
  cae=cae+2;
  }

}

