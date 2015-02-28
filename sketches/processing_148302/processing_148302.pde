
PImage pic;

float cowX=490;
float cowY= -2423;

void setup()
{
size(800,500); 
background(34,226,242); 
quad(1,440,50,440,50,500,1,500); 
fill(129,66,59);
quad(50,400,80,400,80,500,50,500); 
fill(214,227,133);
quad(200,375,230,375,230,500,200,500); 
fill(44,3,1);
quad(550,350,600,350,600,500,550,500); 
fill(155,156,160);
pic = loadImage("cow.jpg");

}
void draw()
{
background(34,226,242);
fill(90,84,84);
strokeWeight(5);
stroke(0);
ellipse(mouseX,mouseY, 200,100);  
fill(100,255,0);
ellipse(mouseX,mouseY-20,50,100);
quad(1,440,50,440,50,500,1,500); 
fill(129,66,59);
quad(50,400,80,400,80,500,50,500); 
fill(214,227,133);
quad(200,375,230,375,230,500,200,500);  
fill(44,3,1);
quad(550,350,600,350,600,500,550,500); 
fill(155,156,160);
  image(pic,cowX,cowY);

} 
void mousePressed() 
{ 
  strokeWeight(10);
  stroke(0,255,0);
  line(random(600),700,mouseX,mouseY+55); 
} 

void keyPressed() 
{ 
cowX=random(width);
cowY=random(height);
}



