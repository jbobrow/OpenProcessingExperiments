
void setup(){
  size(300,300);
  background(255);
 frameRate(50);
}

int x=0;

void draw(){
  rectMode(CENTER);
  fill(255,0,0);
  rect(width/2,250,40,100);
  x++;
if (x>100){
     rectMode(CENTER);
     fill(0,100,0);
  rect(width/2,250,40,100);
}

if (x>150){
  fill(x,29,255);
  ellipse(width/2,x-150,20,20);
}
if(x>300){
  fill(255,0,0);
  ellipse(width/2,250,x-150,x-150);
}
if (x>401){
//background(0,0,255);
background (RGB,500);
fill(200,x,x-300);
ellipse(width/2,height,width,height);
fill(x,x,x-300);
ellipse(width/2,height,width/2,height/2);
 noLoop();
}

}

















