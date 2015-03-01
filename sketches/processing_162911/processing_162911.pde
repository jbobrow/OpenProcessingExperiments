
/*import java.awt.Image;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;*/
float wavelength=1;
float frequency=0.5;
float amplitude=1;
float xScale, yScale;
int direction=0;
SimpleButton wlplus=new SimpleButton(30, 10, 21, 21, "+");
SimpleButton wlminus=new SimpleButton(60, 10, 21, 21, "-");
SimpleButton freqplus=new SimpleButton(310, 10, 21, 21, "+");
SimpleButton freqminus=new SimpleButton(340, 10, 21, 21, "-");
SimpleButton amplplus=new SimpleButton(610, 10, 21, 21, "+");
SimpleButton amplminus=new SimpleButton(640, 10, 21, 21, "-");
SimpleButton leftbutton=new SimpleButton(890, 10, 21, 21, "<<");
SimpleButton standingbutton=new SimpleButton(920, 10, 21, 21, "X");
SimpleButton rightbutton=new SimpleButton(950, 10, 21, 21, ">>");
SimpleButton pausebutton;
boolean paused=true;
long ticker=-1;

void setup() {
/*  frame.setTitle("Virtuelle Wellenmaschine");
  PImage icon = loadImage("icon-48.png");
  frame.setIconImage((Image) icon.getNative());*/  
  size(1024, 500);
  frameRate(60);
  xScale=width/4;
  yScale=height/3;
  pausebutton=new SimpleButton(width-220, height-30, 20, 20, "||");
  pausebutton.setState(paused);
  standingbutton.setState(true);
/*  frame.setResizable(true);
  frame.addComponentListener(new ComponentAdapter() {
    public void componentResized(ComponentEvent e) {
      if (e.getSource()==frame) {
        draw();
        xScale=width/4;
        yScale=height/3;
        pausebutton=new SimpleButton(width-220, height-30, 20, 20, "||");
        pausebutton.setState(paused);
      }
    }
  }
  );*/
}

void draw() {

  if (!paused||ticker<0)ticker++;
  background(240);
  stroke(200, 0, 0);
  strokeWeight(2);
  line(0, height/2, width, height/2);
  for (int ytic=(int)xScale;ytic<width;ytic+=(int)xScale) {
    line(ytic, 0, ytic, height);
  }
  line(0, height/2+yScale, width, height/2+yScale);
  line(0, height/2-yScale, width, height/2-yScale);
  stroke(0);
  strokeWeight(2);
  for (int i=0;i<width-1;i+=2) {
    float x0=i;
    float x1=i+2;
    float y0=0;
    float y1=0;
    if (direction==0) {
      y0=-amplitude*yScale*sin(2*PI*x0/(xScale*wavelength)+2*PI*frequency*ticker/60)/2f;
      y1=-amplitude*yScale*sin(2*PI*x1/(xScale*wavelength)+2*PI*frequency*ticker/60)/2f;  
      y0+=-amplitude*yScale*sin(2*PI*x0/(xScale*wavelength)-2*PI*frequency*ticker/60)/2f;
      y1+=-amplitude*yScale*sin(2*PI*x1/(xScale*wavelength)-2*PI*frequency*ticker/60)/2f;
    }
    else {
      y0=-amplitude*yScale*sin(2*PI*x0/(xScale*wavelength)+direction*2*PI*frequency*ticker/60);
      y1=-amplitude*yScale*sin(2*PI*x1/(xScale*wavelength)+direction*2*PI*frequency*ticker/60);
    }
    y0+=height/2;
    y1+=height/2;
    line(x0, y0, x1, y1);
  }    
  stroke(0, 0, 200);
  strokeWeight(1);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  fill(220);
  noStroke();
  rect(0, 0, width, 50);
  rect(0, height-50, width, 50);
  fill(0);
  textAlign(LEFT, CENTER);
  textSize(20);
  strokeWeight(1);
  text("Wellenlänge: "+nf(wavelength, 1, 2)+"m", 100, 20);
  text("Frequenz: "+nf(frequency, 1, 2)+"Hz", 380, 20);
  text("Amplitude: "+nf(amplitude, 1, 2)+"m", 680, 20);
  text("Zeit: "+nf(ticker/60f, 1, 3)+"s", width-190, height-20);
  wlplus.draw();
  wlminus.draw();
  freqplus.draw();
  freqminus.draw();
  amplplus.draw();
  amplminus.draw();
  pausebutton.draw();
  leftbutton.draw();
  rightbutton.draw();
  standingbutton.draw();
  if (mouseY>50&&mouseY<height-50) {
    text(nf(mouseX/xScale+ticker/60f, 1, 3)+"s\n"+nf((height/2-mouseY)/yScale, 1, 2)+"m", mouseX+30, mouseY);
  }
  textSize(25);
  textAlign(LEFT, CENTER);
  switch(direction) {
  case -1:
  case 1:
    text("f(x,t)="+nf(amplitude, 1, 2)+"m·sin(2\u03C0/"+nf(wavelength, 1, 2)+"m·x"+(direction==-1?"-":"+")+"2\u03c0·"+nf(frequency, 1, 2)+"Hz·t)", 30, height-30);
    break;
  case 0:
    text("f(x,t)="+nf(amplitude, 1, 2)+"m·sin(2\u03C0/"+nf(wavelength, 1, 2)+"m·x)·cos(2\u03c0·"+nf(frequency,1, 2)+"Hz·t)", 30, height-30);
  default:
  }
}

