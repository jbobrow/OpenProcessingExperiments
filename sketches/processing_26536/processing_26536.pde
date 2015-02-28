
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;
BeatListener listener;

//beat detection based Frédéric Patin's algorithms
//********************************************************************

int mX, mY, x, y;
color cl, cl2, cl3, cl4;
color cl_cube;

ArrayList squareArray = new ArrayList();
ArrayList cubeArray = new ArrayList();

int[] randomPos = new int[40]; //random positions for cubes

String imageNumber;
int counter;
float amt;
float amt2;
float moveIt;
boolean isTrue;
boolean isTrue2;
float pt1, pt2, pt3, pt4;

//Cube cube, cube2, cube3, cube4, cube5;

void setup()
{
  size(400,400);
  smooth();
  frameRate(30);
  noCursor();
  
  minim = new Minim(this); 
  song = minim.loadFile("Dead Cruiser.mp3", 2048); 
  song.play(); //play on star
  
  beat = new BeatDetect(song.bufferSize(), song.sampleRate()); //FREQ ENERGY
  beat.setSensitivity(200); 
  listener = new BeatListener(beat, song);
  
  x = 0;
  y = 400;
  
  //cl = color(255, 255, 255, 30);
  cl2 = cl3 = cl4 = color(255, 30);
  cl = color(100,30);
  cl_cube = color(170, 100);
  
  amt = 0.9;
  amt2 = 0.9; //looks cool if less than amt
  moveIt = 0.005; //0.005;
  isTrue = false;
  
  for(int i = 0; i < randomPos.length; i++) //currently not used for anything
  {
    randomPos[i] = int(random(0, 400));
    //println(randomPos);
  }
  
}//setup() 

void draw()
{
  background(255);
  tunnel();

  for(int i = 0; i < squareArray.size(); i++)
  {
    Square temp = (Square) squareArray.get(i); //cast object in position i to another object
   
    temp.update();
    temp.squareMath();
    temp.display();
   
    if(temp.timeToRemove())
    {
      squareArray.remove(i);
      i--;
    }
    //println("square array: " + i);
  }
  
  for(int i = 0; i < cubeArray.size(); i++)
  {
    Cube cube_temp = (Cube) cubeArray.get(i);
          
    cube_temp.update();
    cube_temp.cubeMath();
    cube_temp.display(); 
   
    if(cube_temp.timeToRemove())
    {
      cubeArray.remove(i);
      i--;
    }
    //println("cube array: " + i);
  }
  
  //Beat Detection************************************************
 
  if(beat.isKick())
  {
    //println("KICK");
    //cl = color(155, 48, 255, 20);
    //cl2 = color(50, 255);
    Square temp = new Square(0.9, cl2);
    squareArray.add(temp);
  }
  
  if(beat.isSnare())
  {
    //println("SNARE");
    //cl3 = color(150, 100); //alpha 20
    Square temp = new Square(0.9, cl3);  
    squareArray.add(temp);
//    cl_cube = color(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
//    //Cube cube_temp = new Cube(amt, amt2, moveIt, 0, 100, 300, 400, cl_cube); //all the way to the left
//    
//    Cube cube_temp = new Cube(amt, amt2, moveIt, int(random(0,400)), int(random(0,400)), int(random(0,400)), int(random(0,400)), cl_cube); //all the way to the left
//    cubeArray.add(cube_temp); //<--- that's working now!
  }
  
  if(beat.isHat())
  {
    //println("HAT");
    //cl4 = color(255, 100);
    //cl4 = color(245, 200, 240, 40);
    Square temp = new Square(0.9, cl4);
    cl_cube = color(random(0, 255), random(0, 255), random(0, 255), random(0, 255));
    //Cube cube_temp = new Cube(amt, amt2, moveIt, 0, 100, 300, 400, cl_cube); //all the way to the left
    
    Cube cube_temp = new Cube(amt, amt2, moveIt, int(random(0,400)), int(random(0,400)), int(random(0,400)), int(random(0,400)), cl_cube); //all the way to the left
    cubeArray.add(cube_temp); //<--- that's working now!
  }

  if(beat.isRange( 3, 15, 1))
  {
    Square temp = new Square(0.9, cl);
    squareArray.add(temp); //is this the only time a square is being sent out??
  }  
  
}//draw();

void tunnel()
{
  mX = mouseX;
  mY = mouseY;
  
  //BACKGROUND~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  float diff = mY / 1.56;
  float diff2 = mX / 1.56;
  float diff3 = (400 - (mX % 400))/1.56;
  float diff4 = (400 - (mY % 400))/1.56;
  
  color from1 = color(diff, 255);
  color to1 = color(255, 255);
  color interA = lerpColor(from1, to1, 0.5);
  
  color from2 = color(diff2-55, 255);
  color to2 = color(150, 255);
  color interB = lerpColor(from2, to2, 0.5);
  
  color from3 = color(diff3-150, 255);
  color to3 = color(150, 255);
  color interC = lerpColor(from3, to3, 0.5);
  
  color from4 = color(diff4-100, 255);
  color to4 = color(75, 255);
  color interD = lerpColor(from4, to4, 0.5);
  
  color wacky = blendColor(cl, interA, DARKEST); //MULTIPLY
  color wacky2 = blendColor(cl, interB, DARKEST);
  color wacky3 = blendColor(cl, interC, DARKEST);
  color wacky4 = blendColor(cl, interD, DARKEST);
  
  noStroke();
  stroke(0);
  //stroke(255);
  //fill(interA);
  fill(wacky);
  beginShape();
  vertex(0, 0);
  vertex(mX, mY);
  vertex(400, 0);
  vertex(0, 0);
  endShape();
   
  //fill(interB); 
  fill(wacky2);
  beginShape();
  vertex(0, 0);
  vertex(mX, mY);
  vertex(0, 400);
  vertex(0, 0);
  endShape(); 
  
  //fill(interC);
  fill(wacky3);
  beginShape();
  vertex(400, 0);
  vertex(mX, mY);
  vertex(400, 400);
  vertex(400, 0);
  endShape();
  
  //fill(interD);
  fill(wacky4);
  beginShape();
  vertex(0, 400);
  vertex(mX, mY);
  //vertex(X3, Y3);
  vertex(400, 400);
  vertex(0, 400);
  endShape();
  
  float Xa = lerp(x, mX, 0.9);
  float Ya = lerp(x, mY, 0.9);
  float Xb = lerp(x, mX, 0.9);
  float Yb = lerp(y, mY, 0.9);
  float Xc = lerp(y, mX, 0.9);
  float Yc = lerp(y, mY, 0.9);
  float Xd = lerp(y, mX, 0.9);
  float Yd = lerp(x, mY, 0.9);
  
  //stroke(255, 255, 255);
  strokeWeight(2);
  
  color ugh = blendColor(wacky, wacky2, ADD); //ADD
  color umm = blendColor(wacky3, wacky4, ADD);
  color gross = blendColor(ugh, umm, ADD);
  
  //WHITE SQUARE IN MIDDLE
  //fill(255);
  fill(gross);
  beginShape();
  vertex(Xa, Ya);
  vertex(Xb, Yb);
  vertex(Xc, Yc);
  vertex(Xd, Yd);
  vertex(Xa, Ya);
  endShape(); 
  
}//tunnel();

//save stills on mouse press
void mousePressed() 
{
  counter++;
  imageNumber = Integer.toString(counter);
  saveFrame("squares" + imageNumber + ".tiff");  
  //println("squares" + imageNumber + ".tiff");
}

void stop()
{
  //must close Minim audio library
  song.close();
  minim.stop();
  super.stop();
}

