
int slot = 2000;
float x[] = new float[slot];
float y[] = new float[slot];
int numpoints = 0;
boolean animate = false;
float firsttouchx = 0;
float firsttouchy = 0;
int firsttouch = 0;
float brushx = 0;
float brushy = 0;

void setup() {
  size(900, 600);
 
}



void mousePressed(){
  numpoints=0;
  firsttouch=0;
  firsttouchx = mouseX;
  firsttouchy = mouseY;
  animate = false;
}
void mouseReleased(){
  
  animate = true;
}
void mouseDragged(){
  x[numpoints] = mouseX - pmouseX;
  y[numpoints] = mouseY - pmouseY;
  numpoints = numpoints + 1;
}

  void draw() { 
  smooth(8);
  background(225, 225, 225);
  pushMatrix();
  translate(800,500);
  noFill();
  stroke(175,15,15);
  strokeWeight(5);
  rect(0,0,80,80);
  line(35,10,15,25);
  line(15,25,15,60);
  line(15,40,35,40);
  line(15,60,35,60);
  line(45,15,45,70);
  line(45,15,65,15);
  line(65,15,65,55);
  line(65,55,53,50);
  popMatrix();
 
 if (animate && numpoints > 1){
   firsttouchx += x[firsttouch];
   firsttouchy += y[firsttouch];
   if (firsttouchx > width){
     firsttouchx = 0;
   }
     else if(firsttouchx < 0){
       firsttouchx = width;
     }
     else if(firsttouchy > height){
       firsttouchy = 0;
     }
     else if(firsttouchy < 0){
         firsttouchy = height;
     }
     firsttouch++;
     if(firsttouch >= numpoints){
       firsttouch = 0;
     }
 }
 pushMatrix();
 brushx = firsttouchx;
 brushy = firsttouchy;
 mainbrush(firsttouch, numpoints);
 mainbrush(0, firsttouch);
 popMatrix();
}

 void mainbrush(int from, int to){
    for(int i = from; i <to; i++){
    pushMatrix();
    noFill();
    stroke(0);
    strokeWeight(20 -dist(brushx, brushy, brushx + x[i], brushy + y[i])/2);
    line(brushx, brushy, brushx + x[i], brushy + y[i]);
    popMatrix();
    pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(brushx, brushy, brushx + x[i], brushy + y[i])/2 +random(5,10) );
    line(brushx, brushy, brushx + x[i], brushy + y[i]);
    popMatrix();
    pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(brushx, brushy, brushx + x[i], brushy + y[i])/2 +random(5,10) );
    line(brushx, brushy, brushx + x[i], brushy + y[i]);
    popMatrix();
    pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(brushx, brushy, brushx + x[i], brushy + y[i])/2 +random(5,10) );
    line(brushx, brushy, brushx + x[i], brushy + y[i]);
    popMatrix();
    pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(brushx, brushy, brushx + x[i], brushy + y[i])/2 +random(5,10) );
    line(brushx, brushy, brushx + x[i], brushy + y[i]);
    popMatrix();
    pushMatrix();
    noFill();
    stroke(10, random(30,40));
    strokeWeight(20 -dist(brushx, brushy, brushx + x[i], brushy + y[i])/2 +random(5,10) );
    line(brushx, brushy, brushx + x[i], brushy + y[i]);
    popMatrix();
    brushx += x[i];
    brushy += y[i];
    }
}
