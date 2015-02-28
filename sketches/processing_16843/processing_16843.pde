
PImage opening, img1,img2, img3, fish2, cloud, heart,seamustard01, seafood1 ;
int card = 0; 
int x = -20;
int b = 1;
int speed = 3;
int direction = 1;
float radius = 0.5;
float offset = 60;
float scalar = 10;
float speed1 = 0.05;
float angle = 0.0;
float angleDirection = 1;



void setup() {
  size(739, 520);
  smooth();
  noStroke();
  noCursor();
  opening = loadImage("opening.jpg");
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
  seamustard01 = loadImage("seamustard01.png");
  seafood1 = loadImage("seafood1.png");
  fish2 = loadImage("fish2.png");
  cloud = loadImage("cloud.png");
  heart = loadImage("heart.png");
}


void draw() {

  if (card == 0) {  

    image (opening, 0, 0,739, 528);
    //fish mouse
    fish2();
  }


  else if (card == 1) {


    // seamustard
    b += speed * direction; 
    if ((b > 30 ) || (b < 0)) {
      direction = -direction;
    }
    if (direction == 1) {
      image(img1, 0,0,739,528);
    } 
    else {
      image(img2, 0,0,739,528);
    }

    //fish2
    x -= speed;
    image(fish2, x,0,818,384);
    image(fish2, x+width,0,818,384);
    image(fish2, x+width+width,0,818,384);
    image(fish2, x+width+width+width,0,818,384);
    image(fish2, x+width+width+width+width,0,818,384);
    image(fish2, x+width+width+width+width+width,0,818,384);



    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin5(230, 100,1);
    popMatrix();




    // yellow fish & red fish

    //red
    pushMatrix(); 
    if((mouseX > 150) && (mouseX < 350) && (mouseY > 80) && (mouseY < 120)) {    
      noStroke();
      fill(139,51,51);
      ellipse ( 220,100, 75, 40); 
      arc (280, 100, 50, 30,HALF_PI,PI+HALF_PI);
      fill(255);
      ellipse (200, 100,7,7);
    }    
    else {
      noStroke();
      fill(255,55,0);
      ellipse ( 220,100, 75, 40); 
      arc (280, 100, 50, 30,HALF_PI,PI+HALF_PI);
      fill(255);
      ellipse (200, 100,7,7);
    }

    popMatrix();

    //yellow
    pushMatrix(); 
    if((mouseX > 450) && (mouseX < 550) && (mouseY > 50) && (mouseY < 150)) {    
      noStroke();
      fill(185,177,0);
      ellipse ( 520,100, 75, 40); 
      arc (580, 100, 50, 30,HALF_PI,PI+HALF_PI);
      fill(255);
      ellipse (500, 100,7,7);
    }
    else {
      noStroke();
      fill(255,221,31);
      ellipse ( 520,100, 75, 40); 
      arc (580, 100, 50, 30,HALF_PI,PI+HALF_PI);
      fill(255);
      ellipse (500, 100,7,7);
    }
    popMatrix();
    
    
    
    //white
    pushMatrix(); 
    if((mouseX > 300) && (mouseX < 400) && (mouseY > 65) && (mouseY < 135)) {    
      noStroke();
      fill(225);
      ellipse ( 370,100, 75, 40); 
      arc (430, 100, 50, 30,HALF_PI,PI+HALF_PI);
        fill(104,152,208);
      ellipse (350, 100,7,7);
    }
    else {
      noStroke();
      fill(255);
      ellipse ( 370,100, 75, 40); 
      arc (430, 100, 50, 30,HALF_PI,PI+HALF_PI);
      fill(104,152,208);
      ellipse (350, 100,7,7);
    }
    popMatrix();


    if((mouseX > 100) && (mouseX < 280) && (mouseY > 240) && (mouseY < 460)) {
      tint(99,206,0);
      image(seamustard01, 115,244,157,211);
    }
    else {
      noTint();
      image(seamustard01, 115,244,157,211);
    }


    pushMatrix(); 
    //fish
    fish();
    popMatrix();
  }  








  else if (card == 2) {  
    noTint();
    // seamustard
    b += speed * direction; // Increase the value of x
    if ((b > 30 ) || (b < 0)) {
      direction = -direction; // Flip direction
    }
    if (direction == 1) {
      image(img1, 0,0,739,528);
    } 
    else {
      image(img2, 0,0,739,528);
    }


    //fish2
    x -= speed;
    image(fish2, x,0,818,384);
    image(fish2, x+width,0,818,384);
    image(fish2, x+width+width,0,818,384);
    image(fish2, x+width+width+width,0,818,384);
    image(fish2, x+width+width+width+width,0,818,384);
    image(fish2, x+width+width+width+width+width,0,818,384);

    //penguin
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin1(230, 100,1);
    popMatrix();


    pushMatrix(); 
    //fish
    fish();
    popMatrix();
  } 


  else if (card  == 3) {  

    //background
    image(img3, 0,0,739,528); 
    tint ( 247, 254, 255);

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin4(230, 100,1);
    popMatrix();

    pushMatrix(); 
    bird();
    popMatrix();
  }


  else if (card  == 4) { 

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin4(130, 100, 1);

    popMatrix();



    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguin5(420, 270, 0.5);
    popMatrix();


    pushMatrix(); 
    bird();
    popMatrix();
  }


  else if (card  == 5) { 

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin5(130, 100,1);

    popMatrix();




    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguin1(420, 270, 0.5);
    popMatrix();


    pushMatrix(); 
    bird();
    popMatrix();
  } 


  else if (card  == 6) {  

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);


    //penguin & bird




    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin5(40, 100,1);

    popMatrix();

    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguin1(300, 270, 0.5);
    penguin1(450, 340, 0.3);
    penguin1(550, 350, 0.15);
    popMatrix();


    pushMatrix(); 
    bird();
    popMatrix();
  } 


  else if (card  == 7) {  

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.01);
    penguinh(40, 100,1);
    popMatrix();

    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguin2h(300, 270, 0.5);
    penguin2h(450, 340, 0.3);
    penguin2h(550, 350, 0.15);
    popMatrix();




    pushMatrix(); 
    bird();
    popMatrix();
  }

  else if (card  == 8) { 

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);



    penguinsf1(130, 100,1);
    penguinsf1(420, 270, radius);


    pushMatrix(); 
    bird();
    popMatrix();
  }

  else if (card  == 9) { 

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);



    penguinsf1(130, 100,1);

    ellipseMode(RADIUS); 
    if((mouseX > 400) && (mouseX < 450) && (mouseY > 250) && (mouseY < 290)) {
      radius++;
    }
    penguinsf1(420, 270, radius);

    ellipseMode(CENTER);
    pushMatrix(); 
    bird();
    popMatrix();
  }

  else if (card  == 10) {
    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguinR2(130, 100,1);
    popMatrix();


    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguin5(420, 270, 0.5);
    popMatrix();
    pushMatrix(); 
    bird();
    popMatrix();

  }

  else if (card  == 11) { 

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin5(130, 100,1);

    popMatrix();




    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguinR(420, 270, 0.5);
    popMatrix();


    pushMatrix(); 
    bird();
    popMatrix();
  }
  
  
  
  
  
   else if (card  == 12) {
    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguinY2(130, 100,1);
    popMatrix();


    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguin5(420, 270, 0.5);
    popMatrix();
    pushMatrix(); 
    bird();
    popMatrix();

  }

  else if (card  == 13) { 

    //background
    tint ( 247, 254, 255);
    image(img3, 0,0,739,528); 

    //cloud
    x -= speed;
    image(cloud, x,-50,768,288);
    image(cloud, x+width,-50,768,288);
    image(cloud, x+width+width,-50,768,288);
    image(cloud, x+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width,-50,768,288);
    image(cloud, x+width+width+width+width+width,-50,768,288);

    //penguin & bird
    pushMatrix(); 
    //penguin
    rotate(angle * -0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= -1;
    }
    rotate(0.05);
    penguin5(130, 100,1);

    popMatrix();




    pushMatrix(); 
    rotate(angle * 0.05);
    angle += speed1 * angleDirection;
    if ((angle > 0.5) || (angle < 0)) {
      angleDirection *= 1;
    }
    rotate(0.01);
    penguinY(420, 270, 0.5);
    popMatrix();


    pushMatrix(); 
    bird();
    popMatrix();
  }
  
  
}



