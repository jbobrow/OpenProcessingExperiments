


int numballs=50;
int diam=50;
float [] xpos= new float[numballs];
float [] ypos= new float[numballs];
float [] ballsize= new float[numballs];
float [] speedx= new float[numballs];
float [] speedy= new float[numballs];

/* suppose want to assign each element's color RGB
float [] r= new float[numballs];
float [] g= new float[numballs];
float [] b= new float[numballs];
float [] alpha= new float[numballs];
*/

void setup() {
  size(1000, 1000);
  background(50);
  noStroke();
  smooth();
  frameRate(30);
  for (int i=0; i<numballs; i++) {
    ballsize[i]=random(10, 50);
    xpos[i]=random(ballsize[i], width-ballsize[i] );
    ypos[i]=random(ballsize[i], height-ballsize[i] );
    speedx[i]=random(10, 40);
    speedy[i]=random(10, 40);
    println( xpos[i]+","+ ypos[i]) ;
    println(ballsize[i]) ;
  }


  //no variable
}
void draw() {
  background(204);

  //draw 
  for (int i=0;i<numballs;i++) {
    ellipse (xpos[i], ypos[i], ballsize[i], ballsize[i]);

    xpos[i]+= speedx[i];
    ypos[i]+= speedy[i];

    if (xpos[i]>=width-ballsize[i]) {
      speedx[i]*=-1;
    }
    else if (xpos[i]<=ballsize[i]) {
      speedx[i]*=-1;
    }
    if ( ypos[i]>=height-ballsize[i]) {
      speedy[i]*=-1;
    }
    else if ( ypos[i]<=ballsize[i]) {
      speedy[i]*=-1;
    }

    if (mousePressed) {  
      fill(random(155, 255), 0, 0, random(155, 255)); 

    }else {
      fill(0, random(155, 255), random(155, 255), random(155, 255));
    }
    
  }


  ///////font area
  PFont font;
  font = loadFont("AppleGothic-72.vlw"); 
  fill(0, 102, 153);
  text("Press mouse to change color ", width/2-100, height/2-50);

  
}


