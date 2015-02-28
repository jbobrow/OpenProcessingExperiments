

int x = 10;
int y = 150;
int speed = 30;

void setup () {
   size (400,400);
   frameRate(1);
  
}

void draw () {
   
  background(255);
  stroke(0);
  line(x-500,y+100,x+500, y+100);
   stroke(0);//head
   fill(127,150,150,20);
   ellipse(x,y,40,40);//face
   
   fill(300,260,0,180);
   ellipse(x-38,y-5,40,40);
   
   fill(300,260,0,130);
   ellipse(x-23,y-30,40,40);
   
   fill(280,220,0,120);
   ellipse(x+8,y-32,36,36);
   
   fill(280,180,0,100);
   ellipse(x+28,y-15,26,26);
   
   fill(280,180,0,70);
   ellipse(x+29,y+7,22,22);
   
   fill(300,260,0,130);
   ellipse(x-25,y+25,40,40);
   
   fill(280,180,0,100);
   ellipse(x+4,y+32,26,26);
   
   fill(280,180,0,70);
   ellipse(x+21,y+23,21,21);
   
   ellipse(x+5,y-5,10,10);//eye
   
   fill(0);
   ellipse(x+5,y-5,4,4);//eye
   
   fill(250,0,40,100);
   triangle(x,y+5,x+10,y+15,x+15,y+5);//mouth
   
   stroke(50,255,50,255);//body
   strokeWeight(1.2);
   line(x-8,y+40,x-8,y+76);
   line(x-8,y+76,x-31,y+99);
   line(x-8,y+76,x+13,y+81);
   line(x+13,y+81,x-3,y+96);
   x+=10;
  
}


