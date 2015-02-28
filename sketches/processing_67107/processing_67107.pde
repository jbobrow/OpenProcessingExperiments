
float[] posX=new float[9];
float[] posY=new float[9];
float[] velY=new float[9];
float startingTime=0;
float interval=1000;
float interval2=2000;
float interval3=3000;
int time1=3000;
float posY1;
float posX1;



void setup() {
  size(500, 500);
  smooth();
  noStroke();
  posX1=width;
  posY1=300;
}



void draw() {

  background(80, 130, 200);
  posX1--;

  rect(posX1, 300, 100, 200);


  //  if (currentTime==interval1){
  //    fill(0);
  //    ellipse(width/2,height/2,20,20);
  //    ellipse(width/2-10,height/2,20,20);
  //    ellipse(width/2-20,height/2,20,20);
  //  }
  //    
  if (millis()-startingTime<interval) {
    ellipse(width/2, height/2, 80, 80);
    ellipse(width/2, height/2, 40, 40);
    ellipse(width/2, height/2, 20, 20);
  }


  if (millis()-startingTime>interval&& millis()-startingTime<interval2) {
    ellipse(width/2, height/2, 40, 40);
    ellipse(width/2, height/2, 20, 20);
  } //if true, draw circle

  if (millis()-startingTime>interval2&& millis()-startingTime<interval3) {
    ellipse(width/2, height/2, 20, 20);
 
  }


  if (millis()-startingTime>time1) {

    for (int i=0; i<9;i++) {
      posX[i]=50*(1+i);

   PImage myImage = loadImage("knowmeicon.png"); 
image(myImage, posX[i],posY[i],50,40 ); // draw the image
      fill(0);
    }


    for (int i=0; i<9;i++) {
      velY[i]=random(1, 10);
    }
    for (int i=0; i<9;i++) {
      posY[i]=posY[i]+velY[i];
    

    if (posX[i]>= posX1 && posX[i]<=posX1+100 && posY[i]>=300) {
      velY[i]=velY[i]*(-1);
    }
    }
  }
}





