
 boolean start=true;
 float k=0.1;
 float colour=255;
void setup(){
 background(255); 
 size(1500,500);
 frameRate(5);

}
static class count
{
    static int j=0; 
}
void draw(){
 
 
  if(start){
   background(colour); 
  translate(width/2,height/2); 
 
  for(int i =count.j;i<360;i++){
  fill(random(i),random(20),random(i));
  stroke(10,150,100,5);
 
 ellipse(i,15,sin(radians(90))+random(10,20),cos(radians(200))+random(30,40));
  rotate(k);
 
  }
  if(count.j < 100)
  count.j+=10;
  else
  count.j=0; 
  }
}

/*void mouseClicked(){
 start=!start;
}*/
void mouseDragged(){
 float distX=(float)mouseX/(float)width;
distX*=3;
k=distX;
//println("k........."+k);
float distY=(float)mouseY/(float)height;
distY*=100;
colour=distY+50;
}


