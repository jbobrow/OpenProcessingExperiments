
class Ball
{
   float x = random(width/4,3*width/4);
   float y = random(height/4,3*height/4);
   float s = random(5,30);
   float dx = random(-3,3);
   float dy = random(-3,3);
   
   int red;
   int green;
   boolean blocked=false;
   public Ball()
   {
      //this.x = 30;
     // this.y = 20;
      //this.s=20;
      //this.dx = 3;
      //this.dy = 3;
   }
   public void move()
   {
      
       this.x = this.x+ this.dx;
       this.y = this.y+ this.dy;
       if(this.x-this.s/2 < 0 || this.x+this.s/2 >= width)
       {
          
          this.dy += int(random(-3,3));
          this.dy = max(this.dy,-3);
          this.dy = min(this.dy,3);
          this.dx *= -1;
          draw(255);
         
       }
       if(this.y-this.s/2 < 0 || this.y+this.s/2 >= height)
       {
          
          this.dx += int(random(-3,3));
          this.dx = max(this.dx,-3);
          this.dx = min(this.dx,3);
          this.dy *= -1;
          draw(255);
       }
       
   }
   public void draw()
   {
       pushStyle();
       fill(0);
       stroke(red,255-red,0);
       ellipseMode(CENTER);
       ellipse(this.x, this.y, this.s, this.s);
       red=0;
       popStyle();
       if(!blocked)
       {
         move();
       }
       if(mousePressed && dist(mouseX,mouseY,this.x,this.y)<=this.s)
           {
              this.blocked = !this.blocked;
           }
   }
   public void draw(int col)
   {
       pushStyle();
       fill(col);
       ellipseMode(CENTER);
       ellipse(this.x, this.y, this.s, this.s);
       popStyle();
   }
}

