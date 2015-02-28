
/* ======================================================
Aurthor: Farbod Fathalipouri,
Student ID: 373457, 
Natural System Studio, University of Melbourne
  
NO COPYRIGHT!
welcome to copy, modify and distribute any way you want!
======================================================  */
  int x =screen.height/10;
  int y =screen.height/10;
  
void setup(){
size(screen.width,screen.height/5);
smooth();
}
void draw(){
  int w1 =height/5;
  int w2 =height/21;
  int h1 =height/5;
  int h2 =height/21;
  int toll=height/4;
  ellipseMode(CENTER);
  fill(int(random(255)),int(random(255)),(int)random(255));
  ellipse(x,y,w1,h1);
  fill(255);
  ellipse(x,y,w2,h2);
  
  x=x+toll;
}
void keyPressed() {
if (key == 71){
      saveFrame();
  //  if (key == 32) {    //reset the array list
//    CircleCollection = new ArrayList();
//  } else if (key == 8 || key == 127) {   //remove the most recent circle by pressing delete or back space
//    CircleCollection.remove(CircleCollection.size()-1);
//  }else if (key == 71){
//    saveFrame();
  }
}

