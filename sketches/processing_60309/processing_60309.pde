
int sx;
int sy;
int ss;
int sa;

void setup(){
  size(320,240);
  frameRate(20);
  background(0);
}

void draw(){
  sx=int(random(0,width));
  sy=int(random(0,height));
  ss=int(random(10,60));
  sa=int(random(0,360));
  star(sx,sy,ss,sa);
  star(sx+random(width/2),sy-random(height/2),ss+random(10),sa);
  star(sx-random(width/4),sy+random(height/3),ss-random(10),sa);
}

void star(float cx, float cy, float w, float startAngle){ //http://processing.org/learning/anatomy/ adapted
    float angle = TWO_PI/ 10;  // twice as many sides
    float dw; // draw width
    float dh; // draw height
    float h=w*3/4;
    
    w = w / 2.0; 
    h = h / 2.0;

    noStroke();
    smooth();
    fill(random(255),random(255),random(255)); //by setting random colors you get the impression of shining stars
   
    beginShape();
    for (int i = 0; i < 10; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * 0.4;
        dh = h * 0.4;
      }
      vertex(cx + dw * cos(radians(startAngle) + angle * i),
        cy + dh * sin(radians(startAngle) + angle * i));
    }
    endShape(CLOSE);
  }

