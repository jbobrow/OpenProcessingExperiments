
class Creature {
  float x, y;
  float horz = random(20);
  float vert = horz - 10;
  float mouthSide = 0;
  float r, bl, g, a;
  float wO1x, wO1y,wO2x, wO2y; //wing size
  //set up wing's global variables
  int hours = 1;
  float angle = (PI/2)/hours;
  int count = 0;
  boolean b;

// Creature(float re, float gr, float blu, float al, float 1x, float 1y, float 2x, float 2y) {
//    r = re;//red
//    g = gr;//green
//    bl = blu;//blue
//   a = al;//alpha
//}  
 
  Creature(float re, float gr, float blu, float al) {
    r = re;//red
    g = gr;//green
    bl = blu;//blue
    a = al;//alpha
      wO1x = random(60, 120);
    wO1y = random(60, 120);
    wO2x = random(60, 120);
    wO2y = random(60, 120); 
  }
  
 

  //display critter to window
  void display(float xPos, float yPos){

    //make critter dude
    pushMatrix();
    translate(xPos, yPos);
    flap();
    noFill();
    //rect(x, y, horz, vert);

    //make legs
    beginShape();
    stroke(255);
    strokeWeight(1);
    line(-horz/2, 0, -horz/2 - 10, 0);
    line(-horz/2 - 10, 0, -horz/2 - 10, -vert/2);
    endShape();

    beginShape();
    line(horz/2, 0, horz/2 + 10, 0);
    line(horz/2 + 10, 0, horz/2 + 10, 20);
    endShape();

    //make body
    // println("r : " + r + " g : " + g + " bl : " + bl); 
    fill(255-r, 255-g, 255-bl);
    ellipse(0, 0, horz, vert);//body

    fill(255);
    ellipse(-10, -5, 15, 10);//left eye
    ellipse(10, -5, 15, 10);//right eye
    popMatrix();

    if(frameCount%12 == 0) {
      mouthSide = random(2);
    }

    if(mouthSide > 1){
      pushMatrix();
      translate(xPos, yPos);
      for(float i = -horz/2; i < 0; i+=3){
        stroke(255);
        line(0+i+3, 10, i+4, 2);
        line(0+i+4, 2, i+5, 10);
      } 
      fill(0);
      ellipse(-15, -5, 5, 5);//left eyeball 
      ellipse(10, -6, 5, 5);//right eyeball
      popMatrix();
    }

    if(mouthSide < 1){
      pushMatrix();
      translate(xPos-10, yPos-10);
      stroke(255);
      for(float i = horz/2; i >0 ; i-=3){
        line(0+i+3, 22, i+4, 14);
        line(0+i+4, 22, i+5, 14);
      } 
      fill(0);
      ellipse(0, 4, 5, 5);//left eyeball 
      ellipse(17, 4, 5, 5);//right eyeball
      popMatrix();
    }
  }
  void flap(){
    //flap code follows:
    float ratiation = 2*PI-angle*count+45;

    noStroke();

    fill(r, g, bl, a);

    if(count<0){
      b = true;
    }
    if(count > hours){
      b = false;
    }

    if(b == false){
      //draw wing
      pushMatrix();

      translate(x,y-vert/2+8);//positions wing
      rotate(ratiation);//angle of rotation of wing
      ellipse(0, -50, wO1x, wO1y); //size of wing (x, y values should stay constant)
      popMatrix();

      pushMatrix();
      translate(x,y-vert/2);
      rotate(ratiation);
      ellipse(0, -50, wO2x, wO2y); 
      popMatrix();
      count++;
    }

    if(b == true){
      //draw wing
      pushMatrix();
      translate(x,y-vert/2+8);
      rotate(-2*PI-angle*count+45);
      ellipse(0, -50, wO1x, wO1y); 
      popMatrix();
      count--;

      pushMatrix();
      translate(x,y-vert/2);
      rotate(-2*PI+angle*count+45);
      ellipse(0, -50, wO2x, wO2y); 
      popMatrix();
      count--;
    } 


  }
}

