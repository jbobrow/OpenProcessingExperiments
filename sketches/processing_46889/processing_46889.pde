

PImage img1,img2,img3,img4;

void setup(){
  

size(560,600);
background(245,245,245);
 


}

void draw(){
  
  for (int x=0; x<600; x=x+10)
{
  
  for (int y=0; y<600; y=y+10)
  {
// fill(random(255),random(255),random(255)); 
 rect( x,y,10,10);
 


 
  }
}
  
img2=loadImage("123.jpg");
img1=loadImage("Paper0034_S.jpg");
img3=loadImage("amar.png");
img4=loadImage("boca.png");


tint(90,100,90,245);
image(img2,20,20,560,560);
tint(140,200,90,70);  
image(img1,20,20,560,560);
tint(140,200,90);  
image(img3,30,350,500,200);


 // fill(0,1);
//rect(pmouseX,pmouseY,0,0);
// fill(245);
// fill(random(255),random(255),random(255)); 
//text("AMEmais    VIVAmais",pmouseX,pmouseY);
}
void mousePressed(){
//tint(random(255),random(255),random(255));
image(img4,mouseX,mouseY); 

 
  
}
  
  
  

