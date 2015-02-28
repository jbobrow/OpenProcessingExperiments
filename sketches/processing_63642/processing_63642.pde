


  size(600, 600);
  background(255);
  smooth();

int faceWidth = 300;
int faceHeight = 300;
int eye1 = 200;
int eye2 = 400;
int eye1size = 20;
int eye2size = 50;
int upperteeth = 250;
int upperteethsize = 30;
int bottomteeth = 270;
int bottomteethsize = 10;
int nosebridge = 325;
int nose = 350;
int eyebrowstroke = 20;
int eyebrow = 220;
  
  strokeWeight(10);
  ellipse(300,300,faceWidth,faceHeight); //face

  ellipse(eye1,300,eye1size,eye1size); // eye1
  ellipse(eye2,300,eye2size,eye2size);//eye2
  
  strokeWeight(5);
  rect(upperteeth, upperteeth+140, upperteethsize, upperteethsize); //upper teeth
   rect(upperteeth+30, upperteeth+140, upperteethsize, upperteethsize);
   rect(upperteeth+60, upperteeth+140, upperteethsize, upperteethsize);
   
   strokeWeight(5);
   rect(270, bottomteeth+150, 10, 10); //bottom teeth
   rect(bottomteeth+10, bottomteeth+150, bottomteethsize, bottomteethsize);
   rect(bottomteeth+20, bottomteeth+150, bottomteethsize, bottomteethsize);
   
   
   strokeWeight(10);
   line(nosebridge, nosebridge, nose, nose); //nose bridge
   line(300, 360, nose, nose); //nose
  
  strokeWeight(eyebrowstroke);
  strokeCap(SQUARE);
  line(eyebrow, eyebrow+50, eyebrow+100, eyebrow+50); //eyebrow


 
  
  
  
  
  


