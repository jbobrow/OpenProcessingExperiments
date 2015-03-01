
int num = 180;
float [] xpos = new float [num];
float [] ypos = new float [num];

float linePos = 0;
float angle = 0;
float [] acceleration;
float [] xspeed;
float [] yspeed;
PVector [] ball;

 
void setup ()
{
  size (600, 600);
  smooth();
  acceleration = new float[num];
  yspeed = new float[num];
  xspeed = new float[num];
  ball = new PVector [num];
  setRandomPositions (ball);
}

void setRandomPositions(PVector [] p){
  
  for (int i = 0; i < p.length; i++){
     acceleration[i] = random(4, 8);
     yspeed[i] = random(-5, 5);
     xspeed[i] = random(-1, 1);
     PVector pos = new PVector (random (30,570), random(100,500));
     p [i] = pos;
   
  }
} 

void draw ()
{
  background (255);
  stroke(0,20);
  strokeWeight (10);
  drawValues();
  drawConnections();
}

void drawConnections ()
{
  for (int i = 0; i < ball.length; i++){
      float x1 = ball[i].x;
      float y1 = ball[i].y;
      for (int j = 0; j < ball.length; j++){
        float x2 = ball[j].x;
        float y2 = ball[j].y;
        
        float distance = dist (x1, y1, x2, y2);
        if (distance > 0 && distance < 150)
        {
            float m = map(distance, 40, 150, 100, 0);
            float s = map(distance, 20, 150, 0.5, 0);
            stroke (0, m);
            strokeWeight (s);
            line (x1, y1, x2, y2);
        }

    }
  }
}

void drawValues ()
{
  for (int i = 0; i< ball.length; i++)
  {
    ball[i].y += yspeed[i];
    ball[i].x += xspeed[i];
    float x = ball[i].x;
    float y = ball[i].y;
    
    //Down
    if(yspeed[i] > 0){
      if(y <= 300){
        float s = map(y, 0, 300, 0, acceleration[i]);
        float a = map(y, 40, 100, 30, 100);
        yspeed[i] = s;
        addBall(x,y,a);
      }else{
        float s = map(y, 300, 600, acceleration[i], 0);
        float a = map(y, 500, 560, 100, 60);
         yspeed[i] = s;
         addBall(x,y,a);
      }
    }
    //Up
    if(yspeed[i] < 0){
      if(y <= 300){
        float s = map(y, 40, 300, 0, -acceleration[i]);
        float a = map(y, 40, 100, 30, 100);
        yspeed[i] = s;
        addBall(x,y,a);
      }else{
        float s = map(y, 300, 560, -acceleration[i], 0);
        float a = map(y, 500, 560, 100, 60);
        yspeed[i] = s;
        addBall(x,y,a);
      }
    }
    
    if(y <= 50 ){
        yspeed [i] *= -1;
        ball[i].y += 0.1;
        acceleration[i] = random(4, 8);
    }else if(y >= 550){
        yspeed [i] *= -1;
        ball[i].y -= 0.1;
        acceleration[i] = random(4, 8);
    }
    if(x <= 30 ){
        xspeed [i] *= -1;
        ball[i].x += 0.1;
    }else if(x >= 570){
        xspeed [i] *= -1;
        ball[i].x -= 0.1;
    }
  }
}

void addBall(float bx,float by, float ba){
    pushMatrix();
    fill (0,ba);
    noStroke();
    ellipse (bx, by, 4, 4);
    popMatrix(); 
}
 
 





