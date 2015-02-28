
Boolean debug, config;
color overColor;
int frCounter, maxCounter, currentTest,maxTests,currentFr;
int[] testDur;
float holder1,holder2,holder3;

int _width, _height;

//Function[] 

void setup() {
  _width = 80 + 192;
  _height = 80 + 192;
  size(1024, 768);
  //debug screen settings
  overColor = color(255, 0, 0);
  debug = false;
  //testing variables
  frCounter = 0;
  currentTest = 0;
  currentFr = 30;
  config = false;
  frameRate(30);
  maxTests = 32;
  testDur = new int[maxTests];
  testDur[0] = 3;
  testDur[1] = 3;
  testDur[2] = 3;
  testDur[3] = 3;
  testDur[4] = 3;
  testDur[5] = 3;
  testDur[6] = 3;
  testDur[7] = 3;
  testDur[8] = 3;
  testDur[9] = 3;
  testDur[10] = 3;
  testDur[11] = 3;
  testDur[12] = 3;
  testDur[13] = 3;
  testDur[14] = 3;
  testDur[15] = 3;
  testDur[16] = 3;
  testDur[17] = 3;
  testDur[18] = 3;
  testDur[19] = 3;
  testDur[20] = 3;
  testDur[21] = 3;
  testDur[22] = 3;
  testDur[23] = 3;
  testDur[24] = 3;
  testDur[25] = 3;
  testDur[26] = 3;
  testDur[27] = 3;
  testDur[28] = 3;
  testDur[29] = 15;
  testDur[30] = 3;
  testDur[31] = 30;
  smooth();
  background(0);
}

void draw() {
  background(0);
  test();
}

void test(){
  //blank screen
  if(!config) {
    //sets the test duration
    int dur = testDur[currentTest];
    frCounter = 0;
    maxCounter = dur * int(currentFr);
    println("test"+currentTest+": "+maxCounter);
    holder3 = 0;
    config = true; 
    //sets any other needed variable
    
    //calls itself for first render action
    test();
  } else {
    int a, b;
    //run the test actions
    switch(currentTest){
      case 0:
        //do nothing
        break;
      case 1:
        //render the outisde template
        digitalFacadeOverlay();
        break;
      case 2:
        //render a white to gray gradient
        a = 253;
        b = 255-(_width-80);
        createGradient(a,b,'a','h');
        break;
      case 3:
        //render a white to gray gradient
        a = 0;
        b = 0+_width-80;
        createGradient(a,b,'a','h');
        break; 
      case 4:
        //render a red to black gradient
        a = 253;
        b = 255-(_width-80);
        createGradient(a,b,'r','h');
        break;
      case 5:
        //render a black to red gradient
        a = 0;
        b = 0+_width-80;
        createGradient(a,b,'r','h');
        break;
      case 6:
        //render a blue to black gradient
        a = 253;
        b = 255-(_width-80);
        createGradient(a,b,'b','h');
        break;
      case 7:
        //render a black to blue gradient
        a = 0;
        b = 0+_width-80;
        createGradient(a,b,'b','h');
        break;
      case 8:
        //render a green to black gradient
        a = 253;
        b = 255-(_width-80);
        createGradient(a,b,'g','h');
        break;
      case 9:
        //render a black to green gradient
        a = 0;
        b = 0+_width-80;
        createGradient(a,b,'g','h');
        break;
      case 10:
        //render a white to black vgradient
        a = 253;
        b = 255-(_height-80);
        createGradient(a,b,'a','v');
        break;
      case 11:
        //render a black to white vgradient
        a = 0;
        b = 0+_height-80;
        createGradient(a,b,'a','v');
        break;
      case 12:
        //render a red to black vgradient
        a = 253;
        b = 255-(_height-80);
        createGradient(a,b,'r','v');
        break;
      case 13:
        //render a black to red vgradient
        a = 0;
        b = 0+_height-80;
        createGradient(a,b,'r','v');
        break;
      case 14:
        //render a blue to black vgradient
        a = 253;
        b = 255-(_height-80);
        createGradient(a,b,'b','v');
        break;
      case 15:
        //render a black to blue vgradient
        a = 0;
        b = 0+_height-80;
        createGradient(a,b,'b','v');
        break;
      case 16:
        //render a green to black vgradient
        a = 253;
        b = 255-(_height-80);
        createGradient(a,b,'g','v');
        break;
      case 17:
        //render a black to green vgradient
        a = 0;
        b = 0+_height-80;
        createGradient(a,b,'g','v');
        break;
      case 18:
        //b+w grid
        createGrid('b');
        break;
      case 19:
        //color animated grid
        createGrid('c');
        break;
      case 20:
        //Lines Anim HOrizontal 60 fps, float speed
        animLines('f');
        break;
      case 21:
        //Lines Anim HOrizontal 60 fps, int speed
        animLines('i');
        break;
      case 22:
        //Lines Anim HOrizontal 30 fps, float speed
        animLines('f');
        break;
      case 23:
        //Lines Anim HOrizontal 30 fps, int speed
        animLines('i');
        break;
      case 24:
        //Lines Anim HOrizontal 24 fps, float speed
        animLines('f');
        break;
      case 25:
        //Lines Anim HOrizontal 24 fps, int speed
        animLines('i');
        break;
      case 26:
        //Lines Anim HOrizontal 15 fps, float speed
        animLines('f');
        break;
      case 27:
        //Lines Anim HOrizontal 15 fps, int speed
        animLines('i');
        break;
      case 28:
        //Fast Rotation noSmooth
        rotateLines(10.0,true);
        break;
      case 29:
        //Slow Rotation nsmooth
        rotateLines(0.5,true);
        break;
      case 30:
        //Fast Rotation noSmooth
        rotateLines(10,false);
        break;
      case 31:
        //Slow Rotation noSmooth
        rotateLines(0.5,false);
        break;

      }
    saveFrame("output/test"+currentTest+"_#####.jpg");
    //counter increase
    frCounter++;
    //check for defined test end
    if(frCounter == maxCounter) {
      nextTest();
    }
    //println(frCounter);
  }
}

