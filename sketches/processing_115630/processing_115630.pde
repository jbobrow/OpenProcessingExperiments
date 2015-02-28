
float diviA;
int MaxA;
float[] fibArr = new float[150];
float[] fibArrCalc = new float[150];

int count = 0;

void setup() {
  size(500, 500);
  frameRate(10);

/* Fibonacci sequence  */
  fibArr[0] = 1;
  fibArr[1] = 1;
//  MaxA = int(random(1,145));
  MaxA = 148;
for(int i=0; i<MaxA; i=i+1) { 
  fibArr[i+2] = fibArr[i] +  fibArr[i+1];
    background(5,5,5,100);
}

}

void draw() {
  
  bgclr();
  
  // Translate the origin point to the center of the screen
  translate(width/2, height/2); 
  
  strokeWeight(3);
  strokeCap(SQUARE);
  noFill();

    pushMatrix();
  stroke(155-count, 255-count, 155-count, 100);
  rotate(radians(count*-100.25));
  line(1 , 1, 1 + sqrt(fibArr[count]), 1 );
  fill(255);
  textSize(11);
  text( nf(fibArr[count],0,0) , 10+ count*0.9, 0 );
    popMatrix();


  stroke(255);
  textSize(25);  
  text( nf(count,0,0) , 180, 220 ); 
  
  count++;
  if(count >= MaxA){ count = 0;  }

}

void bgclr(){
  noStroke();
  fill(0,0,0,10);
  rect(0,0,width,height);
}

void mousePressed() {
  redraw();
}


