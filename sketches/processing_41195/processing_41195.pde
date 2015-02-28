
import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
SineWave sine;
AudioPlayer player[] = new AudioPlayer[11];

import JMyron.*;

JMyron m;//a camera object


float opac = 100;

float avX=0;
float avY=0;

Circle[] a = new Circle[14];

void setup(){
  size(700,400, P3D);
  background(255);
  m = new JMyron();//make a new instance of the object
  m.start(width,height);//start a capture at size
  m.trackColor(180,180,180,180*3-100);//track white
  m.update();
  m.adaptivity(10);
  m.adapt();
  ellipseMode(CENTER_DIAMETER);
  noStroke();
  noCursor();
  colorMode(HSB);


  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(415,0,out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);

  for(int n=0; n<player.length; n++) {
    String f = n+1+".wav";
    player[n] = minim.loadFile(f);
  }




  int i = 0;
  while(i < 14){
    a[i] = new Circle((50)*i,200,75);
    i++;
  }

}

void draw(){
  background(255);



  m.update();//update the camera view
  //drawCamera();


  int[][] centers = m.globCenters();//get the center points

    for(int i=0;i<centers.length;i++){
    avX += centers[i][0];
    avY += centers[i][1];
  }
  if(centers.length-1>0){
    avX/=centers.length-1;
    avY/=centers.length-1;

    float freq = map(avX, avY, width/2, 1000, 60);
    sine.setFreq(freq);
    float pan = map(avY, avY, width/2, -1, 1);
    sine.setPan(pan);

    int choice =  abs(int(map(avX, 0, width, 0, 10)));
    println(choice);

    if(choice > player.length-1) {
      choice = player.length-1;
    } else if(choice < 0){
      choice = 0;
    }
    
    if((frameCount % 2) == 0) {
      if(player[choice].isPlaying() ==false) {
        player[choice].loop(0);
      }
    }


    int i =0;
    while(i <14){
      noStroke();
      smooth();
      fill(0,0,0,0);
      ellipse(a[i].x, a[i].y, a[i].r, a[i].r);

      if(i > 0){
        intersect(a[0], a[i]);
      }
      i++;
    }
    
    float tx = (avX - a[0].x)/10;
    float ty = (avY - a[0].y)/10;
    
    a[0].x += tx;
    a[0].y += ty;
  }








}

class Circle 
{ 
  float x, y, r, r2; 

  Circle( float px, float py, float pr ) { 
    x = px; 
    y = py; 
    r = pr; 
    r2 = r*r; 
  } 
} 


void intersect( Circle cA, Circle cB ) { 

  float dx = cA.x - cB.x; 
  float dy = cA.y - cB.y; 
  float d2 = dx*dx + dy*dy; 
  float d = sqrt( d2 ); 

  if ( d>cA.r+cB.r || d<abs(cA.r-cB.r) ) return; // no solution 

    float a = (cA.r2 - cB.r2 + d2) / (2*d); 
  float h = sqrt( cA.r2 - a*a ); 
  float x2 = cA.x + a*(cB.x - cA.x)/d; 
  float y2 = cA.y + a*(cB.y - cA.y)/d; 

  noStroke();
  smooth();  

  float paX = x2 + h*(cB.y - cA.y)/d; 
  float paY = y2 - h*(cB.x - cA.x)/d; 
  float pbX = x2 - h*(cB.y - cA.y)/d; 
  float pbY = y2 + h*(cB.x - cA.x)/d; 


  fill(paX,paX,paX,abs(80));
  noStroke();
  ellipse( paX, paY, 15, 15 ); 
  ellipse( pbX, pbY, 15, 15 );

  stroke(paY,paY,paY,abs(80));



  int i = 0;
  strokeWeight(1);
  line(paX,paY + out.left.get(i), pbX, pbY + out.left.get(i));


}

void stop(){
  //player.close();
  out.close();
  minim.stop();
  super.stop();


}

void drawCamera(){
  int[] img = m.differenceImage(); //get the normal image of the camera
  loadPixels();
  for(int i=0;i<width*height;i++){ //loop through all the pixels
    pixels[i] = img[i]; //draw each pixel to the screen
  }
  updatePixels();
}



