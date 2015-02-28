
//declare
PFont Impact;
int balls=1000;
int imagesC=100;
boolean state=true;
//PImage[] nics=new PImage[5];
//declare my arrays and their sizes
float [] xpos = new float[balls] ;
float [] ypos = new float[balls] ;
//float ypos;
int bsize;
float [] yspeed = new float[balls];
float [] xspeed = new float[balls];
float [] radius = new float[balls];
float [] trans = new float[balls];
int [] colorb = new int[balls];
float [] Ixpos = new float[imagesC] ;
float [] Iypos = new float[imagesC] ;
//float ypos;
int Ibsize;
float [] Iyspeed = new float[imagesC];
float [] Ixspeed = new float[imagesC];
float [] Iradius = new float[imagesC];
int [] Itrans = new int[imagesC];
int [] Icolorb = new int[imagesC];



PImage [] images = new PImage[imagesC];
float gravity;
float Igravity;


void setup() {
  Impact =loadFont("Impact-48.vlw");
  colorMode(HSB);
  //define in setup
  noStroke();
  size(500, 500);
  //place random values in my arrays for balls
  for (int i=0;i<balls;i++) {
    trans[i]=50;
    xpos[i]=int(random(0, 500));
    ypos[i]=int(random(0, 200));
    radius[i]=int(random(0, 30));
    xspeed[i]=int(random(0, 10));
    yspeed[i]=int(random(0, 10));
    colorb[i] =int(random(0, 500));
    gravity =1;
  }


  //place random values in my array for images

  for (int i=0;i<imagesC;i++) {
    images[i] = loadImage( i + ".jpg" );
    Itrans[i]=200;

    Iradius[i]=100;

    Ixpos[i]=int(random(0, 500));
    Iypos[i]=int(random(0, 200));
    Ixspeed[i]=int(random(0, 10));
    Iyspeed[i]=int(random(0, 10));
    gravity =1;
  }
}
//start draw
void draw() {
  
  println(state);

  //b button pressed run balls program
  if (state==false) {
    background(200,150,178);
    textSize(20);
     fill(0, 255, 0);
     //write my text
     text("click objects to erase", 20, 20);
    text("drag object to pick up", 20, 40);
    text("'S' to switch modes", 20, 60);
    text("'R' to reset", 20, 80);
//draw all my balls with diffrent array values
    for (int i=0;i<balls;i++) {
      fill(colorb[i], 255, 255, trans[i]);
      ellipse(xpos[i], ypos[i], radius[i], radius[i]);
//add speed and gravity
      yspeed[i]=yspeed[i]+gravity;
      ypos[i]=ypos[i]+yspeed[i];


//reduce speedy if wall is hit
      if (ypos[i]>height-radius[i]/2) {
        
        yspeed[i]=yspeed[i]*-0.95;
        // xspeed=xspeed+gravity;
      }
//reduce speedy if left wall is hit

      if (ypos[i]<0+radius[i]/2) {
        yspeed[i]=-yspeed[i];
      }

      //restrain x
      xpos[i]=xpos[i]+xspeed[i];
      if (xpos[i]>width-radius[i]/2) {
        xspeed[i]=-xspeed[i];
      }

      if (xpos[i]<0+radius[i]/2) {
        xspeed[i]=-xspeed[i];
      }
//reduce speedy if height is reached is hit

      if (ypos[i]>height-radius[i]/2) {
        ypos[i]=height-radius[i]/2;
        //reduce speedx
        xspeed[i]=xspeed[i]*.9;
      }
      if (xpos[i]>width-radius[i]/2) {
        xpos[i]=width-radius[i]/2;
      }
    }
  }


  //if state is toggled move to this section below


  if (state==true) {
    
    
    background(140,200,178);
    
    textSize(20);
     fill(0, 255, 0);
     text("click objects to erase", 20, 20);
    text("drag object to pick up", 20, 40);
    text("'S' to switch modes", 20, 60);
    text("'R' to reset", 20, 80);
    //draw all images
    
    //draw all my inages from array and give transparance
    for (int i=0;i<imagesC;i++) {
      tint(255, Itrans[i]);
      image(images[i], Ixpos[i], Iypos[i]);
//add speed and gravity
      Iyspeed[i]=Iyspeed[i]+gravity;
      Iypos[i]=Iypos[i]+Iyspeed[i];


//add limits top right left and down... reduce speed when walls are hit
      if (Iypos[i]>height-Iradius[i]/2) {
        //reduce speedy
        Iyspeed[i]=Iyspeed[i]*-0.95;
      }

      if (Iypos[i]<0+Iradius[i]/2) {
        Iyspeed[i]=-Iyspeed[i];
      }

      //restrain x
      Ixpos[i]=Ixpos[i]+Ixspeed[i];
      if (Ixpos[i]>width-Iradius[i]/2) {
        Ixspeed[i]=-Ixspeed[i];
      }

      if (Ixpos[i]<0+Iradius[i]/2) {
        Ixspeed[i]=-Ixspeed[i];
      }

      if (Iypos[i]>height-Iradius[i]/2) {
        Iypos[i]=height-Iradius[i]/2;
        //reduce speedx
        Ixspeed[i]=Ixspeed[i]*.9;
      }
      if (Ixpos[i]>width-Iradius[i]/2) {
        Ixpos[i]=width-Iradius[i]/2;
      }
    }
  }
}



//mouse drag erases by setting transition to 0

//erase balls on drag

void mouseClicked() {
  //mouse must be on target to each object to erase
  for (int i=0; i<balls; i++) {
    if (dist(mouseX, mouseY, xpos[i], ypos[i])<radius[i]/2+50) {
      trans[i]=0;
    }
  }

    //mouse must be on target to each object to erase

  for (int i=0; i<imagesC; i++) {
    if (mouseX>Ixpos[i] && mouseX<Ixpos[i]+50 && mouseY>Iypos[i] && mouseY<Iypos[i]+50 ) {
      Itrans[i]=0;
    }
  }
}



void mouseDragged() {
  //picks up objects balls
  for (int i=0; i<balls; i++) {
        if (dist(mouseX, mouseY, xpos[i], ypos[i])<radius[i]/2+50) {

    xpos[i]=mouseX;
    ypos[i]=mouseY;
    }
  }
//picks up objecks images if mouse is in range and dragged
//inrease area to allow for movement of mouse
 for (int i=0; i<imagesC; i++) {
    if (mouseX>Ixpos[i] && mouseX<Ixpos[i]+200 && mouseY>Iypos[i] && mouseY<Iypos[i]+200 ) {
      Ixpos[i]=mouseX-25;
    Iypos[i]=mouseY-25;
    }
  }

}



//r to reset adds speed and transition to images and balls
void keyPressed() {
  if (key=='r' ||key=='R' ) {
    for (int i=0; i<balls; i++) {
      trans[i]=50;
      xspeed[i]=int(random(-20, 40));
      yspeed[i]=int(random(-20, 20));
    }


    for (int i=0; i<imagesC; i++) {
      Itrans[i]=200;
      Ixspeed[i]=int(random(-40, 40));
      Iyspeed[i]=int(random(-40, 40));
    }
  }
  //change speed and transparance of images
  if (key=='r' ||key=='R' ) {

    for (int i=0; i<imagesC; i++) {
      Itrans[i]=200;
      state=!state;
      Ixspeed[i]=int(random(-40, 40));
      Iyspeed[i]=int(random(-40, 40));
    }
  }
  //s key switches between modes

  if (key=='s' ||key=='s' ) {
    state=!state;
  }
}


