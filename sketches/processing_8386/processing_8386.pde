

int[] frequency = {
  110,220,440,880,65,131,262,523,82,165,330,659,124,247,494};
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioOutput out;

Dot D; // here is a variable called D of the type Dot that we have created
ArrayList Dots; // a bucket of things, in this case it'll have dots
int numDots = 25; // the number of dots might vary
int neighbour_call_threshhold= 2;
int neighbour_count=0;
int range_of_hearing = 120;
float call_volume = 0.05;
Dot draggedDot = null;

void setup(){
  smooth();
  size (800,800);
  //frameRate(20);
  //colorMode(HSB);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);

  //background (100);
  background(0);


  Dots = new ArrayList();
  makeDots(); //make the dots




}

void draw(){


  background(80);
  stroke(255);
  fill(220);
  rect (0,0, 35,35);
  rect (0,height-35,35,35);
  fill(255);
  rect (15,10,5,15);
  rect (10,15,15,5);
  rect (10,height-20,15,5);
  for (int i=0;i<Dots.size(); i++){
    Dot drawDot = (Dot) Dots.get(i); // (Dot) declares that it is a Dot
    drawDot.run(Dots, i);

  }


}

void makeDots(){
  for (int i=0; i<numDots; i++){
    PVector pos = new PVector(random(range_of_hearing/2,width-range_of_hearing/2),random(range_of_hearing/2,height-range_of_hearing/2)); //make a new PVector
    Dot newDot = new Dot (pos); // make a new dot with the position 'pos'
    Dots.add(newDot); // add newDot to the arraylist
  }
}

void keyPressed(){
 
  
  if (key == 's'){//if the last key pressed was s
    save("swarm" + millis() + ".jpg");//save as a jpg file
  }
    

  if (keyCode == UP) neighbour_call_threshhold++;
  if (keyCode == DOWN) neighbour_call_threshhold--;

  if (keyCode == LEFT) range_of_hearing--;
  if (keyCode == RIGHT) range_of_hearing++;


  println("thresh: " + neighbour_call_threshhold);
  println("range: " + range_of_hearing);
  
  
  
  
}

void stop(){
  out.close();
  minim.stop();
  super.stop();
}



void dragDots(){   
  PVector mousePos = new PVector(mouseX,mouseY);
  for (int i=0; i<Dots.size(); i++){ 
    // for every dot, run the following code
    Dot otherDot = (Dot) Dots.get(i); 
    // get another dot from the array
    float distance = PVector.dist(mousePos, otherDot.position); 
    // ID distance between
    if (distance < otherDot.dotSize){
      draggedDot = otherDot; // make the dragged dot be otherdot
      draggedDot.calling=true;
    } 
  }
}


void mousePressed(){
  dragDots();
  if (draggedDot != null) draggedDot.calling = true;
  if (mouseX < 50 && mouseY < 50){ // if the mouse is in the top-left corner...
    PVector pos = new PVector(mouseX,mouseY); // make a new PVector
    Dot newDot = new Dot (pos); // make a new dot with the position 'pos'
    Dots.add(newDot); // add newDot to the arraylist
    draggedDot = newDot; // make the new dot draggable as soon as it's created
    newDot.calling=true; // make the new dot announce its arrival
  }
}

void mouseDragged(){
  if (draggedDot != null){ // if  we have a dragged dot
    draggedDot.position.x = constrain(mouseX,0,width);
    draggedDot.position.y = constrain(mouseY,0,height);
  }
}

void mouseReleased(){
  if (draggedDot == null) return; // stop this function
  if (draggedDot.position.x <35 && draggedDot.position.y  >height-35) {
    //   draggedDot.dotSize = max(20,dotSize-(range_of_hearing/call_duration));
    draggedDot.call_sound.setAmp(0);
    Dots.remove(draggedDot);
    // kill the dot!
  }
  draggedDot = null; // turn off the dragged dot
}









