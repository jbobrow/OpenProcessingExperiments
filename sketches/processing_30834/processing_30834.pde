
import processing.opengl.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer player;
FFT fftLin;
FFT fftLog;

//player
  float playLen;
  float playPos;
  float volume;
  float seite;
  float h;
  float b;
  float hr;
  float xfen;
  float zfen;
  
  //durchschnittslautstärke
  float duvolume = 0;
  float duvol = 0;
  //durchschnittsbass
  float dubass = 0;
  float duba = 0;
  //kamera  
  float cam;
  float camX = 0;
  float camY = 0;

  //farbwechsel
  float r = 200;
  float g = 200;
  float bl = 200;
  float rback = 100;
  float gback = 100;
  float blback = 100;


void setup(){
  //size(screen.width,screen.height,OPENGL);//P3D);
    size(900,500,OPENGL);//P3D);
  background(rback,gback,blback);
  smooth();
  noFill();
  strokeWeight(0.2);
  stroke(150);

  

            
    minim = new Minim (this);
    player = minim.loadFile ("test6.mp3");
    player.play ();
  
    fftLin = new FFT(player.bufferSize(), player.sampleRate());
    fftLin.linAverages(40);
    fftLog = new FFT(player.bufferSize(),player.sampleRate());
    fftLog.logAverages(22,3);

    hint(DISABLE_DEPTH_TEST);
}



void draw(){

    noLights();
    noCursor();

    //player
      volume = player.mix.level();
      playPos = player.position();
      playLen = player.length();
      
      duvolume = (duvolume + volume);
      duvol = duvolume/frameCount*500;
      dubass = (dubass + b);
      duba = dubass/frameCount;
      
      
    //architektur  
      seite = playLen;
      //ruhige höhe
      h = (-1)*(playPos/playLen)*120;
      //bass
      b = fftLog.getAvg(5)/5;
      //noise Höhe für Beziers
      noiseSeed(500);
      hr = (-1)*noise(0,h)*(-h*2);
      
      //Kamera
      cam = map(camX,0,width,-duvol,duvol*2);
      camera(cam, -250+camY, camX*duvol/(width/6), duvol/2, h, duvol/2, 0, 1, 0);

      if(mousePressed) {
        camX = mouseX;
        camY = mouseY;
        cursor(CROSS);
      }
      
      //Farbwechsel
      if(key=='1'){
              rback=12; gback = 73; blback = 98;
       r=163; g=202; bl=220;
      }
      if(key=='2'){
       rback=145; gback = 0; blback = 17;
       r=200; g=200; bl=200;
      }
       if(key=='3'){
       rback=228; gback = 169; blback = 39;
       r=50; g=50; bl=50;
       strokeWeight(0.1);
       }
       if(key=='4'){
       rback=20; gback = 20; blback = 25;
       r=163; g=202; bl=220;
      }
       if(key=='5'){
       rback=255; gback = 170; blback = 80;
       r=90; g=177; bl=206;
      }   
       if(key=='6'){
       rback=0; gback = random(20,35); blback = random(10);
       r=0; g=random(200,255); bl=0;
      }   
      
    //anfangsfading, wird weniger
    if(h>-(playLen/5000)){
    fill(rback,gback,blback,(playLen/5000)+h);
    noStroke();
    box(1000);
    }

    

    
  //FFT
  fftLog.forward(player.mix);
  for(int i=0; i<fftLog.avgSize();i++){

  if(frameCount % 30==1||b>=duba*6) {
 
  //Hauswände
  stroke(r,g,bl,volume*10*random(3)+b/2);

  bezier(0,hr,0,-b,hr,duvol/3,-b,hr,2*duvol/3,0,hr,duvol);
  bezier(0,hr,duvol,duvol/3,hr,duvol+b,2*duvol/3,hr,duvol+b,duvol,hr,duvol);
  bezier(duvol,hr,0,duvol+b,hr,duvol/3,duvol+b,hr,2*duvol/3,duvol,hr,duvol);
  bezier(0,hr,0,duvol/3,hr,-b,2*duvol/3,hr,-b,duvol,hr,0);

  }

  //Hausdach

  if(frameCount % 5==1) {

  stroke(r,g,bl,volume*10*random(5)+b/3);
    bezier(0+volume*50,hr-volume*50,0+volume*50,-b/10+volume*50,hr-volume*50,(duvol+volume*50)/3,-b/10+volume*50,hr-volume*50,2*(duvol-volume*50)/3,0+volume*50,hr-volume*50,duvol-volume*50);
    bezier(0+volume*50,hr-volume*50,duvol-volume*50,(duvol+volume*50)/3,hr-volume*50,(duvol-volume*50)+b/10,2*(duvol-volume*50)/3,hr-volume*50,(duvol-volume*50)+b/10,duvol-volume*50,hr-volume*50,duvol-volume*50);
    bezier(duvol-volume*50,hr-volume*50,duvol-volume*50,(duvol-volume*50)+b/10,hr-volume*50,2*(duvol-volume*50)/3,(duvol-volume*50)+b/10,hr-volume*50,(duvol+volume*50)/3,duvol-volume*50,hr-volume*50,0+volume*50);
    bezier(0+volume*50,hr-volume*50,0+volume*50,(duvol+volume*50)/3,hr-volume*50,-b/10+volume*50,2*(duvol-volume*50)/3,hr-volume*50,-b/10+volume*50,duvol-volume*50,hr-volume*50,0+volume*50);
  }
 
  }
  //Hausfenster
  if(frameCount % 10==1) {
    stroke(r+50,g+50,bl+50,volume*100*random(5));
      xfen = random(0,duvol);
      zfen = random(0,duvol);
      line(xfen,(-1)*random((-hr/5),-hr),0,xfen,(-1)*random((-hr/5),-hr),0);
      line(duvol,(-1)*random((-hr/5),-hr),zfen,duvol,(-1)*random((-hr/5),-hr),zfen);
      line(xfen,(-1)*random((-hr/5),-hr),duvol,xfen,(-1)*random((-hr/5),-hr),duvol);
      line(0,(-1)*random((-hr/5),-hr),zfen,0,(-1)*random((-hr/5),-hr),zfen);
 
  }
  println(b);
    println(duba);
     //save("ordner1/musicFrame" + frameCount + ".png");
    
}

//clear Screen
void keyPressed(){
      if(key=='c'){
    fill(rback,gback,blback,255);
    noStroke();
    box(1000);
    }
    //Screenshot
    if(key=='s'){
      save("screenshots/shot" + frameCount + ".png");
    }
}



