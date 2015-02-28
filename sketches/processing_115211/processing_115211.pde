
/*
Jeff Guo
Collage Engine
Oct 10 2013
All Rights Reserved
*/

int i;
PImage [] myImageArray=new PImage[9];


void setup(){
  size(800,800);
  background(255);
  smooth();
  noStroke();
   for (i = 1; i< myImageArray.length; i++ )
{
  myImageArray[i] = loadImage( i + ".jpg" ); 
}


  imageMode(CENTER);
  

}

void draw(){
  if (frameCount %10 ==0){
  fill (0);
  pushMatrix();
  translate(400,400);
  rotate(radians(frameCount *1%360));
  image(myImageArray[int(random(1,9))],0,250,50,250);
  popMatrix();
  
  fill(255);
  rect(370,0, 60,800);
  rect(0,370, 800,60);

}
}