//reset for next test
void nextTest() {
  config = false;
  smooth();
  currentTest++;
  if(currentTest >= maxTests) {
    currentTest = 0;
  }
  int fr;
  if(currentTest == 20 || currentTest == 21) {
    fr = 60;
  } else if (currentTest == 24 || currentTest == 25 ) {
    fr = 24;
  } else if (currentTest == 26 || currentTest == 27) {
    fr = 15;
  } else {
    fr = 30;
  }
  currentFr = fr;
  frameRate(fr);
  //review
  holder1 = 0;
}

//rotate a line under the center
void rotateLines(float speed, boolean sm) {
  if(sm) {
    smooth();
  } else {
    noSmooth();
  }
  holder3 += speed;
  pushMatrix();
    rectMode(CENTER);
    translate(_width*.5,_height*.5);
    rotate(radians(holder3));
    rect(0,0,2,_height);
  popMatrix();
  rectMode(CORNER);
}

void animLines(char mode) {
  float speed;
  if(mode == 'f') {
    speed = 4.3;
  } else {
    speed = 3;
  }
  //separation
  float separation = 5;
  float x = ((speed+separation) * frCounter) %198;
  //println(x);
  fill(255);
  rect(40+x,0,4,_height);
}


//crea un grid b+w o en color
void createGrid(char mode) {
  color c = color(255);
  noStroke();
  for(int i = 0; i <= _width; i++) {
    for(int j = 0; j<=_height; j++) {
      if(mode == 'b') {
        if(i%2 == 0) {
          c = color (j%2*255);
        } else {
          c = color ((j+1)%2*255);
        }
      } else {
        c = color(random(0,255),random(0,255),random(0,255));
      }
      fill(c);
      rect(i,j,1,1);
    };
  };
}
//draws a vertical or horizontal gradient
void createGradient(float startColor,float endColor, char channel, char direction) {
  int c;
  //println("startColor:"+startColor+"endColor:"+endColor+"channel:"+channel+"direction:"+direction+"w:"+_width);
  noStroke();
  if(direction == 'h') {
      float deltaColor = (endColor - startColor) / ( _width - 80);
      //println("deltaColor:"+deltaColor);
      for(int i = 40; i<=_width-40; i++){
        //select de color for the gradient
        switch(channel){
          case 'a':
            //println();
            c = int(startColor + ((i-40)*deltaColor));
            fill(c);
            break;
          case 'r':
            c = int(startColor + ((i-40)*deltaColor));
            fill(c,0,0);
            break;
          case 'g':
            c = int(startColor + ((i-40)*deltaColor));
            fill(0,c,0);
            break;
          case 'b':
            c = int(startColor + ((i-40)*deltaColor));
            fill(0,0,c);
            break;
        }
        //
        rect(i,0,1,_height);
      }; 
  } else {
    
    float deltaColor = (endColor - startColor) / (_height - 80);
    for(int i = 40; i<=_height-40; i++){
      //select de color for the gradient
      switch(channel){
        case 'a':
          //println();
          c = int(startColor + ((i-40)*deltaColor));
          fill(c);
          break;
        case 'r':
          c = int(startColor + ((i-40)*deltaColor));
          fill(c,0,0);
          break;
        case 'g':
          c = int(startColor + ((i-40)*deltaColor));
          fill(0,c,0);
          break;
        case 'b':
          c = int(startColor + ((i-40)*deltaColor));
          fill(0,0,c);
          break;
      }
      rect(0,i,_width,1);
    };
  }
}

void digitalFacadeOverlay() {
  //Draws a debug overlay of the external of the digital facade
  noStroke();
  noSmooth();
  fill(overColor);
  //top margin
  rect(0,0,_width,40);
  //left margin
  rect(0,0,40,_height);
  //right margin
  rect(_width-40,0,40,_height);
  //bottom margin
  rect(0,_height-40,_width,40);
  //left corners
  rect(40,40,36*2,16);
  rect(40,40+16,36,16);
  //right corners
  rect(232-(36*2),40,36*2,16);
  rect(232-36,40+16,36,16);
}
void keyPressed() {
  nextTest();
}

