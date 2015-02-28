
boolean ellipseon; 
boolean clear = false;
float timer = 15;
float Xpos, Ypos, Xneg, Yneg;
ArrayList direction;


void setup() {
  size(500, 500);
  smooth();
  direction = new ArrayList();
  direction.add("hold");
}

void draw() {

  if (clear == false) {

    background(255);
  }

  if (ellipseon == true) {
    fill(255);
    strokeWeight(1);
    ellipse(width/2, height/2, 100, 100);
  }

  Xpos = pmouseX - mouseX;
  Ypos = pmouseY - mouseY;
  Xneg = -(pmouseX - mouseX);
  Yneg = -(pmouseY - mouseY);


  println(direction);



  int a = direction.size();

  //up////////////////////////////////
  if (direction.get(a-1) != "U") {

    if ((pmouseY > mouseY)&&((pmouseX-mouseX)<0)&&(Ypos>Xneg)) {

      direction.add("U");
    }
  }
  if (direction.get(a-1) != "U") {

    if ((pmouseY > mouseY)&&((pmouseX-mouseX)>0)&&(Ypos>Xpos)) {

      direction.add("U");
    }
  }


  //down////////////////////////////////
  if (direction.get(a-1) != "D") {
    if ((pmouseY < mouseY)&&((pmouseX-mouseX)<0)&&(Yneg>Xneg)) {
      direction.add("D");
    }
  }

  if (direction.get(a-1) != "D") {
    if ((pmouseY < mouseY)&&((pmouseX-mouseX)>0)&&(Yneg>Xpos)) {
      direction.add("D");
    }
  }

  //left////////////////////////////////
  if (direction.get(a-1) != "L") {
    if ((pmouseX > mouseX)&&((pmouseY-mouseY)<0)&&(Xpos>Yneg)) {
      direction.add("L");
    }
  }
  if (direction.get(a-1) != "L") {
    if ((pmouseX > mouseX)&&((pmouseY-mouseY)>0)&&(Xpos>Ypos)) {
      direction.add("L");
    }
  }

  //right////////////////////////////////
  if (direction.get(a-1) != "R") {
    if ((pmouseX< mouseX)&&((pmouseY-mouseY)<0)&&(Xneg>Yneg)) {
      direction.add("R");
    }
  }
  if (direction.get(a-1) != "R") {
    if ((pmouseX< mouseX)&&((pmouseY-mouseY)>0)&&(Xneg>Ypos)) {
      direction.add("R");
    }
  }

  //Gesture set up///////////////////////////////////////


  if (direction.size()>=6) { 
    if ((direction.get(a-5) == "R") && (direction.get(a-4) == "D") && (direction.get(a-3) == "L")&& (direction.get(a-2) == "U")&& (direction.get(a-1) == "R")) {
      ellipseon= true;
    }
  }

  if (direction.size()>=6) { 
    if ((direction.get(a-5) == "L") && (direction.get(a-4) == "D") && (direction.get(a-3) == "R")&& (direction.get(a-2) == "U")&& (direction.get(a-1) == "L")) {
      ellipseon= true;
    }
  }

  if (direction.size()>=4) {
    if ((direction.get(a-3) == "R") && (direction.get(a-2) == "L") && (direction.get(a-1) == "R")) {
      ellipseon = false;
      background (255);
    }
  }



  if ((Xpos > 0)|| (Ypos > 0)|| (Xneg > 0)|| (Yneg > 0)) {
    timer = 15;

    strokeWeight(10);
    line(mouseX, mouseY, pmouseX, pmouseY);
    clear = true;
  }


  if ((Xpos == 0)&& (Ypos ==0)&& (Xneg == 0)&& (Yneg == 0)) {
    timer -= 1;



    if (timer <= 0) {   
      for (int i = direction.size()-1; i>=1; i --) {
        direction.remove(i);
        clear = false;
      }
    }
  }
}



