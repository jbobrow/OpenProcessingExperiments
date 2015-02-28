
// Time Flower
// Ping-Yeh Li 2013
// Processing 2.0b9

// 用空間的資訊，來畫一朵花


PShape leaves01_1;
PShape leaves01_2;
PShape leaves01_3;
PShape leaves02;
PShape leaves03;
PShape leaves04;
PShape leaves05;
PShape leaves06;
PShape leaves07;
PShape heart01;
PShape heart03;
PShape gear01;
float angle1;
float angle2;
float angle3;
float angle4;
float angle5;
boolean blurSwitch= true;
boolean oneSecPassed = false;
int previousValue= -1;
PFont font;
int frameRateSet=30;
String[] data= {
  "0", "0", "0", "0", "0"
};
PImage cover;
PImage coverDark;

float v = 1.0 / 9.0;
float[][] kernel = {
  { 
    v, v, v
  }
  , {  
    v, v, v
  }
  , { 
    v, v, v
  }
};

int cx, cy;
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int passedTime;
int currentTime;


void setup() {
  // font= loadFont("Serif-20.vlw");
  frameRate(frameRateSet);
  background(0);
  size(360, 450, OPENGL);
  shapeMode(CENTER);
  imageMode(CENTER);
  smooth();

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.75;
  minutesRadius = radius * 0.75;
  hoursRadius = radius * 0.9;
  clockDiameter = radius * 1.5;

  cx = width / 2;
  cy = height / 2;

  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  /*
  leaves01_1 = loadShape("leaves01_1.svg");
   leaves01_2 = loadShape("leaves01_2.svg");
   leaves01_3 = loadShape("leaves01_3.svg");
   leaves02 = loadShape("leaves02.svg");
   leaves03 = loadShape("leaves03.svg");
   leaves04= loadShape("leaves04.svg");
   leaves05= loadShape("leaves05.svg");
   leaves06= loadShape("leaves06.svg");
   heart01= loadShape("heart01.svg");
   heart03= loadShape("heart03.svg");
   gear01= loadShape("gear01.svg");
   coverDark= loadImage("coverDark2.png");
   */
  leaves01_1 = loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves01_1.svg");
  leaves01_2 = loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves01_2.svg");
  leaves01_3 = loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves01_3.svg");
  leaves02 = loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves02.svg");
  leaves03 = loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves03.svg");
  leaves04= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves04.svg");
  leaves05= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves05.svg");
  leaves06= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves06.svg");
  leaves07= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/leaves07.svg");
  heart01= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/heart01.svg");
  heart03= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/heart03.svg");
  gear01= loadShape("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/gear01.svg");
  coverDark= loadImage("https://dl.dropboxusercontent.com/u/109053986/20130725_TimeFlower/coverDark2.png");
}

