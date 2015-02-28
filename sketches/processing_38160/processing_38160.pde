
//declare!
int rightX=0;


void setup() {
  size(500, 500);
  smooth(); 
  background(255);
}

void draw() {
  {
    background(255);  
    smooth();
    stroke(0);
    noCursor();

    //apartment
    strokeWeight(3);
    fill(200);
    rect(30, 280, 250, 200); //wall
    fill(240);
    quad(30, 280, 280, 280, 310, 210, 60, 210); //ceiling
    fill(190);
    quad(280, 280, 310, 210, 310, 410, 280, 480); //sidewall

    //windows
    fill(255);
    strokeWeight(1);
    rect(70, 320, 20, 20); //left 
    rect(150, 320, 20, 20);//middle 
    rect(225, 320, 20, 20);//right 

    //frontdoor
    strokeWeight(1);
    fill(192, 129, 66);
    rect(130, 400, 50, 80);

    //doorknob
    strokeWeight(3);
    point(140, 440);

    //myself moving
    //my nigiri hair
    strokeWeight(1);
    fill(0);
    triangle(mouseX, mouseY-20, mouseX-20, mouseY, mouseX+20, mouseY);
    //my face
    fill(255);
    ellipse(mouseX, mouseY, 20, 20);
    //my body
    line(mouseX, mouseY+10, mouseX, mouseY+40);
    //my arms
    line(mouseX, mouseY+20, mouseX-20, mouseY+15);//left
    line(mouseX, mouseY+20, mouseX+20, mouseY+15);//right
    //my legs
    line(mouseX, mouseY+40, mouseX-10, mouseY+70);//left
    line(mouseX, mouseY+40, mouseX+10, mouseY+70);//right
    //my hair
    /*this is previous code of myself
     strokeWeight(1);
     fill(0);
     triangle(400,360,380,380,420,380);
     
     //my face
     fill(255);
     ellipse(400,380,20,20);
     //my body
     line(400,390,400,420);
     //my arms
     line(400,400,380,395);//left
     line(400,400,420,395);//right
     
     //my legs
     line(400,420,390,450);//left
     line(400,420,410,450);//right
     */

    //happiness
    noStroke();
    fill(250-mouseX/2, mouseY/2, 100, height);
    ellipse(400, 300, 20, 20);//middle
    fill(100, 255-mouseX/2, mouseY/2, mouseY);
    ellipse(360, 320, 20, 20);//left
    fill(100+mouseY/2, 0, 250-mouseX/3, mouseY);
    ellipse(440, 320, 20, 20);//right

    if (keyPressed) {
      //if (keyPressed) {
      //new happiness
      fill(250-mouseX/2, mouseY/2, 100, height);
      ellipse(300, 200, 20, 20);//middle
      fill(100, 255-mouseX/2, mouseY/2, mouseY);
      ellipse(260, 120, 20, 20);//left
      fill(100+mouseY/2, 0, 250-mouseX/3, mouseY);
      ellipse(340, 220, 20, 20);//right

      //opened door
      strokeWeight(1);
      fill(192, 129, 66);
      quad(180, 400, 180, 480, 215, 500, 215, 420);

      //inside door
      fill(0);
      rect(130, 400, 50, 80);

      //rect for erase previous happiness
      fill(255);
      stroke(255);
      rect(350, 280, 100, 60);
    }

    //mouseclicking rainbow
    if (mousePressed) {
      stroke(0);

      fill(255, 0, 0);
      rect(0, 50, rightX, 10);//red

      fill(255, 122, 0);
      rect(0, 60, rightX, 10); //orange

      fill(255, 255, 0);
      rect(0, 70, rightX, 10);//yellow

      fill(0, 255, 0);
      rect(0, 80, rightX, 10); //green

      fill(0, 0, 255);
      rect(0, 90, rightX, 10);//blue

      fill(0, 0, 200); 
      rect(0, 100, rightX, 10); //dark blue

      fill(255, 0, 255);
      rect(0, 110, rightX, 10);//violet

      rightX=rightX+1;

      println("Apartment Hunting Success!!");
    }
  }
}



