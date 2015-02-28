
PImage opening, img1,img2, img3, fish2, cloud, heart ;
int card = 0; 
int x = -20;
int b = 1;
int speed = 3;
int direction = 1;


void setup() {
  size(739, 520);
  smooth();
  noStroke();
  noCursor();
  opening = loadImage("opening.jpg");
  img1 = loadImage("img1.jpg");
  img2 = loadImage("img2.jpg");
  img3 = loadImage("img3.jpg");
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

    //penguin
    penguin5(230, 100,1);


    pushMatrix(); 
    //fish
    fish();
    popMatrix();
  }  


  else if (card == 2) {  

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
    penguin1(230, 100, 1);

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
    penguin4(230, 100,1);
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
    penguin4(130, 100, 1);
    penguin5(420, 270, 0.5);
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
    penguin5(130, 100,1);
    penguin1(420, 270, 0.5);
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
    penguin5(40, 100,1);
    penguin1(300, 270, 0.5);
    penguin1(450, 340, 0.3);
    penguin1(550, 350, 0.15);
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
    penguinh(40, 100, 1);
    penguin2h(300, 270, 0.5);
    penguin2h(450, 340, 0.3);
    penguin2h(550, 350, 0.15);
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
    card = 2;
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


