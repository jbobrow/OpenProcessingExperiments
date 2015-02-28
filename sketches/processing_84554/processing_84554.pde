
//Random Quadrilateral, Dan Olson 2013

float x1,y1,x2,y2,x3,y3,x4,y4;
int randswitch;
int timer;
float randMillis;

void setup() {
  size(200,200);
  background(150);
  randomQuad();
}

void draw() {
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
}

void randomQuad() {
  
  fill(random(255),random(255),random(255), 25);
  
  int quadDivision = 1; 
  int bufferAmount = 0; //Buffer amount is an optional feature
  
  x1 = random((width/2)+bufferAmount,width)/quadDivision;
  y1 = random(0,(height/2)-bufferAmount)/quadDivision;
  
  //println("x1: " + x1 + " y1: " + y1);
  
  x2 = random(0,(width/2)-bufferAmount)/quadDivision;
  y2 = random(0,(height/2)-bufferAmount)/quadDivision;
  
  //println("x2: " + x2 + " y2: " + y2);

  x3 = random(0,(width/2)-bufferAmount)/quadDivision;
  y3 = random((height/2)+bufferAmount,height)/quadDivision;
  
  //println("x3: " + x3 + " y3: " + y3);
   
  x4 = random((width/2)+bufferAmount,width)/quadDivision;
  y4 = random((height/2)+bufferAmount,height)/quadDivision;
  
  //println("x4: " + x4 + " y4: " + y4);
  
  /*Default: (Simple: not self-intersecting)
             
             (Complex: self intersecting --
              reverse x1,y1 with x2,y2
              or x3,y3 with x4,y4) */
  
   beginShape();
      
     vertex(x1,y1); //Shape begins in second quadrant
     vertex(x2,y2); //1st Quadrant
     vertex(x3,y3); //3rd Quadrant
     vertex(x4,y4); //4th Quadrant
   endShape(CLOSE);
  
}

void mousePressed(){ 
  if(mouseButton == RIGHT) {
  noLoop(); //Halts the program
  endRecord();
}  else { 
  setup();
  loop();
  }  
}
