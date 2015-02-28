
PImage[] img = new PImage[16];
float angle = 0; 
int copy = 50;

float x = 0;
float y = 0;


void setup() {

  size(600, 600);
  background(211, 209, 202);

  for (int i = 1; i<16; i++) {

    img [i] = loadImage(i+".png");
  }


}


void draw() {

  
  
  //image12
  image(img[12], 0, 140);

  //image14
  image(img[14], 50, 0);
  
  
  
  smooth(); 
  noStroke();

  float c = random(0, 255);
  float d = random(0, 255);
  float f = random(0, 255);

  fill(d, c, f);

  for (int j = 10 ; j < height ; j+=55) {

    for (int i = 10 ; i < width ; i+=45) {

      ellipse(i, j, 5, 5);
    }


    //image 1
    image(img[1], 220, 60, 150, 150);


    //image3
    float r = random(400, 450);
    for ( int i = 1 ; i < 16 ; i++) {
      image(img[3], r, 200 );
    }


    //image7
    pushMatrix();
    translate(500, 500);
    rotate(angle);
    image(img[7], 0, 0, 100, 100);
    popMatrix();  


    angle += 0.01;

    //image15
    pushMatrix();
    float rg = random(500, 550);
    float rr = random(100, 120);
    for ( int i = 1 ; i < 16 ; i++) {
      image(img[15], rg, rr, 50, 50 );
    }
    translate(width/2, height/2);
    popMatrix();


    //image8
    image(img[8], 80, 350);

    //image10
    image(img[10], 100, 120, 70, 70);
    image(img[10], 420, 120, 70, 70);

    //image11
    pushMatrix();
    translate(100, 100);
    rotate(angle);
    image(img[11], 0, 0, 70, 70);
    popMatrix();  

    //image13
    image(img[13], 0, 410, 80, 80);
    image(img[13], 260, 410, 80, 80);
    image(img[13], 520, 410, 80, 80);

    //image6
    image(img[6], 60, 250, 70, 71);
    image(img[6], 480, 30, 70, 71);
    image(img[6], 180, 420, 70, 71);


    //image5
    image(img[5], mouseX, mouseY, 100, 100);
    
    
  }
}

void keyPressed() {
  saveFrame("_#####.png");
}



