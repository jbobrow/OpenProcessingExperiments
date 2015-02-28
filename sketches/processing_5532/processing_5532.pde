
//loads minim librarys
import ddf.minim.*;
import ddf.minim.analysis.*;

/*
----------------------------------------------------------------------------------
 BeatListener Class - From Minim Documentation
 */

class BeatListener implements AudioListener
{
  private BeatDetect beat;
  private AudioPlayer source;

  BeatListener(BeatDetect beat, AudioPlayer source)
  {
    this.source = source;
    this.source.addListener(this);
    this.beat = beat;
  }

  void samples(float[] samps)
  {
    beat.detect(source.mix);
  }

  void samples(float[] sampsL, float[] sampsR)
  {
    beat.detect(source.mix);
  }
}

/*
End BeatDetect Class
 --------------------------------------------------------------------------------
 */
Minim minim;
AudioPlayer track;
BeatDetect beat;
BeatListener bl;

float a,b,c,d,e,f,g,h,i,j;
float z;

int totalCount = 0;
String[] lines;
String[] words;
String[] number;
float AverageCharacterCount = 1;
int lineIndex;
float rotationY = 0;
float rotationX = 0;
float rotationZ = 0;
int   boxNumbers= 20;

float rotZ = 0;

int numShapes = 50;

float easing[]= new float[numShapes];
float transX[]= new float[numShapes];
float transY[]= new float[numShapes];
float shapeRotate[]= new float[numShapes];
float dX[] = new float[numShapes];
float dY[] = new float[numShapes];
float sphereSize[]=new float[numShapes];
float nS[]= new float[numShapes];
float boxWidth[]=new float[numShapes];
float boxHeight[]=new float[numShapes];
float boxDepth[]=new float[numShapes];
float cylinderWidth[]=new float[numShapes];
float cylinderHeight[]=new float[numShapes];
float transZ[]= new float[numShapes];
float dZ[] = new float[numShapes];

float sL = 50;
String shape ="";

float increment = 0.003;
// The noise function's 3rd argument, a global variable that increments once per cycle
float zoff = 0.2;
// We will increment zoff differently than xoff and yoff
float zincrement = .09;
/*
-----------------------------------------------------------------------------------------
 New Background Function
 */
int numBoxes = 400;
int [] boxesX = new int [numBoxes];
int [] boxesY = new int [numBoxes];

int transOffset = 0;
int squareSize = 80;
int transMultiplier = 2*squareSize;

float pop=0;
boolean rotX=false;
/*
-----------------------------------------------------------------------------------------
 Setup Function
 */

void setup()
{
  size(800,800, P3D);
  background(0);
    colorMode(HSB);

for(int k1 = 0;k1<=(numShapes-1);k1++)
{
if(k1 == 0)
{
easing[k1]=0.05;
transX[k1]=mouseX;
transY[k1]=mouseY;
transZ[k1]=0;
}
else if(k1>0)
{
easing[k1]= random(0.01,0.03);
transX[k1]= random(50,750);
transY[k1]= random(50,750);
transZ[k1]= random(-100,250);
}
}
for(int r = 0;r<=(numShapes-1);r++)
{
shapeRotate[r]= 1;
}




  //frameRate(100);



  //Loads Strings
  lines = loadStrings("log.txt");

  //load track to minim   /// http://www.hotlinkfiles.com/files/1376985_lyje3/aAdvantage-TheBalladoftheRAA.mp3 ////  http://www.snuhfiles.com/sound/desomond_dekker_aces-007-shanty_town.mp3// http://www.thecouchsessions.com/wp-content/uploads/2008/09/alicia-keys-ft-jack-white-another-way-to-die.mp3
  minim = new Minim(this);
  track = minim.loadFile("Girl.mp3", 2048);

  //create beat detection object to capture buffer size and sample rate
  beat = new BeatDetect(track.bufferSize(), track.sampleRate());
  //set beat sensitivity (milliseconds)
  beat.setSensitivity(2);
  //create new listener so program doesnt miss any buffers
  bl = new BeatListener(beat, track);

  track.play();

  //noStroke();
  /*
  ----------------------------
   New Background
   */
  for(int x =0; x<=80; x++){
    for(int y =0; y<=80; y++){

      boxesX[x] = x*transMultiplier;
      boxesY[y] = y*transMultiplier;
      //println(boxesX[x] + " " + boxesY[y]);
    }

  }
}

/*
End Setup
 ------------------------------------------------------------------------------------
 Start Draw
 */



