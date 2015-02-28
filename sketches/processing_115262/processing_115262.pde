
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/60316*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

/*Tweak by Maribel Trillo 07/06/2013 I wanted to create a interactive 
*narrative where the user is the main actor I would like to create 
*feellings when people are going through life. I associate this with 
*my Journey at Uni
*
*Instead of using a control panel for the options, I wanted to control 
*it over time and I eliminate those one I'm not interested
*such as: control of X and y, realcolor, Grid and floor*/

import SimpleOpenNI.*;
import controlP5.*;
import toxi.geom.*;

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

AudioPlayer player;
Minim minim;//audio context

//MT-I eliminate Public, as I feel it would take more memory
float   xmin = -1000;
float   xmax = 1000;
float   ymin = -1000;
float   ymax = 1000;
float   zmin = -1000;
float   zmax = 1000;
int     resolution = 3;//MT-I started to 5
int     bandsResolution;
int     pixelsResolution;
int     bandsSeparation = 0;
int     pixelSize = 1;//MT-I started 1
boolean drawBands = false;
boolean drawPixels = true; //MT-I change to True I will use gold theme
boolean realColor = false; //MT-I change to False I will use gold theme;
boolean explode = false;
boolean disolve = false;
boolean follow =  false;
boolean sandEffect = false;
boolean drawSculpture = false;
boolean drawSphere = false;
boolean drawBalls = false;
boolean drawGrid = false;
boolean drawFloor = false;


SimpleOpenNI context;

float zoomF = 0.35;

float rotX  = PI;
float rotY  = 0.25; //MT-I change it to 0.30 to create more 3d effect

Particles      par;
Bands          band;
ConnectedLines connectedLine;
ArrayList      particlesList = new ArrayList();
ArrayList      bandsList = new ArrayList();
Spline3D       splinePoints = new Spline3D();
ArrayList      balls = new ArrayList();
Ball           sph = new Ball(new PVector(0,0,2000),new PVector(0,0,0),100);

void setup(){
  
  //full screen
  size(screen.width,screen.height,P3D);
  frameRate(15);//MT-reduce it to make more responsive

  perspective(radians(45),float(width)/float(height),10.0,150000.0);
                         
  context = new SimpleOpenNI(this);
  if (!context.enableDepth()) { 
    println("Kinect not connected!"); 
    exit();
  } else {
    context.setMirror(true);
    context.enableDepth();  
    context.enableRGB();
    context.alternativeViewPointDepthToImage();
    context.enableHands();
    context.enableGesture();
    context.addGesture("RaiseHand");
    context.update();
  
    calculateLimits(context.depthMap(),context.depthMapRealWorld());
    
    //controlPanel();
    
    //MT-Rutine to active music this is the right place as it would start with the visuals
    minim = new Minim(this);
    player = minim.loadFile("equinoxe1.mp3", 2048);
    player.play();
  
  }
}

