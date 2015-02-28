
ArrayList ball_list;

Ball myBall;

void setup(){
 size(600,300); 
 ball_list = new ArrayList();
 ball_list.add(new Ball());

 noStroke();
 smooth();
 frameRate(30);
}

void draw()
{
   background(255);
   fill(0);
   
   for(int i=ball_list.size()-1; i>=0; i--){
     Ball myBall = (Ball) ball_list.get(i);
     myBall.display();
     myBall.move();  
   }

}

class Ball {
  
  float r,g,b;
  float x;
  float y = 310;
  float speed = 20;
  float d = 1;
  int times = 0;
  
  Ball(){
     r = random(255);
     g = random(255);
     b = random(255);
     x = random(500); 
  }
 
  void move(){
    
    if((times < 3)){
    y = y - speed*d;
    speed = speed - 0.9*d;
      
        if((y > height)){
            d = d * - 1;       
            speed = speed * 0.8;
            times++;
        }      
    }

    else  
      y = y - speed * d * -1;
  

  }
  
  void display(){
     fill(r,g,b);    
     ellipse(x,y,40,40); 
  }     
}


void mousePressed(){
   ball_list.add(new Ball()); 
}




