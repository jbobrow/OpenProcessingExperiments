


//PImage i1;
//PImage i2;
int dx;
int rr;
float test;
int classnum=90;
int num3d=21;
IntList randorando;
float disgrad;
float gradient=200;
int[] ranpos = new int[classnum+1];
int ranneg[];
PImage newVar[];
PImage d3;
PImage grad;
PImage[] images = new PImage[classnum+1];
PImage[] images3d = new PImage[num3d+1];
int xpos=0;
int ypos=0;
int ipos=0;
int r;
int rando;


void setup() {
  //frameRate(.25);
  size(1260, 1400);
  randorando = new IntList();
  for (int i=0;i<classnum;i++) {
    randorando.append(i);
  }
  //test=randorando.get(50);
  println(test);

  grad=loadImage("grad.png");
  d3=loadImage("test.png");
  //load portraits
  for ( int i = 0; i< images.length; i++ )
  {
    images[i] = loadImage( i + ".jpg" );   // make sure images "0.jpg" to "11.jpg" exist
    //println(images[i]);
  }
  //load 3d images
  String path = "d3/"; 
  for ( int i = 0; i< images3d.length; i++ )
  {
    images3d[i] = loadImage( path+ i + ".png" );   // make sure images "0.jpg" to "11.jpg" exist
    //println(images[i]);
  }
}

void draw() {
  background(0);

  //special();


  // creat image grid
  for (int p=0;p<10;p++) {  
    for (int i=0;i<9;i++) {

  //check mouse distance //and calculate gradient

      disgrad= (dist(mouseX, mouseY, i*140+100, p*140+100));
      //println(disgrad);
      if (disgrad>70) {
        gradient=100;
      }
      else {
        gradient=255;
      }
      //randomize images
      r=int(random(0, classnum));
      //special();
      tint(255, gradient);
      image(images[r], i*140, p*140);

      // println(ipos);
      //ipos=ipos++;
    }
    ypos=ypos+140;
    //ipos=ipos++;
    //println(p);
  }
  
  dx=int(map(mouseX, 0, width, 0, num3d+1));

  fill(0, 0, 0, 75);
  //rectMode(CENTER);
  rect(0, 0, width, height);
  tint(255, 255);
  image(images3d[dx], 0, 0);

  println(dx);
  //delay(500);

  //delay(1000);
}
//void special not working
void special() {


  for (int i=1; i<classnum;i++) {
    r= int(random(0, randorando.size()));
    ranpos[i]=r;

    if (randorando.size()>0) {
      randorando.remove(r);
      //println(randorando.size());
    }
    println(ranpos[6]);
  }
}

//save poster on click
void mousePressed() {
  save("poster.tif");
}




