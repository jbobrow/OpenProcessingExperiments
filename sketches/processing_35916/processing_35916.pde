
int x1= 100; //x position bubble1
int x2= 200; //x pos bubble2
int x3= 300; //x pos bubble3
int x4= 400; //x pos bubble4
int y = 450; //y pos all bubbles
int rad= 25; //radius of all bubbles

//setup canvas
void setup() {
  size(500, 500);
  background(0, 150, 250);
  smooth();
}

//Establish face
void draw() {
  background(0, 150, 250);
  //head
  ellipse(250, 250, 300, 300);
  //nose
  triangle(250, 200, 230, 300, 270, 300);

  //eyes
  fill(250, 250, 250);
  ellipse(200, 220, 70, 50);
  ellipse(300, 220, 70, 50);

  //pupils
  fill(0, 0, 0);
  ellipse(200, 220, 20, 20);
  ellipse(300, 220, 20, 20);

  //mouth
  fill(256, 0, 0);
  ellipse(250, 350, 150, 40);
  fill(0, 0, 0);
  ellipse(250, 350, 140, 20);

  //selection bubbles
  fill(250, 250, 250);
  /*for(int i= 0; i< 400; i= i+100) {
   ellipse(i + 100,450,50,50); } */

  //SON OF MAN
  float d = dist(mouseX, mouseY, x1, y);
  if (d < rad) {

    //keep bubbles   
    ellipse(100, 450, 50, 50);
    ellipse(200, 450, 50, 50);
    ellipse(400, 450, 50, 50);
    ellipse(300, 450, 50, 50);

    //pupils
    fill(0, 0, 0);
    ellipse(200, 210, 20, 20);
    ellipse(300, 210, 20, 20);

    //hat
    fill(0, 0, 0);
    curve(200, 550, 140, 70, 360, 70, 300, 550);
    rect(140, 70, 220, 50);
    ellipse(250, 130, 300, 30);
    fill(100, 100, 100);
    rect(140, 110, 220, 10);


    //tie
    fill(250, 10, 10);
    triangle(250, 400, 230, 500, 270, 500);
    triangle(250, 400, 225, 450, 275, 450);

    //apple
    fill(70, 150, 40);
    ellipse(250, 285, 210, 175);
    fill(200, 100, 10);
    rect(250, 160, 10, 40);

    //leaves
    fill(90, 100, 20);
    //bottomleft
    ellipse(200, 175, 100, 30);
    //bottomright
    ellipse(315, 165, 120, 20);
    //topleft
    rotate(radians(30));
    ellipse(370, 20, 120, 20);
    //topright
    rotate(radians(20));
    rotate(radians(10));
    ellipse(220, -135, 100, 30);
  }
  ellipse(100, 450, 50, 50);




  //TOURIST
  float e = dist(mouseX, mouseY, x2, y);
  if (e < rad) {

    //Sun Glasses
    strokeWeight(7);
    fill(0, 0, 0);
    line(200, 220, 300, 220);
    line(200, 220, 110, 200);
    line(300, 220, 390, 200); 
    ellipse(185, 230, 100, 100);
    ellipse(315, 230, 100, 100);
    fill(255);

    //Bubble
    strokeWeight(1);
    ellipse(200, 450, 50, 50);

    //Tourist hat
    fill(256, 200, 100);
    curve(250, 700, 140, 144, 360, 144, 250, 700);
    ellipse(250, 160, 470, 30);
    triangle(250, 405, 230, 420, 245, 430);
    triangle(257, 407, 260, 427, 280, 435);
    curve(250, 300, 70, 170, 250, 400, 400, 450);
    curve(250, 300, 430, 170, 250, 400, 100, 450);
    fill(256, 256, 0);
    rect(140, 140, 220, 10);

    //Sunbloc Nose
    fill(256, 256, 256);
    triangle(250, 200, 230, 300, 270, 300);

    //shine
    if (mousePressed == true) {
      fill(255);
      strokeWeight(1);
      quad(150, 250, 160, 260, 170, 250, 160, 240);
      quad(275, 250, 285, 260, 295, 250, 285, 240);
    }
  }
  ellipse(200, 450, 50, 50);




  //WITCH
  float f = dist(mouseX, mouseY, x3, y);
  if (f < rad) {

    //pupils
    fill(0);
    ellipse(200, 220, 20, 20);
    ellipse(300, 220, 20, 20);
    
    if (mousePressed == true) {
      fill (250, 0, 0);
    }
    ellipse(200, 220, 20, 20);
    ellipse(300, 220, 20, 20);

    //mouth
    fill(50, 100, 50);
    ellipse(250, 350, 150, 40);
    fill(0, 0, 0);
    ellipse(250, 350, 140, 20);

    //wart
    fill(80, 100, 80);
    ellipse(270, 280, 30, 30);

    //witch hat
    fill(0, 0, 0);
    ellipse(250, 160, 470, 30);
    triangle(250, 1, 130, 160, 370, 160);
    fill(100, 0, 100);
    rect(145, 137, 210, 10);
    fill(255);
  }
  ellipse(300, 450, 50, 50);



  //PIRATE
  float g = dist(mouseX, mouseY, x4, y);
  if (g < rad) {

    //eyepatch
    strokeWeight(5);
    fill(0, 0, 0);
    ellipse(200, 220, 80, 80);
    line(200, 220, 125, 170);
    line(200, 220, 375, 170);
    strokeWeight(1);

    /*//Bubble
    fill(255);
    ellipse(400, 450, 50, 50);*/

    //Bandanna
    fill(256, 256, 0);
    curve(200, 550, 140, 144, 360, 144, 300, 550);
    triangle(140, 140, 90, 180, 100, 195);
    triangle(140, 140, 80, 150, 90, 160);

    //face color
    fill(256, 150, 100);

    if (mousePressed == true) {
      //face model
      ellipse(250, 250, 300, 300);

      

      //nose
      triangle(250, 200, 230, 300, 270, 300);

      //eyes
      fill(250, 250, 250);
      ellipse(200, 220, 70, 50);
      ellipse(300, 220, 70, 50);

      //pupils
      fill(0, 0, 0);
      ellipse(200, 220, 20, 20);
      ellipse(300, 220, 20, 20);

      //mouth
      fill(256, 0, 0);
      ellipse(250, 350, 150, 40);
      fill(0, 0, 0);
      ellipse(250, 350, 140, 20);

      //Bandanna
      strokeWeight(1);
      fill(256, 256, 0);
      curve(200, 550, 140, 144, 360, 144, 300, 550);
      triangle(140, 140, 90, 180, 100, 195);
      triangle(140, 140, 80, 150, 90, 160);

      //NEW eyepatch
      fill(0, 0, 0);
      strokeWeight(5);
      ellipse(300, 220, 80, 80);
      line(300, 220, 125, 170);
      line(300, 220, 375, 170);
      
      //face color
      fill(256, 150, 100);

      //Bubble
      fill(255);
      strokeWeight(1);
      ellipse(400, 450, 50, 50);
    }
    fill(255);
  }
  ellipse(400, 450, 50, 50);


  //face color
  fill(256, 150, 100);
}