public void mouseClicked() {
  if (wlplus.isOver(mouseX, mouseY))wavelength=min(wavelength+0.1, 10);
  else if (wlminus.isOver(mouseX, mouseY))wavelength=max(wavelength-0.1, 0.2);
  else if (amplplus.isOver(mouseX, mouseY))amplitude=min(amplitude+0.1, 1);
  else if (amplminus.isOver(mouseX, mouseY))amplitude=max(amplitude-0.1, -1);
  else if (freqplus.isOver(mouseX, mouseY))frequency=min(frequency+0.05, 2);
  else if (freqminus.isOver(mouseX, mouseY))frequency=max(frequency-0.05, 0);
  else if (pausebutton.isOver(mouseX, mouseY)) {
    paused=!paused;
    pausebutton.toggle();
  }
  else if (leftbutton.isOver(mouseX, mouseY))direction=1;
  else if (rightbutton.isOver(mouseX, mouseY))direction=-1;
  else if (standingbutton.isOver(mouseX, mouseY))direction=0;
  else {
    paused=!paused;
    pausebutton.toggle();
  }
  leftbutton.setState(direction==1);
  standingbutton.setState(direction==0);
  rightbutton.setState(direction==-1);
}

public class SimpleButton {
  private boolean state=false;
  protected float X, Y, W, H;
  private String buttonText="";
  public SimpleButton(float xPos, float yPos, float xSize, float ySize, String label) {
    X=xPos;
    Y=yPos;
    W=xSize;
    H=ySize;
    buttonText=label;
    state=false;
  }
  
  public boolean toggle() {
    state=!state;
    return this.getState();
  }

  public boolean setState(boolean newState) {
    state=newState;
    return this.getState();
  }

  public boolean getState() {
    return state;
  }

  public void draw() {
    strokeWeight(1);
    stroke(100);
    if (state&&frameCount%40<20) {
      fill(50, 50, 200);
    }
    else {
      fill(200, 200, 50);
    }
    rectMode(CORNER);
    rect(X, Y, W, H);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(13);
    text(buttonText,X+W/2,Y+H/2);
  }
  
  public boolean isOver(float x, float y) {
    if ((x>X)&&(x<X+W)&&(y>Y)&&(y<Y+H)) {
      return true;
    }
    else { 
      return false;
    }
  }
}




