
import ddf.minim.*;

Minim minim;
AudioInput in;
PVector centro; 
PVector pos, pos2;
//PVector pos3, pos4;
//float radio2 = 50;
float radio = 150;
float incR =0;

void setup()
{
  size(800, 600);

  minim = new Minim(this);
  colorMode(HSB, 360, 100, 100, 100);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  centro = new PVector(width/2, height/2, -2000 );
  pos = new PVector(0, 0, 0);  
  pos = new PVector(0, 0, 0); 
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  // in.enableMonitoring();
}

void draw()
{
  fill(0, 0, 0, 25);
  noStroke();
  rect(0, 0, width, height);

  incR = map (mouseX,0,width,0.001,1);

  stroke(255);

  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 150 + in.left.get(i)*50, i+1, 150 + in.left.get(i+1)*50 );
    line( i, 450 + in.right.get(i)*50, i+1, 450 + in.right.get(i+1)*50 );
  }
  for (int a = 0; a < in.bufferSize() -1; a++) {

    PVector pos2 = new PVector(0, 0, 0);
    
    float angulo1 = a*(TWO_PI/in.bufferSize());
    float angulo2 = (a+1)*(TWO_PI/in.bufferSize());
    float r1 = (radio+50*in.left.get(a));
    float r2 = (radio+50*in.left.get(a+1));

    pos.x = centro.x + r1*cos(angulo1);
    pos.y = centro.y + r1*sin(angulo1);
    pos2.x = centro.x + r2*cos(angulo2);
    pos2.y = centro.y + r2*sin(angulo2);




    stroke(360*abs(in.left.get(a)), 100, 100, 50);  
    strokeWeight(2);
    line (pos.x, pos.y, pos2.x, pos2.y);
    
    radio -= incR;
    
    if (radio<0){
      radio = 200;
    }
    
    if (radio <0){
      radio = 200;
    }
   

  }
}



