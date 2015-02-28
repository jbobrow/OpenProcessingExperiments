
class Creature {

  float x;
  float y;

  Creature (float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display () {
    //legs
    stroke(5,90,26);
    strokeWeight(4);
    line(x-10,y+40,x-20,y+60);
    line(x+10,y+40,x+20,y+60);

    //arms
    stroke(5,90,26);
    strokeWeight(3);
    line(x-10,y+20,x-30,y);
    line(x+10,y+20,x+30,y);
    //body
    strokeWeight(2);
    stroke(5,90,26);
    fill(15,240,68);
    ellipse(x,y,30,100);

    //head
    strokeWeight(2);
    stroke(5,90,26);
    fill(15,240,68);
    ellipse(x,y-30,60,60);

    //eyes
    strokeWeight(1);
    fill(255);
    ellipse(x-15,y-30,20,20);
    ellipse(x+15,y-30,20,20);
    fill(0);
    ellipse(x-15,y-30,10,10);
    ellipse(x+15,y-30,10,10);

    //mouth
    strokeWeight(2);
    line(x-10,y-10,x+10,y-10);
  }
}


