

int count = 20;
float[] xpos = new float[count];
float[] ypos = new float[count];
float[] size1 = new float[count];
float[] size2 = new float[count];

float rectX = 350;
float rectY = 0;
float speed = 0;
float gravity = 0.1;

float cloudspeed = 0;



void setup() {

  size(700, 400);
  background(0); 
  smooth();

  int i=0;
  while ( i < count) {
    
    
    xpos[i] = random(50, 140);
    ypos[i] = random(100, 120); 
    size1[i] = random(40, 60); 
    size2[i] = random(40, 60);
    
    i++;
  }
  
 
  
}




void draw() {

  background(0);
  fill(255);
  noStroke();

  int i=0;

  while ( i < count) {
    ellipse(xpos[i]+cloudspeed, ypos[i], size1[i], size2[i]); 
    ellipse(xpos[i]+170+cloudspeed, ypos[i], size1[i], size2[i]);
    ellipse(xpos[i]+340+cloudspeed, ypos[i], size1[i], size2[i]);
    ellipse(xpos[i]+510+cloudspeed, ypos[i], size1[i], size2[i]);

    xpos[i] = xpos[i]+1;
    if (xpos[i] > 200) {
      xpos[i] = 0;
    }
    
    i++;
  } 





  //clouds:
  /*
  ellipse(xpos[0],100,50,40);
   ellipse(xpos[1],80,50,50);
   ellipse(xpos[2],80,50,50);
   ellipse(xpos[3],100,60,50);
   ellipse(xpos[4],100,50,40);
   */


  stroke(0);
  fill(219, 187, 121);
  rect(rectX, rectY, 10, 10);

  rectY = rectY+speed;
  speed = speed+gravity;


  if (rectY > 350) {

    speed = speed*-0.98777;
  }
}


