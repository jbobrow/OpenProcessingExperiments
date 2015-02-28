
import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer groove;
AudioSample kick;
AudioSample snare;

float a=0;
float b=0;
float c=0;
int r = 250;
int z = 0;
float ax, ay, bx, by, cx, cy, rd;
int s =50;
int t =90;
int count=0; 


void setup() {
  size(1680 , 1000, P3D);
  background(0);
  
  minim = new Minim(this);
  groove = minim.loadFile("01.mp3");
  kick = minim.loadSample( "voice_angry.mp3" );
  snare = minim.loadSample("voice_stoptouching.mp3");
  groove.loop();
  noFill();
  noCursor();
 /*
  pushMatrix();
  fill(0);
  translate(width/2,height/2,-295);
  rect(0,0,width,height);
   translate(0,0,0);
  popMatrix();
  */
  
}

void draw() {

  camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2+random(-2, 2), height/2+random(-3, 4), z+random(-3, 4));
  background(0);


  
  for (int i=1; i < 49; i++) {

    a = PI*i/24;
    b = PI*(i+1)/24;
    c = PI*(i+2)/24;

    rd = random(10);

    ax = r*cos(a);
    bx = r*cos(b);
    cx = r*cos(c);

    ay = r*sin(a);
    by = r*sin(b);
    cy = r*sin(c);


    rotateX(PI/4);
    strokeWeight(random(0.5,1));

    //  stroke(255, 0, 0, 80);
    stroke(125, 0, random(125, 255));

  /*  
    for (int k =1; k < 65; k++) {
      rotateX(k*PI/32);
      bezier(ax+rd, ay+rd, (r-(mouseX/7))*cos(a)+rd, (r-(mouseX/7))*sin(a)+rd,(r-(mouseX/7))*cos(b)+rd, (r-(mouseX/7))*sin(b)+rd, bx+rd, by+rd);
    }  
  
      for (int j =1; j < 65; j++) {
      rotateY(j*PI/32);
      bezier(ax+rd, ay+rd, (r-(mouseX/7))*cos(a)+rd, (r-(mouseX/7))*sin(a)+rd, 
      (r-(mouseX/7))*cos(b)+rd, (r-(mouseX/7))*sin(b)+rd, bx+rd, by+rd);
    }
  }  
 
     */
    
      for (int k =1; k < 65; k++) {
      rotateX(k*PI/32);
      bezier(ax+rd, ay+rd, (r-abs(mouseX-width/2)/7)*cos(a)+rd, (r-abs(mouseX-width/2)/7)*sin(a)+rd,(r-abs(mouseX-width/2)/7)*cos(b)+rd, (r-abs(mouseX-width/2)/7)*sin(b)+rd, bx+rd, by+rd);
    }   
    
     
   
    for (int j =1; j < 65; j++) {
      rotateY(j*PI/32);
      bezier(ax+rd, ay+rd, (r-abs(mouseX-width/2)/7)*cos(a)+rd, (r-abs(mouseX-width/2)/7)*sin(a)+rd, (r-abs(mouseX-width/2)/7)*cos(b)+rd, (r-abs(mouseX-width/2)/7)*sin(b)+rd, bx+rd, by+rd);
    }
  }
  

      if (mouseX>width/2-280 && mouseX<width/2+280 &&mouseY>height/2-280 && mouseY<height/2+180 ) {
      count++;
      println(count);
      z=z+2;
      if(z > 380) z= 380;
      
      if (count==80 || count==240 || count==400 || count==560 || count==720 || count==880) {
        kick.trigger();
       }
     
      else if (count==160 || count==320 || count==480 || count==640 || count==800) {
        snare.trigger();    
      }
    } else{  
     z=z-2;
     if (z<-300) z = -300;  
  }
  
  
     println(z);
}



void stop()
{
  // always close Minim audio classes when you finish with them
  groove.close();
  // always stop Minim before exiting
  minim.stop();

  super.stop();
}



