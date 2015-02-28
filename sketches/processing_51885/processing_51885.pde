
//Moths

int wordLength=5;
boolean activated=false;
boolean heldDown=false;
char[] expl=new char[wordLength];
float[] explX=new float[wordLength];
float[] explY=new float[wordLength];
int trans;
String message="MOTHS";
PFont myFont;
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  noCursor();
  frameRate(60);
  size(200, 200);
  myFont = createFont("dingdong.ttf", 24);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  
  for(int i=0; i<expl.length; i++){
   expl[i]=message.charAt(i); 
  }
  
  noStroke();
  x = width / 2;
  y = height / 2;
}

void mousePressed(){
 activated=false;
 heldDown=true; 
}
void mouseReleased() {
  heldDown = false;
}

void draw() {
  background(0);
  
  if(!heldDown){
    for(int i=1; i<6; i++){
      fill(255,i*40,0,0+i*20);
      ellipse(mouseX,mouseY,75-i*10,75-i*10);
    }
  }
  // If the cursor is over the text, change the position
  if (abs(mouseX - width/2) < hr && abs(mouseY - height/2) < vr && !heldDown)
    activated=true;
  if(activated){
    for(int i=0; i<expl.length; i++){
      x= random(mouseX-25,mouseX+25);
      explX[i]=x;
      y= random(mouseY-25, mouseY+25);
      explY[i]=y;
      text(expl[i], x, y);
    }
    for(int i=0; i<expl.length; i++){
      fill(255, random(0,255),0,random(75,100));
      explX[i]=random(mouseX-25,mouseX+25);
      explY[i]=random(mouseY-25, mouseY+25);
      text(expl[i],explX[i],explY[i]);
    }
  }
  else{
      x=width/2;
      y=height/2;
      fill(255,0,0,trans);
      if(trans==100)
        trans=0;
      text(message,width/2,height/2);
      trans+=2;
  }
}