void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 

  else if (card == 1) {  
    if((mouseX > 150) && (mouseX < 350) && (mouseY > 80) && (mouseY < 120)) {    
      card = 10;
    }

    else if((mouseX > 450) && (mouseX < 550) && (mouseY > 50) && (mouseY < 150)) { 
      card = 12;
    }

    else if((mouseX > 100) && (mouseX < 280) && (mouseY > 240) && (mouseY < 460)) {
      card = 8;
    }
    else if((mouseX > 300) && (mouseX < 400) && (mouseY > 65) && (mouseY < 135)) {    
      card = 2;
    }
    
  }

  else if (card == 2) {

    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
  else if (card == 8) {
    card = 9;
  }
  else if (card == 9) {
    card = 1;
  }
  else if (card == 10) {
    card = 11;
  }
  else if (card == 11) {
    card = 1;
  }
    else if (card == 12) {
    card = 13;
  }
   else if (card == 13) {
    card = 1;
  }
}

void cardOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}


//opening fish
void fish2()
{
  noStroke();
  fill(0);
  ellipse ( mouseX, mouseY, 55, 30); 
  arc (mouseX+40, mouseY, 30, 20,HALF_PI,PI+HALF_PI);
  fill(255);
  ellipse (mouseX-15, mouseY,7,7);
}


