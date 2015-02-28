
//complementary sketch

void setup () {
  background(0);
  size(400, 400);
}

void draw() {
  noStroke();
  for (int a=0;a<height;a+=40) {
    for (int b=20;b<width-70;b+=70) {
      randomFill(); //fills randomly the matchstickmen and matchstickwomen
      float x=random(2);
      if(x>=1){
         //keeps the count of matchstickmen=matchstickwomen in a random position 
        wmen(a,b);
      }
      else{
        mmen(a,b);
      }
    }
  }
  noLoop();
}

void mmen(float x, float y) {
  pushMatrix();
  translate (x, y);
  ellipse(20, 20, 20, 20);//draws head
  rect(10, 30, 20, 30);//draws body
  rect(15,60,10,10);//draws leg
  popMatrix();
}
// draw matchstickmen

void wmen (float x, float y) {
  pushMatrix();
  translate(x, y);
  ellipse(20, 20, 20, 20);//draws head
  quad(15, 30, 25, 30, 35, 60, 5, 60);//draws body
  rect(10,60,5,10);//draws leg
  rect(25,60,5,10);//draws leg
  popMatrix();
}
//draw matchstickwomen

void randomFill() {
  int randomFill=floor(random(1, 3));
  if (randomFill == 1) {
    fill(0,0,255);
  }
  if (randomFill==2) {
    fill(255, 255, 0);
  }
}
//creates random fill of matchstickmen and matchstickwomen


