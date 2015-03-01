
float[] myNumbers;

void setup() {
  size(450, 450);
  myNumbers=new float[15];
  for (int i=0; i<myNumbers.length; i++) {
    myNumbers[i]=random(5, 200);
    println(myNumbers[i]);
  }
}

void draw() {
  background(255);
  for (int i=0; i<myNumbers.length; i++) {
    float barHeight=25;
   fill(50,250,150);
    rect(0,i*30, myNumbers[i], barHeight);
fill(0,0,255);
    textSize(10);
    text(nf(myNumbers[i],0,1),myNumbers[i]+2,i*30+barHeight/2);
  }
}



