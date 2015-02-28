
int counter;
PImage b;
PImage bground;//found on deviantart!
PImage flower;
PImage dirt;
int prevSec;
int millisRolloverTime;
int flowers=0;
int[] heights;

// Fetch the current time
int H;
int M;
int S ;
int firstM;
int hourclear=minute()+1;

void setup() {
  size(600, 550);
  b = loadImage("bun.png");
    bground = loadImage("bground.png");
    flower=loadImage ("flower.png");
    dirt=loadImage ("dirt.png");
  background (0, 234, 201);
  firstM=minute();
  millisRolloverTime = 0;
  heights= new int[60];
  for (int i=0; i<60; i++)
  {
    heights[i]=round(random (445,455));
  }

  firstDraw(firstM);
}

void draw() {
  smooth();
  
  rect (0, 450, 600, 450);
 for (int i = 450; i<=600; i++) {
 float bluest=map(i, 450, height, 5,50);
  float greenest=map(i, 450, height, 110, 150);
 stroke(95, greenest, bluest/5);
  line(0, i, width, i);
}
  //background(100,100,100);
 
  image(bground, 0, 0, width, height+100);
 

  // Fetch the current time
  H = hour();
  M = minute();
  S = second();



  
  
   //ground
  stroke(57, 33, 9);  
  fill(57, 33, 9);


  // Reckon the current millisecond, 
  // particularly if the second has rolled over.
  // Note that this is more correct than using millis()%1000;
  if (prevSec != S) {
    millisRolloverTime = millis();
  } 
  prevSec = S;
  int mils = millis() - millisRolloverTime;

if (minute()!=0){
for (int i=0; i<M; i++){
  PLANT2 (i*10, heights[i]);
} 
}else{
  
for (int i=0; i<=(60-(counter/10)); i++){
   PLANT2 (i*10, round(random(445, 455)));
}

}

 


  PLANT (10*(M), 450, S);

  if (M==0) {
    counter+=1;
    RABBIT(width-counter+((H*5+50)/2), int(400+sin(counter/3)*20), (H*5+50));
  }
  else
  {
    counter=-50;
  }




}







void firstDraw(int h)
{
  for (int i = 1;i<h;i++)
  {

    PLANT(10*(i), 450, 60);
  }


}



void PLANT( int x, int y, int h) {

  strokeWeight (2);
  stroke (97, 137, 84);
  noFill();
  beginShape();
  curveVertex(0+x, 0+y-h);
  curveVertex(5+x, 0+y-h);
  curveVertex(3+x, 0+y-h/2);
  curveVertex(5+x, 5+y-h/4);
  curveVertex(3+x, 10+y);
  curveVertex(3+x, 10+y);
  endShape();

  noStroke();
  fill (255, 209, 185);
  ellipse (x, 10+y, 10, 5);
  if (h>=59) {

      
image (flower,x-5, y-80, 50, 50);


  }
}
void RABBIT (int x, int y, int size) {
  fill (0, 234, 201);
  imageMode (CENTER);
  image(b, x, y, size, size);
  imageMode(CORNER);
}

void FLOWER (int x, int y){
  fill (255, 100, 100);
     for (int i=0; i<=20; i++) {
   
    }
 
  
}




void PLANT2( int x, int y) {

  strokeWeight (2);
  stroke (97, 137, 84);
  noFill();
  beginShape();
  curveVertex(0+x, 0+y-60);
  curveVertex(5+x, 0+y-60);
  curveVertex(3+x, 0+y-30);
  curveVertex(5+x, 5+y-15);
  curveVertex(3+x, 3+y);
  curveVertex(3+x, 3+y);
  endShape();

  noStroke();
 
 
    
  

image (flower,x-5, y-80, 50, 50);

  }

/// could achiceve ideal flower situation by if else and making another image, aka grows ant then pops into something else. 