void draw()
{
  float cameraX = height/2.0;
  float fov = mouseX/float(width) * PI ;
  float cameraY = cameraX / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if(mousePressed)
  {
  perspective(fov, aspect, cameraY/10.0, cameraY*10.0);
  }
  lights();
  background(0);
  strokeWeight(1);
  //stroke(255);
  
    rotateX(rotationX);
  rotateY(rotationY);
  rotateZ(sin(radians(rotationZ))*5);
  
  boxNumbers = 60;//int(random(2,60));
  createBoxes(pop);
  //strokeWeight(10);
  //stroke(255);
  //line(mouseX, mouseY, pmouseX, pmouseY);
  //translate(mouseX, mouseY);
  //sphere(40);
  //ellipse(mouseX,mouseY, 40,40);
  beat.isRange(0,0, 200);

  //20 is snare
  beat.isRange(16,16, 200);
  if(beat.isKick()){
    //for(int bebop = 0; bebop < 80; bebop++){
    
    pop = processLines(); 
    
    //}
  }
  else{
    pop-=10;
    if (pop <= 20){


      pop = 0;

    }
  }
  
  for(int k2=0; k2<=(numShapes-1);k2++)
{
if(k2==0)
{
dX[k2]=(mouseX-transX[k2]);
dY[k2]=(mouseY-transY[k2]);
dZ[k2]=(0-transZ[k2]);
}
else if(k2>0)
{
dX[k2]=(transX[0]-transX[k2]);
dY[k2]=(transY[0]-transY[k2]);
dZ[k2]=(transZ[0]-transZ[k2]);
}
}
for(int k3=0; k3<=(numShapes-1);k3++)
{
if(abs(dX[k3])>1)
{
transX[k3]+=dX[k3]*easing[k3];
}
if(abs(dY[k3])>1)
{
transY[k3]+=dY[k3]*easing[k3];
}
if(abs(dZ[k3])>1)
{
transZ[k3]+=dY[k3]*easing[k3];
}

}
if(keyPressed&&key=='1')
{
shape = "sphere";
}
else if(keyPressed&&key=='2')
{
shape = "box";
}
else if(keyPressed&&key=='3')
{
shape = "cylinder";
}
println(shape);
if(shape=="sphere")
{
for(int i = 0; i<=(numShapes-1);i++)
{
sphereSize[i]=sL;
//nS[i]=random(4,20);
//background(0);
if( i==0){
  noStroke();
  fill(0,300,300);
}
else{
  noStroke();
 fill( random(15,50), 300,300);
}
  

pushMatrix();
if(transZ[i]>=0)
{
  translate(transX[i],transY[i],(transZ[i]+pop));
}
else if(transZ[i]<0)
{
  translate(transX[i],transY[i],(transZ[i]-pop));
}
rotate((PI/1000)*shapeRotate[i]);
rotateZ((PI/1000)*shapeRotate[i]);
sphereDetail(int(nS[i]));
sphere(sphereSize[i]*(fov*2));
popMatrix();
}
}

else if(shape=="box")
{
for(int i2 = 0; i2<=(numShapes-1);i2++)
{
  if( i2==0){
  noStroke();
  fill(0,300,300);
}
else{
  noStroke();
 fill( random(15,50), 300,300);
}
boxWidth[i2]=sL/2;
boxHeight[i2]=sL;
boxDepth[i2]=sL/3;
//background(0);
pushMatrix();
if(transZ[i2]>=0)
{
  translate(transX[i2],transY[i2],(transZ[i2]+pop));
}
else if(transZ[i2]<0)
{
  translate(transX[i2],transY[i2],(transZ[i2]-pop));
}
translate(transX[i2],transY[i2],transZ[i2]);
rotate((PI/1000)*shapeRotate[i2]);
rotateZ((PI/1000)*shapeRotate[i2]);
box(boxWidth[i2]*(fov*2),boxHeight[i2]*(fov*2),boxDepth[i2]*(fov*2));
popMatrix();
}
}
else if(shape=="cylinder")
{
for(int i3 = 0; i3<=(numShapes-1);i3++)
{
  if( i3==0){
  noStroke();
  fill(0,300,300);
}
else{
  noStroke();
 fill( random(15,50), 300,300);
}
cylinderWidth[i3]=sL;
cylinderHeight[i3]=sL;
//cylinderDepth[i3]=sL;
//background(0);
pushMatrix();
if(transZ[i3]>=0)
{
  translate(transX[i3],transY[i3],(transZ[i3]+pop));
}
else if(transZ[i3]<0)
{
  translate(transX[i3],transY[i3],(transZ[i3]-pop));
}
translate(transX[i3],transY[i3],transZ[i3]);
rotate((PI/1000)*shapeRotate[i3]);
rotateZ((PI/1000)*shapeRotate[i3]);

cylinder(cylinderWidth[i3]*(fov*2),cylinderHeight[i3]*(fov*2),int(int(nS[i3])));
popMatrix();
}
}



for(int ik = 1; ik<=(numShapes-1);ik++)
{
if(transX[ik]<=sL||transX[ik]>=(width-sL)||transY[ik]<=sL||transY[ik]>=(height-sL)
||(abs(transX[ik]-transX[0])<=10||abs(transY[ik]-transY[0])<=10))
{
easing[ik]*=-1;
}
for(int ik2 = 2; ik2 <=(numShapes-1);ik2++)
{
if(abs(transX[ik]-transX[ik2])<=50&&abs(transY[ik]-transY[ik2])<=50)
{
dX[ik]=dX[ik2]*(-1);
dY[ik]=dY[ik2]*(-1);
}
}
}

for(int kk = 0; kk<=(numShapes-1); kk++)
{
if(kk==0)
{
shapeRotate[kk]+=10;
if(shapeRotate[kk]>=1000)
{
shapeRotate[kk]=1;
float zz = random(4,20);
nS[kk] = int(zz);
}
}
if(kk>0)
{
shapeRotate[kk]+=20;
if(shapeRotate[kk]>=1000)
{
shapeRotate[kk]=1;
float zz = random(4,20);
nS[kk] = int(zz);
}
}






  

}
}




