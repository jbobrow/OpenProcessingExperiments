
//to get multiple save file
int count=0;
//Declare a PImage variable type
PImage fractal, p1, p2, p3, p4, p5;
//drawable
boolean[] pic = new boolean[5];
//set color
color white = #FFFFFF;
color black = #000000;
color brown = #935935;

//Load an image file from HDD
/*Don't forget to add the file
 to your sketch 'data' folder */

//pic2 for walk
float[] human = new float[4];
float[] walk = new float[4];
float wave = -0.1;
float degree = HALF_PI*3;
void setup() {
  smooth();
  size(800, 600);

  //people x_axis
  human[0]=65;
  human[1]=200;
  human[2]=170;
  human[3]=225;
  //walking speed
  walk[0]=1;
  walk[1]=-1;
  walk[2]=1;
  walk[3]=-1;

  //picture
  fractal = loadImage("bg.jpg");
  p1 = loadImage("p1.jpg");
  p2 = loadImage("p2.jpg");
  p3 = loadImage("p3.jpg");
  p4 = loadImage("p4.jpg");
  p5 = loadImage("p5.jpg");

  //set default picture
  image(fractal, 0, 0);
  noStroke();
  
  textSize(16);
  rect(0, 578, 19, 21);
  fill(black);
  text("(s)",0, 578, 19, 21);
  
  textSize(18);
  textAlign(CENTER);
  fill(white);
  text("reset",36,580,250,24);
  
  
  
  
  
}
//Draw the image to the screen
void draw() {
  //pic2 is open => true / close => false
  if (pic[2]) {
    strokeWeight(0);
    if (degree<=HALF_PI*3||degree>=HALF_PI*5) {
      wave*=-1;
    }
    degree+=wave;
    //bg walking people
    fill(white);
    rect(47, 342, 197, 142);

    fill(black);
    stroke(black);
    strokeWeight(2);
    
    //set loop walking at 65-225 axis_x
    for (int i=0; i<human.length;i++) {
      if (human[i]<65||human[i]>225) {
        walk[i]*=-1;
      }
      human[i]+=walk[i];

      //human face
      ellipse(human[i], 450-(i*20), 20, 20);

      //body
      line(human[i], 460-(i*20), human[i], 475-(i*20));

      //arm for wave
      pushMatrix();
      translate(human[i], 460-(i*20));
      rotate(degree);
      line(0, 0, 0, 10);
      popMatrix();
      pushMatrix();
      translate(human[i], 460-(i*20));
      rotate(-degree);
      line(0, 0, 0, 10);
      popMatrix();

      //legs for wave
      pushMatrix();
      translate(human[i], 475-(i*20));
      rotate(degree);
      line(0, 0, 0, 10);
      popMatrix();
      pushMatrix();
      translate(human[i], 475-(i*20));
      rotate(-degree);
      line(0, 0, 0, 10);
      popMatrix();
    }
    fill(white);
  }

  if (mousePressed) {

    //top-left pic
    
    if (mouseX>=51&&mouseX<=252&&mouseY>=50&&mouseY<=200&&pmouseX>=51&&pmouseX<=252&&pmouseY>=50&&pmouseY<=200) {
      if (pic[0]) {
        for (int i = 0 ; i < 3 ; i++)
        {
          //random circle color, size and position
          strokeWeight(random(5));
          fill(color( random(255), random(255), random(255), random(255)));
          stroke(color( random(255), random(255), random(255), random(255)));
          float r = random(5, 30);
          float x = mouseX+ random(-50, 50);
          float y = mouseY+ random(-50, 50);
          //spray on the frame.
          if (x-r>=51&&x+r<=252&&y-r>=50&&y+r<=200)ellipse(x, y, r, r);
        }
        //set default
        fill(white);
        stroke(black);
        strokeWeight(0);
      }
      else {
        open(0);
      }
    }

    //top-right pic
    if (mouseX>=309&&mouseX<=758&&mouseY>=30&&mouseY<=334&&pmouseX>=309&&pmouseX<=758&&pmouseY>=30&&pmouseY<=334) {
      
      //center of circle
      float x0 = (393+693)/2;
      float y0 = (32+332)/2;

      float x1 = mouseX;
      float y1 = mouseY;
      float x2 = pmouseX;
      float y2 = pmouseY;
      
      //use r1 and r2 to find mouse radius
      float r1 = sqrt(pow(x1-x0, 2)+pow(y1-y0, 2));
      float r2 = sqrt(pow(x2-x0, 2)+pow(y1-y0, 2));
      
      if (pic[1]) {
        //draw picture on circle
        if (r1<=100||r2<=100) {
          strokeWeight(2);
          int lines=7;
          float x=x1-393;
          float y=y1-32;
          float pX=x2-393;
          float pY=y2-32;
          translate(x0, y0);

          for (int i = 1; i <= lines; i++) {
            stroke(color(random(256), random(256), random(256), random(256)));
            line(x-150, y-150, pX-150, pY-150);
            rotate(TWO_PI/lines);
          }
        }
        fill(white);
      }else{
        open(1);
      }
    }
    
  }
}