//moving fish
void fish()
{
  pushMatrix();
  noStroke();
  fill(255);
  ellipse ( mouseX, mouseY, 55, 30); 
  arc (mouseX+40, mouseY, 30, 20,HALF_PI,PI+HALF_PI);
  fill(104,152,208);
  ellipse (mouseX-15, mouseY,7,7);
  popMatrix();
}

//red fish
void fishr(int x, int y) {
  translate(x,y);
  pushMatrix();
  noStroke();
  fill(255,55,0);
  ellipse ( mouseX, mouseY, 75, 40); 
  arc (mouseX+60, mouseY, 50, 30,HALF_PI,PI+HALF_PI);
  fill(255);
  ellipse (mouseX-20, mouseY,7,7);
  popMatrix();
}


//moving bird
void bird()
{
  pushMatrix();
  noStroke();
  fill(255);
  ellipse ( mouseX, mouseY, 25, 25); 
  ellipse ( mouseX+30, mouseY, 25, 25); 
  arc (mouseX+30, mouseY, 50, 50,HALF_PI,PI+HALF_PI);
  arc (mouseX+50, mouseY, 20, 20,HALF_PI,PI+HALF_PI);
  triangle(mouseX-20,mouseY, mouseX,mouseY-10,mouseX,mouseY+10);
  fill(104,152,208);
  ellipse (mouseX-5, mouseY,5,5);
  popMatrix();
}




//penguin - cute face & fish mouse
void penguin1(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);

  //eye  
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  fill(255);
  ellipse ( 150, 130, 55, 30); 
  arc (190, 130, 30, 20,HALF_PI,PI+HALF_PI);
  fill(104,152,208);
  ellipse (135, 130,7,7);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 ); 


  //pupil
  stroke(0);
  strokeWeight(2);
  line(115,75,125,80);
  line(125,80,115,85);
  line(175,80,185,75);
  line(185,85,175,80);
  popMatrix();
}



//penguin - moving pupil & fish mouse
void penguin4(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);


  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  fill(255);
  ellipse ( 150, 130, 55, 30); 
  arc (190, 130, 30, 20,HALF_PI,PI+HALF_PI);
  fill(104,152,208);
  ellipse (135, 130,7,7);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  fill(0);  

  float pupilX = map(mouseX, 0, width, 114, 126);  
  float pupilY = map(mouseY, 0, height, 70, 88);  
  float pupilA = map(mouseX, 0, width, 175, 185);  
  ellipse(pupilX, pupilY, 10, 15); //left pupil  
  ellipse(pupilA, pupilY, 10, 15); //right pupil
  popMatrix();
}



// penguin5 - moving pupill
void penguin5(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);

  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 ); 
  fill(0);  

  float pupilX = map(mouseX, 0, width, 114, 126);  
  float pupilY = map(mouseY, 0, height, 70, 88);  
  float pupilA = map(mouseX, 0, width, 175, 185);  
  ellipse(pupilX, pupilY, 10, 15); //left pupil  
  ellipse(pupilA, pupilY, 10, 15); //right pupil  
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  popMatrix();
}



