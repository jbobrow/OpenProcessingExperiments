
/*
 * Vassarely's Zebras
 *  kof,12
 *
*/

PShape zebra, stripes[];

float speed1 = 80.0;
float speed2 = 30.0;

void setup(){

  size(600,700);
  zebra=loadShape("zebry.svg");

  stripes = new PShape[zebra.getChildCount()];

  for(int i = 0 ; i < zebra.getChildCount();i++){
    stripes[i] = zebra.getChild(i);
    stripes[i].disableStyle(); 
  }

  noStroke();

  colorMode(HSB);
  smooth();
  background(22);
}


void draw(){
  fill(0,80);
  rect(0,0,width,height);//background(22);
  for(int i =0 ; i < stripes.length;i++){

    strokeWeight(noise(frameCount/20.0)*50);
    stroke(0,7);

    stripes[i].resetMatrix();
    stripes[i].translate(noise(frameCount/30.0+i/5.0,0)*10,noise(0,frameCount/30.0+i/5.0)*10);

    fill(255,noise(frameCount/30.0+i/20.0)*200);


    stripes[i].draw(g);
  }

}