void mouseReleased() {
  //bottom-left pic
  //click the men to change their direction
  if (mouseX>=47&&mouseX<=244&&mouseY>=342&&mouseY<=484&&pmouseX>=47&&pmouseX<=244&&pmouseY>=342&&pmouseY<=484) {
    if (pic[2]) {
      for (int i=0;i<human.length;i++) {
        walk[i]*=-1;
      }
    }
    else {
      open(2);
    }
  }
  
  if (mouseX>=36&&mouseX<=286&&mouseY>=575&&mouseY<=599&&pmouseX>=36&&pmouseX<=286&&pmouseY>=575&&pmouseY<=599) {
    close(99);
  }
  
  
  //bottom-mid pic as a doraemon
  if (mouseX>=360&&mouseX<=455&&mouseY>=407&&mouseY<=523&&pmouseX>=360&&pmouseX<=455&&pmouseY>=407&&pmouseY<=523) {
    if (pic[3]) {
      // show different doraemon
      strokeWeight(0);
      doraemon(360, 407);
    }
    else {
      open(3);
    }
  }
    
  //bottom-right pic as my line id
  if (mouseX>=590&&mouseX<=709&&mouseY>=427&&mouseY<=521&&pmouseX>=590&&pmouseX<=709&&pmouseY>=427&&pmouseY<=521) {
    if (pic[4]) {
      //do nothing
      close(4);
    }
    else {
      open(4);
    }
  }
  if (mouseX>=0&&mouseX<=35&&mouseY>=578&&mouseY<=600&&pmouseX>=0&&pmouseX<=35&&pmouseY>=578&&pmouseY<=600) {
    save();
  }
}

void keyPressed () {
  //to open/close the gallery
  // click 0 to clear screen
  // click 1-5 to open/close
  // click S or s to save

  fill(white);
  
  switch(key) {
  case '1':
    if (pic[0]) {
      close(0);
    }
    else {
      open(0);
    }
    break;
  case '2':
    if (pic[1]) {
      close(1);
    }
    else {
      open(1);
    }
    break;
  case '3':
    if (pic[2]) {
      close(2);
    }
    else {
      open(2);
    }
    break;
  case '4':
    if (pic[3]) {
      close(3);
    }
    else {
      open(3);
    }
    break;
  case '5':
    if (pic[4]) {
      close(4);
    }
    else {
      open(4);
    }
    break;
  case 'r':
  case 'R':
    close(99);
    break;
    
  case 's':
  case 'S':
    save();
    break;
  }
}