// penguinh
void penguinh(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);



  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 ); 

  //pupil
  stroke(0);
  strokeWeight(2);
  line(115,75,125,80);
  line(125,80,115,85);
  line(175,80,185,75);
  line(185,85,175,80);

  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  image ( heart, 5, 0, 83, 70);
  popMatrix();
}




// penguin2h
void penguin2h(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);



  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 ); 

  //pupil
  stroke(0);
  strokeWeight(2);
  line(115,75,125,80);
  line(125,80,115,85);
  line(175,80,185,75);
  line(185,85,175,80);

  //fish & mouse
  noStroke();
  fill(255);
  ellipse ( 150, 130, 55, 30); 
  arc (190, 130, 30, 20,HALF_PI,PI+HALF_PI);
  fill(104,152,208);
  ellipse (135, 130,7,7);

  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  image ( heart, 5, 0, 83, 70);
  popMatrix();
}


//penguin - moving pupil & seamustard mouse
void penguinsf1(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);


  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  image(seafood1,145,110,15,60);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  fill(0);  

  float pupilX = map(mouseX, 0, width, 114, 126);  
  float pupilY = map(mouseY, 0, height, 70, 88);  
  float pupilA = map(mouseX, 0, width, 175, 185);  
  ellipse(pupilX, pupilY, 10, 15); //left pupil  
  ellipse(pupilA, pupilY, 10, 15); //right pupil
  popMatrix();
}



//penguin - moving pupil RED
void penguinR(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(255,55,0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);


  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  fill(0);  

  float pupilX = map(mouseX, 0, width, 114, 126);  
  float pupilY = map(mouseY, 0, height, 70, 88);  
  float pupilA = map(mouseX, 0, width, 175, 185);  
  ellipse(pupilX, pupilY, 10, 15); //left pupil  
  ellipse(pupilA, pupilY, 10, 15); //right pupil
  popMatrix();
}

//penguin - cute face & fish mouse RED
void penguinR2(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);

  //eye  
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  noStroke();
  fill(255,55,0);
  ellipse ( 150, 130, 55, 30); 
  arc (190, 130, 30, 20,HALF_PI,PI+HALF_PI);
  fill(255);
  ellipse (135, 130,7,7);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 ); 


  //pupil
  stroke(0);
  strokeWeight(2);
  line(115,75,125,80);
  line(125,80,115,85);
  line(175,80,185,75);
  line(185,85,175,80);
  popMatrix();
}







//penguin - moving pupil YELLOW
void penguinY(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
fill(255,221,31);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);


  //eye & mouse
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 );
  fill(0);  

  float pupilX = map(mouseX, 0, width, 114, 126);  
  float pupilY = map(mouseY, 0, height, 70, 88);  
  float pupilA = map(mouseX, 0, width, 175, 185);  
  ellipse(pupilX, pupilY, 10, 15); //left pupil  
  ellipse(pupilA, pupilY, 10, 15); //right pupil
  popMatrix();
}

//penguin - cute face & fish mouse YELLOW
void penguinY2(int x, int y, float s)
{
  pushMatrix();
  noStroke();
  translate(x,y);
  scale(s);
  // body & face
  fill(255, 230, 0);
  arc (110, 340, 65, 40, PI, TWO_PI);
  arc (190, 340, 65, 40, PI, TWO_PI);
  fill(0);
  ellipse ( 150, 105, 145, 150);
  ellipse ( 150, 215, 200, 200);
  ellipse ( 150, 240, 170, 180);

  //eye  
  fill(255);
  ellipse ( 150, 240, 150, 150);
  ellipse ( 120, 80, 22, 28);
  ellipse ( 180, 80, 22, 28);

  //fish & mouse
  noStroke();
  noStroke();
  fill(255,221,31);
  ellipse ( 150, 130, 55, 30); 
  arc (190, 130, 30, 20,HALF_PI,PI+HALF_PI);
  fill(255);
  ellipse (135, 130,7,7);
  fill(255, 230, 0);
  quad (150, 93, 160, 110, 150, 127, 140, 110 ); 


  //pupil
  stroke(0);
  strokeWeight(2);
  line(115,75,125,80);
  line(125,80,115,85);
  line(175,80,185,75);
  line(185,85,175,80);
  popMatrix();
}


