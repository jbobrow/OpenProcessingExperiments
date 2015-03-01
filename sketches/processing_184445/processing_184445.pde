
///Using width, height, and margin - Difficult 
void setup() {
  size(500, 500);
  background(0);

}
void draw () {
  int x=50;
  //int m=width/10; -> can replace margin with width 
  //Stay away from static numbers!!
  stroke (random (255), random (255), random (255)); //line
  line(random(0+x,width/2-x),random(x,width/2-x), random(0+x,width/2-x), random(x,width/2-x)); //1st top box
  line(random(width/2+x,width-x), random(x,width/2-x), random(width/2+x,width-x), random(x,width/2-x)); //2nd top box
  line(random(0+x,width/2-x), random(height/2+x,height-x), random(0+x,width/2-x), random(height/2+x,height-x)); //3rd bottom box
  line(random(width/2+x,width-x), random(height/2+x,height-x), random(width/2+x,width-x), random(height/2+x,height-x)); //4th bottom box

}



