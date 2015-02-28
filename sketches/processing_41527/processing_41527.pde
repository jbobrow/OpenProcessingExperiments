
import ddf.minim.*;
import ddf.minim.signals.*;

int i, j, k, x, y;
float h;

float freq = 0;
float pan = 0;


float xpos =350;
float ypos =200;

float angle =0.0;
float offset=60;
float scalar =40;
float speed =0.05;

Minim minim;
AudioOutput out;
SineWave sine;

void setup(){
  size(500,500);

  minim=new Minim (this);
  out=minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);
  background(0);
  smooth();
  noFill();
  noCursor();
  strokeWeight(6);
  h = height/2 ;
  x = 0;
  y = 10;




}

void draw (){
  background(0);
  i = 0;
  while(i < y)
  {
    stroke (255,0,0);
    

    //stroke(255,255 - (20 * i),0, 255 - (20 * i));
    /*beginShape();
    curveVertex(50, h + (x * i));
    curveVertex(50, h + (x * i));
    curveVertex(mouseX, mouseY + i * 2);
    curveVertex(450, h + (x * i));
    curveVertex(450, h + (x * i));
    endShape();
     
    beginShape();
    curveVertex(50, h- (x * i));
    curveVertex(50, h - (x * i));
    curveVertex(mouseX, mouseY +i* 2 );
    curveVertex(450, h - (x * i));
    curveVertex(450,  h- (x * i));
    endShape();
    i++;*/
   // pushMatrix();
    //translate (width/2,height/2);
   // rotate (PI/3.0);
   xpos = xpos + (mouseX - xpos) /30.0;
  ypos = ypos +(mouseY -ypos)/30.0;

    beginShape();
     
  //line(mouseX,mouseY,xpos, ypos+60);
  
  float y1=offset +sin(angle) * scalar;
  float y2=offset +sin(angle +0.4) *scalar;
  float y3=offset +sin(angle + 0.8) *scalar;
  float y4 =offset +sin (angle+1.2)*scalar;
  float y5=offset +sin(angle+1.6) * scalar;
  float y6=offset +sin(angle +2) *scalar;
  float y7=offset +sin(angle + 2.4) *scalar;
  float y8 =offset +sin (angle+2.8)*scalar;
  
 // ellipse (80,y1,40,40);
 // ellipse (120,y2,40,40);
 // ellipse (160,y3,40,40);
  //translate (mouseX,mouseY);
 bezier(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+ 0, mouseY+90, xpos+ 25, ypos+80+y1);
 bezier(mouseX, mouseY, mouseX+10, mouseY+30, mouseX+ 0, mouseY+90, xpos- 25, ypos+80+y2);
 bezier(mouseX, mouseY, mouseX+20, mouseY+20, mouseX+ 0, mouseY+80, xpos+ 15, ypos+60+y3);
 bezier(mouseX, mouseY, mouseX+20, mouseY+40, mouseX+ 0, mouseY+80, xpos- 15, ypos+60+y4);
  bezier(mouseX, mouseY, mouseX+30, mouseY+30, mouseX+ 0, mouseY+70, xpos+ 35, ypos+80+y5);
 bezier(mouseX, mouseY, mouseX+30, mouseY+50, mouseX+ 0, mouseY+70, xpos- 35, ypos+80+y6);
 bezier(mouseX, mouseY, mouseX+40, mouseY+40, mouseX+ 0, mouseY+60, xpos+ 45, ypos+60+y7);
 bezier(mouseX, mouseY, mouseX+40, mouseY+60, mouseX+ 0, mouseY+60, xpos- 45, ypos+60+y8);
 
 angle +=speed;
 
    //rect (mouseX,mouseY+i*2, 200+(x*i),200+(x*i));
    endShape();
   // popMatrix();
    
    i++;
  } 
}
void keyPressed()
{

     //float freq = map(mouseY, 0, height, 1500, 60);
     //float pan = map(mouseX, 0, width, -1, 1);
     
  if(keyCode == UP)
  {
    y++;
    freq += 10;
    sine.setFreq(freq);
  }
  
  else if(keyCode == DOWN)
  {
    y--;
    pan -= 50;
    sine.setPan(pan);
  }
  else if(keyCode == LEFT && y > 1)
  {
    y--;
    freq-=20;
    sine.setFreq (freq);
  }
  else if(keyCode == RIGHT && y < 100)
  {
    x++;
     pan += 20;
    sine.setPan(pan);
  }
}

void mouseMoved()
{
  // with portamento on the frequency will change smoothly
  float freq = map(mouseY, 0, height, 1500, 60);
  sine.setFreq(freq);
  // pan always changes smoothly to avoid crackles getting into the signal
  // note that we could call setPan on out, instead of on sine
  // this would sound the same, but the waveforms in out would not reflect the panning
  float pan = map(mouseX, 0, width, -1, 1);
  sine.setPan(pan);
}



//void mouseClicked()
//{
 //laser.loop(0); 
//}
void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