void draw() {
  currentTime = millis();
  if (blurSwitch==false) {
    background(0);
  }
  int secs = second();
  int mins = minute();
  int h = hour();

  //println(frameRate);

  if (oneSecPassed==true) {
    angle1+=0.002;
    angle2+=0.003;
    angle3+=0.004;
    angle4+=0.005;
  } else {
    angle1+=0.0002;
    angle2+=0.0003;
    angle3+=0.0004;
    angle4+=0.0005;
  }
  angle5+=0.0005;





  // draw 10th layer (gear)
  pushMatrix();
  translate(width/2, height/2, 3);
  rotate(-angle2);
  shape(gear01, 0, 0, 50, 50);
  popMatrix();

  // draw 9th layer (colorful backCircle)
  pushMatrix();
  translate(width/2, height/2, 5);
  rotate(-angle5*2);
  image(coverDark, 0, 0, 400*0.6+sin(angle2*10)*40, 500*0.6+sin(angle2*10)*40);
  popMatrix();

  // draw 8th layer (heart)
  pushMatrix();
  translate(width/2, height/2, 120+sin(angle4*10)*100);
  //rotate(-angle4*3);
  shape(heart01, 0, 0, 20, 20);
  popMatrix();

  // draw 7th layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 5);
  rotate(-angle4*3);
  shape(leaves06, 0, 0, 80, 80);
  popMatrix();

  // draw 6th layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 6+sin(angle1*10)*3);
  rotate(-angle1*3);
  shape(leaves05, 0, 0, 120+cos(angle4)*60, 120+cos(angle4)*60);
  popMatrix();


  // draw 5th layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 7+sin(angle2*10)*5);
  rotate(angle2);
  shape(leaves04, 0, 0, 100+sin(angle1*6)*30, 100+sin(angle1*6)*30);
  popMatrix();

  // draw 4th layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 8);
  rotate(angle1);
  shape(leaves03, 0, 0, 150+cos(angle3*5)*80, 150+cos(angle3*5)*80);
  popMatrix();

  // draw 3rd layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 9);
  rotate(angle3);
  //leaves02.disableStyle();
  // fill(angle2*255, 0, 0);
  shape(leaves02, 0, 0, 205, 205);
  popMatrix();


  // draw 2nd layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 10+sin(angle1*10)*4);
  rotate(angle5);
  shape(leaves01_1, 0, 0, 220+sin(angle2*5)*50, 220+sin(angle2*5)*50);
  shape(leaves01_2, 0, 0, 200+sin(angle2*10)*50, 200+sin(angle2*10)*50);
  shape(leaves01_3, 0, 0, 180+sin(angle2*15)*50, 180+sin(angle2*15)*50);
  popMatrix();

  // draw 1st layer (leaves)
  pushMatrix();
  translate(width/2, height/2, 12);
  rotate(-angle1*2);
  shape(leaves07, 0, 0, 180+sin(angle3*15)*5, 180+sin(angle3*15)*5);
  popMatrix();


  // draw top layer (heart03)
  pushMatrix();
  translate(width/2, height/2, 20);
  rotate(-angle4);
  shape(heart03, 0, 0, 100+sin(angle4*5)*30, 100+sin(angle4*5)*30);
  popMatrix();


  pushMatrix();
  translate(width/2, height/2, 20);
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top


  // draw hour hand
  float h2 = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  stroke(3, 173, 255);
  strokeWeight(40);
  line(0 + cos(h2) * (hoursRadius-10), 0 + sin(h2) * (hoursRadius-10), 0 + cos(h2) * (hoursRadius-7), 0 + sin(h2) * (hoursRadius-7));

  // draw minutes hand
  float m2 = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  stroke(33, 255, 224);
  strokeWeight(30);
  line(0 + cos(m2) * (minutesRadius-3), 0 + sin(m2) * (minutesRadius-3), 0 + cos(m2) * minutesRadius, 0 + sin(m2) * minutesRadius);

  // draw second hand
  if (second()%2==0) {
    float s2 = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
    //stroke(250, 255, 3);
    //stroke(157, 255, 255);
    stroke(204, 255, 111);
    strokeWeight(20);
    line(0 + cos(s2) * (secondsRadius-3), 0 + sin(s2) * (secondsRadius-3), 0 + cos(s2) * (secondsRadius), 0 + sin(s2) * (secondsRadius));
  }

  // draw the seconds and minutes ticks
  strokeWeight(2);
  beginShape(POINTS);
  float currentAngle= map(currentTime, 0, 1000, 0, 360);
  stroke(200+ sin(radians(currentAngle)/2)*50);
  for (int a = 0; a < 360; a+=12) {
    float angleA = radians(a);
    float x = 0 + cos(angleA) * (secondsRadius);
    float y = 0 + sin(angleA) * (secondsRadius);
    vertex(x, y);
  }
  endShape();

  // draw the hour ticks
  strokeWeight(2);
  beginShape(POINTS);
  stroke(150);
  for (int a = 0; a < 360; a+=30) {
    float angleA = radians(a);
    float x = 0 + cos(angleA) * (hoursRadius-10);
    float y = 0 + sin(angleA) * (hoursRadius-10);
    vertex(x, y);
  }
  endShape();
  popMatrix();



  if (blurSwitch==true) {
    loadPixels();
    // Create an opaque image of the same size as the original
    // Loop through every pixel in the image
    for (int y = 1; y < height-1; y++) {   // Skip top and bottom edges
      for (int x = 1; x < width-1; x++) {  // Skip left and right edges
        float sum1 = 0; // Kernel sum for this pixel
        float sum2=0;
        float sum3=0;
        for (int ky = -1; ky <= 1; ky++) {
          for (int kx = -1; kx <= 1; kx++) {
            // Calculate the adjacent pixel for this kernel point
            int pos = (y + ky)*width + (x + kx);
            // Image's red/green/blue are identical
            float valR = red(pixels[pos]);
            float valG= green(pixels[pos]);
            float valB= blue(pixels[pos]);
            // Multiply adjacent pixels based on the kernel values
            sum1 += kernel[ky+1][kx+1] * valR;
            sum2 += kernel[ky+1][kx+1] * valG;
            sum3 += kernel[ky+1][kx+1] * valB;
          }
        }
        // For this pixel in the new image, set the gray value
        // based on the sum from the kernel
        pixels[y*width + x] = color(sum1, sum2, sum3);
      }
    }
    // State that there are changes to edgeImg.pixels[]
    updatePixels();
  }

  // 計算出當下秒數=  (h*60*60)+(mins*60)+(secs)
  int currentSecs=(h*60*60)+(mins*60)+(secs);
  String currentSecsString= String.valueOf(currentSecs);
  //text(currentSecsString, width*0.2+230, height*0.95);

  // 把各個位數用String分出來 
  // 假如是個位數
  if (currentSecs<10) {
    data[4]= currentSecsString.substring(0, 1);
  } // 假如是二位數
  if (currentSecs>9 && currentSecs<100) {
    // data[3]= currentSecsString.substring(0, 1);
    data[4]= currentSecsString.substring(1, 2);
  } // 假如是三位數
  if (currentSecs>99 && currentSecs<1000) {
    // data[2]= currentSecsString.substring(0, 1);  
    // data[3]= currentSecsString.substring(1, 2);
    data[4]= currentSecsString.substring(2, 3);
  }  //假如是四位數
  if (currentSecs>999 && currentSecs<10000) {
    // data[1]= currentSecsString.substring(0, 1);  
    // data[2]= currentSecsString.substring(1, 2);
    // data[3]= currentSecsString.substring(2, 3);
    data[4]= currentSecsString.substring(3, 4);
  } else { //假如是五位數
    // data[0]= currentSecsString.substring(0, 1);
    //data[1]= currentSecsString.substring(1, 2);  
    //data[2]= currentSecsString.substring(2, 3);
    // data[3]= currentSecsString.substring(3, 4);
    data[4]= currentSecsString.substring(4, 5);
  }
  //println(colorValue01+ " "+colorValue02+ " " +colorValue03+ " "+colorValue04+ " "+colorValue05);
  //println(data);

  // 再轉回int
  //int value01= Integer.parseInt(data[0]); // 萬
  // int value02= Integer.parseInt(data[1]); // 千
  //int value03= Integer.parseInt(data[2]); // 百
  //int value04= Integer.parseInt(data[3]); // 十
  int value05= Integer.parseInt(data[4]); // 個

  // 每兩秒反應一次
  if (value05==0 || value05==2 || value05==4 || value05==6 || value05==8) {
    if (previousValue!=value05) {
      
      previousValue= value05;
    }
  } else {
    
  };
  //println(value01+ " "+value02+ " " +value03+ " "+value04+ " "+value05);
  //println(currentTime-passedTime);
  //println(previousValue);
}