void doraemon(int bgX, int bgY) {
  //local variable for doraemon
  color[] paletteBlue = {
    #6ABBFF, #325878, #4C87B8, #172938, #5290C5
  };
  color red = #F00505;
  color yellow = #EAEA0E;
    
  //random doraemon color
  color blue = paletteBlue[int(random(5))];

  //set center position of doraemon
  int x=bgX+40;
  int y=bgY+40;
  
  //set stroke color = black
  stroke(black);

  //set blue for body and head
  fill(blue);

  //draw body
  ellipse(10+x, 35+y, 50, 50);
  //draw head
  ellipse(10+x, y, 50, 50);

  //fill white for stomach
  fill(white);

  //body
  ellipse(10+x, 35+y, 40, 35);
  arc(10+x, 35+y, 30, 25, 0, 3.14, CHORD);

  //collar
  fill(red);
  arc(10+x, 12+y, 45, 30, PI/6, 5*PI/6);

  //fill white for face and eye
  fill(white);
  //face
  ellipse(10+x, 8+y, 40, 35);
  //left white eye
  ellipse(2+x, y-10, 15, 20);
  //right white eye 
  ellipse(18+x, y-10, 15, 20);

  //whiskers
  fill(black);
  line(x, 5+y, x-10, 2+y);
  line(x, 10+y, x-10, 10+y);
  line(x, 15+y, x-10, 17+y); 
  line(20+x, 5+y, 30+x, 2+y);
  line(20+x, 10+y, 30+x, 10+y);
  line(20+x, 15+y, 30+x, 17+y); 
  line(10+x, y-10, 10+x, 15+y);

  //mouth
  noFill();
  arc(10+x, 2+y, 30, 30, PI/4, 3*PI/4);

  //nose
  fill(red);
  ellipse(10+x, y-1, 7, 7);

  //bell
  fill(yellow);
  ellipse(10+x, 28+y, 10, 10);
  ellipse(10+x, 29+y, 2, 2);
  line(10+x, 28+y, 10+x, 32+y);
  rect(4+x, 25+y, 12, 2);

  //eye
  stroke(black);
  fill(white);
  int eye_pattern = int(random(5));
  
  if (eye_pattern==4) {
    strokeWeight(2);
    ellipse(x, y-10, 3, 6);
    ellipse(15+x, y-10, 3, 6);
  }
  if (eye_pattern==3) {
    strokeWeight(2);
    ellipse(5+x, y-10, 3, 6);
    ellipse(20+x, y-10, 3, 6);
  }
  if (eye_pattern==2) {
    noFill();
    arc(5+x, y-8, 5, 10, PI, 2*PI);
    strokeWeight(2);
    ellipse(15+x, y-10, 3, 6);
  }
  if (eye_pattern==1) {
    noFill();
    arc(5+x, y-8, 5, 10, PI, 2*PI);
    strokeWeight(2);
    ellipse(15+x, y-10, 3, 6);
  }
  if (eye_pattern==0) {
    noFill();
    arc(5+x, y-8, 5, 10, PI, 2*PI);
    arc(15+x, y-8, 5, 10, PI, 2*PI);
  }

  //arm
  noStroke();
  fill(blue);
  triangle(x-10, 20+y, x-10, 30+y, x-23, 30+y);
  triangle(30+x, 20+y, 30+x, 30+y, 43+x, 30+y);

  //for hand and leg
  strokeWeight(0.5);
  stroke(black);
  fill(white);

  //hand
  ellipse(x-20, 35+y, 15, 15);
  ellipse(40+x, 35+y, 15, 15);
  //leg
  ellipse(x-2, 60+y, 25, 9);
  ellipse(22+x, 60+y, 25, 9);
  
}

//open hiding picture
void open(int code) {
  
  switch(code) {

  case 0:
    setDefault();
    rect(51, 50, 200, 150);
    pic[0]=true;
    break;

  case 1:
    setDefault();
    fill(brown);
    rect(309, 30, 449, 304);
    fill(black);
    ellipse(543, 182, 300, 300);
    pic[1]=true;
    break;

  case 2:
    setDefault();
    rect(47, 342, 197, 142);
    pic[2]=true;
    break;

  case 3:
    setDefault();
    rect(360, 407, 97, 116);
    doraemon(360, 407);
    pic[3]=true;
    break;

  case 4:
    setDefault();
    rect(590, 427, 119, 94);
    pic[4]=true;
    textSize(20);
    fill(black);
    String s = "LINE ID: nutphi";
    text(s, 600, 437, 119, 94);
    break;
    
  }
}

void setDefault(){
  //put save text for click
  textSize(16);
  noStroke();
  fill(white);
  rect(0, 578, 19, 21);
  fill(black);
  text("(s)",0, 578, 19, 21);
  
  //put reset text for click
  textSize(18);
  textAlign(CENTER);
  fill(white);
  text("reset",36,580,250,24);
  strokeWeight(0);
}

void close(int code) {
  
  switch(code) {
    
  case 0:
    image(p1, 51, 50);
    pic[0]=false;
    break;
    
  case 1:
    image(p2, 309, 30);
    pic[1]=false;
    break;
    
  case 2:
    image(p3, 47, 342);
    pic[2]=false;
    break;
    
  case 3:
    image(p4, 360, 407);
    pic[3]=false;
    break;
    
  case 4:
    image(p5, 590, 427);
    pic[4]=false;
    break;
    
  case 99:
    image(fractal, 0, 0);
    setDefault();
    pic[0]=false;
    pic[1]=false;
    pic[2]=false;
    pic[3]=false;
    pic[4]=false;
    break;
    
  }
}

void save(){
  saveFrame("final_project"+count+".png");
  count++;
}