void cylinder(float w, float h, int sides)
{
float angle;
float[] x = new float[sides+1];
float[] z = new float[sides+1];

//get the x and z position on a circle for all the sides
for(int i=0; i < x.length; i++){
angle = TWO_PI / (sides) * i;
x[i] = sin(angle) * w;
z[i] = cos(angle) * w;
}

//draw the top of the cylinder
beginShape(TRIANGLE_FAN);

vertex(0, -h/2, 0);

for(int i=0; i < x.length; i++){
vertex(x[i], -h/2, z[i]);
}

endShape();

//draw the center of the cylinder
beginShape(QUAD_STRIP);

for(int i=0; i < x.length; i++){
vertex(x[i], -h/2, z[i]);
vertex(x[i], h/2, z[i]);
}

endShape();

//draw the bottom of the cylinder
beginShape(TRIANGLE_FAN);

vertex(0, h/2, 0);

for(int i=0; i < x.length; i++){
vertex(x[i], h/2, z[i]);
}

endShape();
}
  



/*
End Draw
 -----------------------------------------------------------------------------------
 Start processLines
 */

float processLines()
{
  float value = lines[lineIndex].length();
  if(value > AverageCharacterCount)
  {
    AverageCharacterCount = value;
    //println(value);
  }

  //Change the last to values to set the color range
  float m = map(value, 0, AverageCharacterCount, 65, 150);
  //println(m);
  lineIndex++;
  if(lineIndex > lines.length-1)
  {
    lineIndex=0;
    AverageCharacterCount = 1;
  }

  return(m);
}

/*
End processLines()

 -----------------------------------------------------------------------------------
 Begin clouds()
 */

void keyPressed(){//code to allow key presses to change the color of the system
  if (key == 32 ){
            rotX = true;
            
          }
          
  if (key == CODED) {
    if (keyCode == LEFT){
      rotationX=rotationX-.1;
    }
    if (keyCode ==RIGHT){
      rotationX=rotationX+.1;
    }
    if (keyCode == BACKSPACE){
      rotationY=rotationY+.1;
    }
    if (keyCode == TAB){
      rotationY=rotationY-.1;
    }
    if (keyCode == UP){
      rotationY+=.1;
    }
    if (keyCode == DOWN){
      rotationY-=.1;
    }
    if (keyCode == CONTROL){
      rotX = false;
    }
    }
  

}


/*
 End Clouds
 --------------------------------------------------------------------------------------------
 Start Creat Boxes
 */

void createBoxes(float pop){

  for(int x =0; x<=boxNumbers; x++){
    for(int y =0; y<=boxNumbers; y++){
      pushMatrix();
      beat.isRange(0,1, 20);
      if (beat.isKick())
      {
       if(rotX == true){ 
       rotateX(rotZ);
       rotateZ(rotZ);
       rotZ+=(PI*2); 
       
       }else if(rotX == false){
       
       rotateZ(rotZ);
       rotZ+=(PI*2); 
      
        }}
      beat.isRange(10,25, 20);
      if(beat.isSnare())
      {
        fill(random(45,180),random(285,350),200);
      }

      translate(boxesX[x]-4500, boxesX[y]-4500);
      //change stroke color and weight on drum beat
      beat.isRange(17,17, 200);
      if(beat.isHat())
      {
        strokeWeight(random(.5));
        
        stroke(0);
      }
      //strokeWeight(1);
      //stroke(random(175,255));
      box(squareSize,squareSize,(pop));
      popMatrix();

    
  }
  }
  //}
  //pop = 0;

}


/*
End Boxes
 --------------------------------------------------------------------------------------------
 Start Stop Function
 */

//closes audio I/O classes
void stop() 
{
  track.close();
  minim.stop();
  super.stop();
}





