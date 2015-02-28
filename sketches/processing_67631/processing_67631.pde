



  

PImage img;

void setup(){
  size(400,400);
img= loadImage("autumn leaves.jpg");
  
}
void draw(){
  image(img,0,0);

  fill(#ED9F0E);
  
quad(100,140,10,230,110,360,280,400);
fill(#936613);
quad(70,170,45,195,200,390,250,400);
    fill(#ED9F0E);
rect(100,100,200,200);
rect(110,310,180,250);
fill(#936613);
triangle(100,100,300,100,200,200);
triangle(100,100,120,59,140,100);
triangle(260,100,280,59,300,100);
fill(255);
ellipse(140,200,50,50);
ellipse(260,200,50,50);
fill(#2C1105);
ellipse(140,200,40,40);
ellipse(260,200,40,40);
line(180,260,200,280);
line(200,280,220,260);




}


