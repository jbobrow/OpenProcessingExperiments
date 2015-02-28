
PImage b;
PImage cp;

float rx[];
float ry[];
float count= 0;
float count2 = 0;
float count3 = 0;
int value = 0;

void setup(){
  b = loadImage("brrrrllll_1_.gif");
  image(b, 0, 0);
  size (600, 600, P3D);
  background (b);

  rx = new float[10];
  ry = new float[10];
  for (int i=0; i<10; i++){
    rx[i] = random(5);
    ry[i] = random(5);
  }
  float count = 0;
  float count2 = 0;
}

void draw(){

  noStroke();

  rect(235, 235, 130, 130);
  rect(235, 235, 130, 130);

  loadPixels();
  cp = createImage(600,600,RGB);
  cp.loadPixels();
  for(int p=0; p<600*600; p++) {
    cp.pixels[p] = pixels[p];
  }
  cp.updatePixels();
  
  for (int i=0;i<10; i++){
    rotateZ(-count * DEG_TO_RAD);
    rotateY(-count2 * DEG_TO_RAD);
    rotateX(-1*(count3) * DEG_TO_RAD);
    image(cp, 235, 235, 130, 130);
    count = count+.01 ;
    count2 = count2+.01 ;
    count3 = count3+.01 ;
  }

  println( mouseX + " " + mouseY);

  //for (int i=0; i<(width*height/2)-width/2; i++) {
    //pixels[i] = spin;
  //}

}

void mousePressed()
{
  if(value == 0) {
    value = 255;
    background (b);
    count= count*(-1);
    count2= count*(-1);
    count2= count*(1);
  } else {
    value = 0;
    count= count*(1);
    count2= count*(1);
    count2= count*(-1);
  }
}


