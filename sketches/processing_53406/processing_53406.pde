
PImage img;
String [] file;

int nextimg = 1;
float value = 0;

PImage plane1;

float r = map(mouseX, 0, width, 0, 33);
int rr = int(r);



void setup() {

  size(458, 725);
  frameRate(30);
  smooth();
  colorMode(RGB);
  noStroke();
  imageMode(CENTER);


  file=new String[33];
  file[0]="plane1.jpg";
  file[1]="plane2.jpg";
  file[2]="plane3.jpg";
  file[3]="aerial1.jpg";
  file[4]="aerialclouds.jpg";
  file[5]="beachpier.jpg";
  file[6]="chicago.jpg";
  file[7]="eiffel.jpg";
  file[8]="londonpb.jpg";
  file[9]="palace.jpg";
  file[10]="parisbridge.jpg";
  file[11]="parisclouds.jpg";
  file[12]="parisflaresally.jpg";
  file[13]="parissally.jpg";
  file[14]="perfecthallway.jpg";
  file[15]= "seattle1.jpg";
  file[16]= "seattle2.jpg";
  file[17]= "seattlesally.jpg";
  file[18]= "sf1.jpg";
  file[19]= "sfsally.jpg";
  file[20]= "sfskyline.jpg";
  file[21]= "sunset1.jpg";
  file[22]= "vancouver1.jpg";
  file[23]= "vancouver2.jpg";
  file[24]= "whitehallway.jpg";
  file[25]= "williams.jpg";
  file[26]= "winery.jpg";
  file[27]= "zbeach.jpg";
  file[28]= "zblue.jpg";
  file[29]= "zbricks.jpg";
  file[30]= "zchi.jpg";
  file[31]= "zfreeway.jpg";
  file[32]= "zsunset.jpg";


  float r = map(mouseX, 0, 33, 0, width);
  int rr = int(r);


  float f = random(0, 33);
  int fr = int(f);


  //  nextimg=nextimg++;
  img=loadImage(file[fr]);


  plane1 = loadImage("plane1.jpg");
}




void draw() {

  float f = random(0, 33);
  int fr = int(f);


//  if (fr == 10)
//  {
//    delay(2500);
//  }



  if (millis() ==0000 && millis() <=1000)
  {    
    tint(150);
    image(plane1, width/2, height/2);
    filter(BLUR, 8);
  }

  else if (millis()>1000 && millis()<=3000)
  {
    tint(200);
    image(plane1, width/2, height/2);
    filter(BLUR, 8);
  }

  else if (millis()>3000 && millis()<=5000)
  {
    tint(255);
    image(plane1, width/2, height/2);
    filter(BLUR, 8);
  }

  else if (millis()>5000 && millis()<=8000)
  {
    image(plane1, width/2, height/2);
    filter(BLUR, 4);
  }

  else if (millis()>8000 && millis() <=10000)
  {
    image(plane1, width/2, height/2);
    filter(BLUR, 2);
  } 

  else if (millis()>10000 && millis()<=12000)
  {
    image(plane1, width/2, height/2);
  }


  //  else  
  //  { 
  //    tint(255);
  //    img=loadImage(file[fr]);
  //    //nextimg=(nextimg+1);
  //    image(img, width/2, height/2);
  //  }




  println(frameRate);
}


void mouseMoved()
{
  float r = map(mouseX, 0, width, 0, 33);
  int rr = int(r);

  tint(255);
  img=loadImage(file[rr]);
  image(img, width/2, height/2);
}



void mousePressed()
{
  fill(255);
  tint(255, 180);
  PFont font = loadFont("CenturyGothic-80.vlw");
  textFont(font);
  String t = "STOP AND SMELL THE ROSES";
  textAlign(CENTER);
  textFont(font);
  text(t, 65, 60, 350, 700);
}

void mouseDragged()
{


  float r = map(mouseX, 0, width, 0, 33);
  int rr = int(r);
  
  tint(255);
  img=loadImage(file[rr]);
  image(img, width/2, height/2);
  
    fill(255);
  tint(255, 180);
  PFont font = loadFont("CenturyGothic-80.vlw");
  textFont(font);
  String t = "STOP AND SMELL THE ROSES";
  textAlign(CENTER);
  textFont(font);
  text(t, 65, 60, 350, 700);
}


