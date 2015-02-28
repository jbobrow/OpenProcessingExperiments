
PImage cap1;
PImage cap2;
PImage cork1;
PImage cork2;
PImage lid1;
PImage lid2;
PImage lid3;
PImage tab1;
PImage tab2;
PFont courier;
String s = "0";
PImage curImage;


void setup() {
  size(640, 480);
  courier = loadFont("CourierNewPSMT-48.vlw");
  textFont(courier);
  cap1 = loadImage("cap1.png");
  //curImage = loadImage("cap2.png");
  cap2 = loadImage("cap2.png");
  cork1 = loadImage("cork1.png");
  cork2 = loadImage("cork2.png");
  lid1 = loadImage("lid1.png");
  lid2 = loadImage("lid2.png");
  lid3 = loadImage("lid3.png");
  tab1 = loadImage("tab1.png");
  tab2 = loadImage("tab2.png");
  textSize(18);
  noLoop();
  //frameRate(0.5);


}

void mousePressed(){
  loop(); 
}

void mouseReleased(){
  noLoop(); 
}

void draw(){
  background(100);
  for(int l = 0; l < 9; l++){
    //translate( 0, 60);
    for(int k = 0; k < 11; k++){

      // text
      int sum = 0;
      for (int i = 5; i < 50; i+=20){
        for(int j = 15; j < 70; j += 20){


          float r = random(1);
          if (r < .5) {
            text("1",i,j);
            sum++;
          } 
          else {
            text("0",i,j);
          }
        }



      }




      println(sum);
      translate(60, 0);
      if (k == 0 && l == 0 ){
        curImage = cap1; 
      } else if (k == 1 && l == 0) {
        curImage = cap2;
      } else if (k == 2 && l == 0) {
        curImage = cork1;
      } else if (k == 3 && l == 0) {
        curImage = cork2;
      } else if (k == 4 && l == 0) {
        curImage = lid1;
      } else if (k == 5 && l == 0) {
        curImage = lid2;
      } else if (k == 6 && l == 0) {
        curImage = lid3;
      } else if (k == 7 && l == 0) {
        curImage = tab1;
      } else if (k == 8 && l == 0) {
        curImage = tab2;
      } else if (k == 9 && l == 0) {
        curImage = cork1;
      } else if (k == 10 && l == 0) {
        curImage = tab1;
      } else if (k == 5 && l == 1) {
        curImage = cork2;
      } else if (k == 4 && l == 2) {
        curImage = cap2;
      } else if (k == 10 && l == 3) {
        curImage = lid1;
      } else if (k == 5 && l == 4) {
        curImage = lid2;
      } else if (k == 10 && l == 4) {
        curImage = tab2;
      } else if (k == 5 && l == 5) {
        curImage = lid3;
      } else if (k == 10 && l == 5) {
        curImage = tab1;
      } else if (k == 5 && l == 6) {
        curImage = lid1;
      } else if (k == 5 && l == 7) {
        curImage = tab1;
      } else if (k == 10 && l == 7) {
        curImage = cap1;
      } else if (k == 4 && l == 8) {
        curImage = tab2;
      } 
      
    


      if ( sum == 1 || sum == 0) {
        pushMatrix();
        scale(.5);
        image(curImage, -200, -130);
        popMatrix();
      } else if ( sum == 2 || sum == 8 ) {
        pushMatrix();
        scale(.3);
        image(curImage, -400, -130);
        popMatrix();
      }
      else if ( sum == 5 || sum == 7) {
        pushMatrix();
        translate( -400, -400);
        scale(.3);
        tint(255, 100);
        fill(255, 5);
        image(curImage, -300, -10);
        popMatrix();

      } 
      else if (sum == 6) {
        pushMatrix();
        scale(random(.1, .6));
        tint(random(0,255), random(0,255), random(0,255), random(100,200));
        fill(255, random(5,200));
        image(curImage, random(-100,50), random(-100,200));
        popMatrix();
      }
      else if (sum == 3) {
        pushMatrix();
        scale(random(.7));
        tint(random(0,255), random(0,255), random(0,255), random(0,100));
        fill(255, random(5,100));
        image(curImage, random(-300,50), random(-300,50));
        popMatrix();
      }

      fill(225, 255);
      noTint();

    }
  
  translate( -660, 60);
   
  }

}


