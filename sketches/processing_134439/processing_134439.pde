
void setup()
      {
        size(300,500);
        background(135,206,235);
      }
       int speed=10;
       int y=100;
       int x=100;
       stroke(255);
       strokeWeight(5);
       line(150,0,150,400);
      // float r=random(400);
void draw()
      {
        yoyo();
      }
void yoyo()
      {
        
        frameRate(30);
        background(135,206,235);
        stroke(255);
        strokeWeight(5);
        line(150,0,150,y);
        noStroke();
        smooth(); 
        fill(220,20,60);
        ellipse(160,y,100,100);
        fill(255,255,255,50);
        ellipse(155,y,100,100);
        fill(220,20,60);
        ellipse(150,y,100,100);
       
        y=y+speed;
        
       
 
        if ((y<100)||(y>400))
        {
               speed=speed*-1;
        }
        
      }
