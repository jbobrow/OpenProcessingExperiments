
//import processing.pdf.*;

void setup()
{
 // size(300,300, PDF, "braceletTest4.pdf");
  size(300,300);
  smooth();
}

void draw() {
  background(255);
  int shapeSize =85;
  float shade = 0;

  newShape(shapeSize, shade);
  
  frameRate(5);
    //Exit the program 
  //println("Finished.");
  //exit();


}

void newShape(int shapeSize, float shade){
  float xoff = 0;
  //closer to 1 gives more geometric shapes, closer to 0 gives more leaf/flower like shapes
  float xincrement =.125; 

  float radianStart = 0;
  float radianInc=.0625;
  
  frameRate(5);

  
  if (shapeSize>3){
  beginShape();
  while (radianStart<=TWO_PI) {
    float n = shapeSize+noise(xoff)*shapeSize;

    int c = int(noise(shade)*200);
    
      if (key == 'o' || key == 'O') {
      //brown gradients
      fill(c,c/2,c/3,c*.75);
      }
     else if  (key == 'b' || key == 'B') {
       //blue gradients
       fill(0,c/3,c,c*.95);
    }
     else if  (key == 'p' || key == 'P') {
       //purple gradients
       fill(c,c/3,c,c*.95);
    }
    
    else{
         //sepia gradients
     fill(c,c,c, c*.75); 
    
    }
  
   noStroke();
    //random
    //arc(100, 100,random(95,100),random(95,100), radianStart,radianStart+radianInc);

    float x = width/2+cos(radianStart)*n;
    float y = height/2+sin(radianStart)*n;
    vertex(x,y);
    radianStart =  radianStart+ radianInc;
    xoff += xincrement;
  }
  endShape(CLOSE);

  
  shapeSize *= .9;
  shade+=.9;
  
 newShape(shapeSize, shade) ;
  }
}

