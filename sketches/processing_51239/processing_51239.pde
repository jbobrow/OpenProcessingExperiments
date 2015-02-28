
//Homework Number 4
//Copyright Daniel C Lee February 2012

float r,g,b;
float xPos, yPos;
float x, y, w, h, q;
float space;

void setup(){
size(700, 400);
background(255);
x=100;
y=100;
w=30;
h=30;
space=dist(mouseX, mouseY, x, y);
}

void draw(){
 noStroke();
 //fill(255);
 //rect(0, 0, width, height);
 r=random(255);
 g=random(255);
 b=random(255);
 q=random(50,350);
 

}

void mousePressed(){
 fill(0);
 rect(mouseX, mouseY, w, h);
}
 
void keyPressed()
{
  if(keyCode==' ')
    background(r,g,b);
    {
      if(keyCode==UP)
      {
      //translate(mouseX,mouseY);
      mouseY = mouseY-10;
      rect(mouseX,mouseY, w, h);
      fill(r,g);
      {
        //if(keyCode ==DOWN)
        //{
        //rect(q,q, w*2, h*2);
        //fill(r,g);
        //}
      }
    }
   }  
   //saveFrame("Hw4.jpg");
}



