
import ddf.minim.*; 
import ddf.minim.effects.*;

Minim bob; 
AudioPlayer sue; 
int n=0;
BandPass bpf;

void setup()
{
  size(600,600,P3D);
  bob = new Minim(this); 
  sue = bob.loadFile("Take It Off.mp3"); 
  bpf = new BandPass(440, 20, sue.sampleRate());
  sue.addEffect(bpf);
}


void draw()
{
   float volume = (sue.left.get(1) + sue.right.get(1)); // get vol. for both channels
   volume = abs(((volume+2)*64)); // scale volume to between 0 and 255
   println(volume);
   background(0);
   smooth();
   
  if (n%4 ==1 || n == 0)
  {
       noStroke();
       fill(268,185,25);
       ellipse(300,300,volume*3.5,volume*2.8);
       fill(0);
       ellipse(300,300,volume*2.5,volume*2.5);
       fill(250,250,0);
       ellipse(300,300,volume*1.5,volume*1.8);
       fill(0);
       ellipse(300,300,volume*1.3,volume*1.3); 
       fill(255);
       ellipse(300,300,volume,volume); 
       fill(0);
       ellipse(300,300,volume*0.8,volume*0.8);
       
     for(int i = 0; i < sue.right.size()-1; i++)
    {
      float x1 = map(i, 0, sue.bufferSize(), 0, width);
      float x2 = map(i+1, 0, sue.bufferSize(), 0, width);
      strokeWeight(2);
      stroke(255);
      line(x1, height/2 - sue.left.get(i)*100, x2, height/2 - sue.left.get(i+1)*100);
    } 
  }
  
   if (n%4==2)
  {
   for(int i = 0; i < sue.right.size()-1; i++)
    {
      float x1 = map(i, 0, sue.bufferSize(), 0, width);
      float x2 = map(i+1, 0, sue.bufferSize(), 0, width);
      strokeWeight(5);
      stroke(255);
      line(x1, height/2 - sue.left.get(i)*100+150, x2, height/2 - sue.left.get(i+1)*100+150);
      stroke(250,250,0);
      line(x1, height/3 - sue.left.get(i)*100+80, x2, height/3 - sue.left.get(i+1)*100+80);
      stroke(268,185,25);
      line(x1, height/4 - sue.left.get(i)*100-30, x2, height/4 - sue.left.get(i+1)*100-30); 
    }    
   
  }
   
  if (n%4==3)
  {
    for(int i = 0; i < sue.right.size()-1; i++)
    {
      float x1 = map(i, 0, sue.bufferSize(), 0, width);
      float x2 = map(i+1, 0, sue.bufferSize(), 0, width);
      strokeWeight(5);
      rotateY(map(volume*3, 0, 600, -1, 1));
      rotateX(map(volume*3, 0, 600, -1, 1));
      stroke(255);
      line(x1, height/2 - sue.left.get(i)*100+150, x2, height/2 - sue.left.get(i+1)*100+150);
      stroke(250,250,0);
      line(x1, height/3 - sue.left.get(i)*100+80, x2, height/3 - sue.left.get(i+1)*100+80);
      stroke(268,185,25);
      line(x1, height/4 - sue.left.get(i)*100-30, x2, height/4 - sue.left.get(i+1)*100-30); 
    }    
  }

       
 }

void mousePressed()
  {
    if (mousePressed==true)
      {
        ++n;
       }
  
    if(n%4==1 || n%4==2 || n%4==3)
      {
        sue.play();
      }
    else
      {
        sue.pause();
      }
  }
  
void mouseMoved()
{
  float passBand = map(mouseX, 0, width, 100, 2000);
  bpf.setFreq(passBand);
  float bandWidth = map(mouseY, 0, height, 50, 500);
  bpf.setBandWidth(bandWidth);
  bpf.printCoeff();
}

void stop()
{
  sue.close(); 
  bob.stop(); 
  super.stop();
}


 