void draw(){

  int posSong = player.position(); //MT- variable for the position of the song

  background(0,0,0,1);
  translate(width/2,height/2,0);
  rotateX(rotX);
  rotateY(rotY);
  scale(zoomF);
  translate(0,0,-1500);
  
  context.update();
  
  //println(frameRate);//MT-I did this line to check the frame rate it can make the program go slow and I wanted to see
  
  int[] depthMap = context.depthMap();
  PVector[] realWorldMap = context.depthMapRealWorld();
  PImage rgbImage = context.rgbImage();

  int[] resDepth = resizeDepth(depthMap,resolution);
  PVector[]resMap3D = resizeMap3D(realWorldMap,resolution);
  PImage resRGB = resizeRGB(rgbImage,resolution);
  
  boolean[] constrainedImg = constrainImg(resDepth,resMap3D,xmin,xmax,ymin,ymax,zmin,zmax);
  
  int resXsize = context.depthWidth()/resolution;
  int resYsize = context.depthHeight()/resolution;
  
  //directionalLight(255, 190,30,0,-0.2,1);//MT-yeloow light
 directionalLight(255,255,255,0,-0.2,1);

  //MT-I used this function to isolate the text and
  //rotated so it would look straigh
  /*
    pushMatrix();
    textSize(20);
    fill(255);
    translate(0, 0, 0);
    rotate(PI);
    rotateY(-90);
    text("Move the ball",100,-150,200);
  popMatrix(); 
  */
  
  /*if ((timeLapse>=15)&&(timeLapse<25)) { 
    drawBands = false;
    sandEffect =false;   
    follow = true;
  } else {
    if ((timeLapse>=25)&&(timeLapse<40)) {
      resolution = 7; 
      sandEffect = true; 
    } else {
      if ((timeLapse>=40)&&(timeLapse<42)) { //MT-I adjusted the time until the image go back to normal
        sandEffect = false;
        resolution = 3; 
      } else {
        if ((timeLapse>=42)&&(timeLapse<55)) {
          drawBalls = true;
          follow = false;             
          drawPixels = false;
          drawBands = true;
        } else { 
          if ((timeLapse>=55)&&(timeLapse<60)) {
            drawBalls = false;
            drawBands = false;
            drawPixels = false;            
           } else {
             drawPixels = true;
           }
          }
        }
      }
    }*/
   
    //println(zmax);//MT-3885
    zmax = 3885;
    
    if ((posSong >= 0) && (posSong < 6000)) {
      rotY  = 0.25;
      drawPixels = true;
      drawBands = false;
    }
    
    if ((posSong >= 6000) && (posSong < 8000)) {
      drawPixels = false;
      drawBands = true;
    }
        
    if ((posSong >= 8000) && (posSong < 9000)) {
      drawPixels = true;
      drawBands = false;
    }
    
    if ((posSong >= 9000) && (posSong < 12000)) {
      drawPixels = false;
      drawBands = true;
    }        
  
    if ((posSong >= 12000) && (posSong < 13000)) {
      drawPixels = true;
      drawBands = false;
    }
    
    if ((posSong >= 13000) && (posSong < 16000)) {
      drawPixels = false;
      drawBands = true;
    }      
    
    if ((posSong >= 16000) && (posSong < 17000)) {
      drawPixels = true;
      drawBands = false;
    }
    
    if ((posSong >= 17000) && (posSong < 18000)) {
      drawPixels = false;
      drawBands = true;
    }   
  
    if ((posSong >= 18000) && (posSong < 24000)) {
      drawPixels = true;
      drawBands = false;
      follow = true;
    }
 
    if ((posSong >= 24000) && (posSong < 36000)) {
      drawPixels = true;
      follow = false;
      drawBalls = true;
    }
    
    if ((posSong >= 36000) && (posSong < 51000)) {
      drawPixels = true;
      drawBalls = false;
      resolution = 7; 
      follow = true;
      sandEffect = true; 
    }
    
    if ((posSong >= 51000) && (posSong < 53000)) {
      sandEffect = false;
      resolution = 3; 
    }
    
    if ((posSong >= 53000) && (posSong < 57000)) {
      rotY += 0.09;
    }
    
    if ((posSong >= 57000) && (posSong < 60000)) {
      rotY += 0.08;
    }
    
      if ((posSong >= 60000) && (posSong < 62000)) {
      rotY += 0.06;
    }

    if ((posSong >= 62000) && (posSong < 64000)) {
      rotY += 0.05;
    }

    if ((posSong >= 64000) && (posSong < 71000)) {
      //rotY = 0.25;
      resolution = 7; 
      sandEffect = true; 
    }
    
    if ((posSong >= 71000) && (posSong < 73000)) {
      sandEffect = false;
      resolution = 3; 
    }

    if ((posSong >= 73000) && (posSong < 79000)) {
      resolution = 7; 
      sandEffect = true; 
    }
       
     if ((posSong >= 79000) && (posSong < 81000)) {
      sandEffect = false;
      resolution = 3; 
    }

    if ((posSong >= 81000) && (posSong < 87000)) {
      resolution = 7; 
      sandEffect = true; 
    }
       
     if ((posSong >= 87000) && (posSong < 89000)) {
      sandEffect = false;
      resolution = 3; 
    }
   
    if ((posSong >= 89000) && (posSong < 94000)) {
      resolution = 7; 
      sandEffect = true; 
    }
       
     if ((posSong >= 94000) && (posSong < 96000)) {
      sandEffect = false;
      resolution = 3; 
    }

    if ((posSong >= 96000) && (posSong < 99000)) {
      resolution = 7; 
      sandEffect = true; 
    }
       
     if ((posSong >= 99000) && (posSong < 101000)) {
      sandEffect = false;
      resolution = 3; 
    }
    
    if ((posSong >= 101000) && (posSong < 106000)) {
      follow = false;
      rotY += 0.08;
    }
    
    if ((posSong >= 106000) && (posSong < 108000)) {
      rotY += 0.07;
    }

    if ((posSong >= 108000) && (posSong < 115000)) {
      drawPixels = false;
      drawBands = true;
      rotY += 0.06;
    }

    if ((posSong >= 115000) && (posSong < 117000)) {
      rotY += 0.05;
    }
 
    if ((posSong >= 117000) && (posSong < 118000)) {
      rotY += 0.04;
    }    
    
    if ((posSong >= 118000) && (posSong < 127000)) {
       drawPixels = true;
       drawBands = false;
       rotY += 0.04;
    }    
    
     if ((posSong >= 127000) && (posSong < 132000)) {
     rotY += 0.03;
    }  
 
    if ((posSong >= 132000) && (posSong < 141000)) {
     rotY += 0.009;
    }  
  
    // MT-Start drawings
 
  if(drawFloor){
    drawFloor(color(150),xmin,xmax,ymin,ymax,zmin,zmax);
  }

  if(drawGrid){
    drawGrid(color(255),xmin,xmax,ymin,ymax,zmin,zmax);
  }
  
  if(drawBands){
    if(!explode && !disolve){
      band = new Bands(resMap3D,resRGB,constrainedImg,resXsize,resYsize);
    }
    else if(explode){
      band.explode();
    }
    else if(disolve){
      band.disolve(ymin);
    }
    
    band.paint(color(255, 160,3),bandsSeparation);

    if(follow){
      bandsList.add(band);
      if(bandsList.size() > 30){
        Bands band1 = (Bands) bandsList.get(15);
        Bands band2 = (Bands) bandsList.get(0);
        if(realColor){
          band1.paint(bandsSeparation);
          band2.paint(bandsSeparation);
        }
        else{
          band1.paint(color(255, 160,3),bandsSeparation);
          band2.paint(color(255, 160,3),bandsSeparation);
        }
        bandsList.remove(0);
      }
    }
    else{
      bandsList.clear();
    }
  }

  if(drawPixels){
    par = new Particles(resMap3D,resRGB,constrainedImg);
    //connectedLine = new ConnectedLines(resMap3D,constrainedImg,resXsize,resYsize);//MT-I activated the lines it looks like a grid
    
    par.paint(pixelSize,color(255, 160,3));
    //connectedLine.paint(color(255,160,3));//MT-I activated the lines it looks like a grid

    if(follow){
      particlesList.add(par);
      if(sandEffect){
        for(int i = 0; i < particlesList.size()-1; i++){
          par = (Particles) particlesList.get(i);
          par.paint(pixelSize,color(255, 118,5));
          par.update(ymin);
        }
        if(particlesList.size() > 30){
          particlesList.remove(0);
        }
      } 
      else{
        if(particlesList.size() > 30){
          Particles par1 = (Particles) particlesList.get(15);
          Particles par2 = (Particles) particlesList.get(0);

          par.paint(pixelSize,color(255, 160,3));
          par1.paint(pixelSize,color(255, 118,5));
          par2.paint(pixelSize,color(197, 97,19));
        
          particlesList.remove(0);
        }
      }
    }
    else{
      particlesList.clear();
    }
  }

  if(drawSculpture){
    if(splinePoints.getPointList().size() > 2){
      splinePoints.setTightness(0.25);
      java.util.List vertices = splinePoints.computeVertices(4);
      for(int i = 0; i < vertices.size()-2; i++){
        Vec3D p1 = (Vec3D) vertices.get(i);
        Vec3D p2 = (Vec3D) vertices.get(i+1);
        Vec3D p3 = (Vec3D) vertices.get(i+2);
        float rad1 = 60; // + 20*noise(float(i)*0.1);
        float rad2 = 60; // + 20*noise((float(i)+0.5)*0.1);
        float rad3 = 60; // + 20*noise(float(i+1)*0.1);
        color col = color(255, 160,3);
        float frac = 0.2;
      
        cilinder(p1,p2,rad1,rad2,col,frac);
        connector(p1,p2,p3,rad2,rad3,col,frac);
      }
    }
  }
  
  if(drawBalls){
    for(Iterator i = balls.iterator(); i.hasNext(); ){
      Ball b = (Ball) i.next();
      b.paint(color(255, 118,5));
      b.update(new PVector(0,-15,0),1);
      if(b.pos.y < ymin){
        i.remove();
      }
    }  
  }
  
  if(drawSphere){
    //color col = color(0,50+200*noise(frameCount*0.05),50+200*noise(200+frameCount*0.05));
    color col = color(255,140+100*noise(frameCount*0.05),noise(1+frameCount*0.05));//MT-I change some values to make it look gold
    sph.paint(col);
    sph.contact(resMap3D,constrainedImg,resXsize);
    sph.update(new PVector(0,0,0),0.5);
  }
  
//  println("Position: " + player.position() + "  Length: " + player.length()); //I wanted to know the exact length
  
   if (player.position() >= 141531) {
    player.rewind();
    player.play(); 
  }

  //saveFrame("frames/######.jpg");
}

/*void stop()
{
  player.close();
  minim.stop();
  super.stop();
}*/


