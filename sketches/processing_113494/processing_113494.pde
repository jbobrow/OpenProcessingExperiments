
import ddf.minim.*;

Minim minim;
AudioInput in;
PVector centro; 
PVector pos, pos2;
PVector pos3, pos4;
float radio2 = 50;
float radio = 150;

void setup()
{
  size(800, 600);

  minim = new Minim(this);
  colorMode(HSB, 360, 100, 100, 100);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  centro = new PVector(width/2, height/2, -2000 );
  pos = new PVector(0, 0, 0);  
  pos2 = new PVector(0, 0, 0); 
  pos3 = new PVector(0, 0, 0);  
  pos4 = new PVector(0, 0, 0); 
  // uncomment this line to *hear* what is being monitored, in addition to seeing it
  // in.enableMonitoring();
}

void draw()
{
  fill(0, 0, 0, 25);
  noStroke();
  rect(0, 0, width, height);

  stroke(255);

  // draw the waveforms so we can see what we are monitoring
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 150 + in.left.get(i)*50, i+1, 150 + in.left.get(i+1)*50 );
    line( i, 450 + in.right.get(i)*50, i+1, 450 + in.right.get(i+1)*50 );
  }
  for (int a = 0; a < in.bufferSize() -1; a++) {

   
    float angulo1 = a*(TWO_PI/in.bufferSize());
    float angulo2 = (a+1)*(TWO_PI/in.bufferSize());
    float r1 = (radio+50*in.left.get(a));
    float r2 = (radio+50*in.left.get(a+1));
    float r3 = (radio2+50*in.right.get(a));
    float r4 = (radio2+50*in.right.get(a+1));

    pos.x = centro.x + r1*cos(angulo1);
    pos.y = centro.y + r1*sin(angulo1);
    pos2.x = centro.x + r2*cos(angulo2);
    pos2.y = centro.y + r2*sin(angulo2);

    pos3.x = centro.x + r3*cos(angulo1);
    pos3.y = centro.y + r3*sin(angulo1);
    pos4.x = centro.x + r4*cos(angulo2);
    pos4.y = centro.y + r4*sin(angulo2);


    stroke(360-360*abs(in.left.get(a)), 100, 100, 50);  
    strokeWeight(2);
    line (pos.x, pos.y, pos2.x, pos2.y);
   
    stroke(175-175*abs(in.right.get(a)), 100, 100, 50);  
    strokeWeight(2);
    line (pos3.x, pos3.y, pos4.x, pos4.y);
  }
}



