
import ddf.minim.*;

int h;
int w;

Minim minim;
AudioInput in;
float volume = 0;
float volumeF = 0; 

//-------------------------------------
void setupAudio(){
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 512);
}
 
//-------------------------------------
void getVolume(){
  volumeF = in.right.level()*1000;
  volume = 0.8*volume + 0.2*volumeF;
}

void setup() {  
  setupAudio();
  size(400, 400);
  h = height;
  w = width;
}

void draw() { 
  background(255);
  strokeWeight(10);
  fill(255);
  ellipse(w/2, h/2, w*2/3, h*2/3);
  line(w/3, h*2/3, w*2/3, h*2/3);
  float exl = w*2/5;
  float exr = w*3/5;
  float ey = h/2;
  float dxl = constrain((mouseX-exl)/20, -20, 20);
  float dxr = constrain((mouseX-exr)/20, -20, 20);
  float dy = constrain((mouseY-ey)/20, -20, 20);
  ellipse(exl+dxl, ey+dy, 20, 20);
  ellipse(exr+dxr, ey+dy, 20, 20);
  
  if(mousePressed == true) { 
    background(20, 200, 50);
    //draw excited background
    fill(255, 255, 10);
    strokeWeight(1);
    triangle(w*2/3,10, w*2/3,370, 30,w*2/3);
    triangle(20,20, 390,h/2, w/3,370);
    //draw head
    fill(255);
    strokeWeight(10);
    ellipse(w/2, h/2, w*2/3, h*2/3);    
    //draw mouth
    getVolume();
    float Y = map(volume, 0, 50, 40, 120);
    fill(200, 0, 0);
    arc(w/2, h*2/3-45, w/3, Y, 0, PI);
    fill(255);
    rect(w/3, h/2, w/3, 20);  
    //draw hand
    rect(275, 275, 75, 100);
    rect(350, 275, -25, -50);
    for (int i=0; i<=3; i++) {
    line(275, 275+(25*i), 325, 275+(25*i));    
    //draw eyes
    arc(w*3/5, h/3+30, 40, 40, PI, TWO_PI);
    arc(w*2/5, h/3+30, 40, 40, PI, TWO_PI);
    }
  }
}

//-------------------------------------
void stop(){
  in.close();
  minim.stop();
  super.stop();
}
