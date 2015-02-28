
int faceRad = 150;
int eye1 = 200;
int eye2 = 400;
int eye1Rad = 10;
int eye2Rad = 25;
int upperteeth = 250;
int upperteethsize = 30;
int bottomteeth = 270;
int bottomteethsize = 10;
//int nosebridge = 325;
int nose = 350;
int eyebrowstroke = 20;
int eyebrow = 220;
int value1 = 255;
int value2 = 255;
int value3 = 255;






void setup() {

  size(600, 600);
  smooth();
  ellipseMode(RADIUS);
}

void draw() {

  background(255);

  if ((mouseX > 0) && (mouseX < width/2) &&(mouseY > 0) && (mouseY <height))
  {

    faceRad = faceRad+1;
    value1 = value1-10/9;
    value3 =value3-1;
    eye1Rad = eye1Rad+1;
    eye2Rad = eye2Rad-1;
eyebrow = eyebrow-1;
nose = nose+1;
bottomteeth= bottomteeth+1;
    upperteeth=upperteeth+1;
    
  }
  else
  {

    faceRad = faceRad-1; 
    value1 = value1+10/9;
    value3 =value3+1;
    eye1Rad = eye1Rad-1;
    eye2Rad = eye2Rad+1;
eyebrow = eyebrow+1;
nose = nose-1;
bottomteeth= bottomteeth-1;
upperteeth=upperteeth-1;


  }



  strokeWeight(10);
  fill(value1, value2, value3);
  ellipse(300, 300, faceRad, faceRad); //face

fill(value1);
  ellipse(eye1, 300, eye1Rad, eye1Rad); // eye1
  noFill();
  ellipse(eye2, 300, eye2Rad, eye2Rad);//eye2

  strokeWeight(5);
  rect(upperteeth, upperteeth+140, upperteethsize, upperteethsize); //upper teeth
  rect(upperteeth+30, upperteeth+140, upperteethsize, upperteethsize);
  rect(upperteeth+60, upperteeth+140, upperteethsize, upperteethsize);

  strokeWeight(5);
  rect(270, bottomteeth+150, bottomteethsize, bottomteethsize); //bottom teeth
  rect(bottomteeth+10, bottomteeth+150, bottomteethsize, bottomteethsize);
  rect(bottomteeth+20, bottomteeth+150, bottomteethsize, bottomteethsize);

  strokeWeight(eyebrowstroke);
  strokeCap(SQUARE);
  line(eyebrow, 220, eyebrow+100, 270); //eyebrow


  strokeWeight(10);
  strokeCap(ROUND);
  line(325, 325, 350, nose); //nose bridge
  line(300, 350, 350, nose); //nose
}










