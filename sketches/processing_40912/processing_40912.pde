
int num = 20;
//creating space for arrays:
Walker [] walk = new Walker[num];                //amount of times to draw the class specified below
float [] walkx = new float[num];                 //x location of each iteration of the class drawn
float [] walky = new float[num];                 //y loaction of each iteration of the calss drawn
//float [] walkSize = new float[num];
color [] grayScale = new color[5];               //color picking tool will use this array of colors to be selected later

void setup() {
  size(300,300);
  background(255);
  smooth();
  colorMode(HSB);                                //colors in the picker will use HSB values

  grayScale[0] = color(100,100,80);              //green
  grayScale[1] = color(175,100,80);              //blue?
  grayScale[2] = color(0,0,100);                 //white
  grayScale[3] = color(0,0,0);                   //full black
  grayScale[4] = color(0,0,25);                  //gray tone

  for(int i = 0; i < walk.length; i ++) {        //for the full array length:
    walk[i] = new Walker();                      //draw an instance of the class
    walkx [i] = random(-25,25);                  //determine a 'x' position
    walky [i] = random(-25,25);                  //determine a 'y' position
    //walkSize [i] = 5;
  }
}

void draw() {
  blend(0,0,width,height,0,0,width,height,LIGHTEST);   //blending the colors from corner to corner
  for(int i = 0; i < num; i++) {                       
    walk[i].update();                                  //update location of each walker
    walk[i].display();                                 //redraw each of the walker
  }
}










class Walker {

  int walkSize = 5;                                    //size of each class piece drawn
  color colorPicker = grayScale[floor(random(0,5))];   //colorPicker will determine which value from the color array to use

  Walker() {                                           //no constructors used to call this class
  }

  void update() {
    for(int i = 0; i < num; i++) {
      walkx[i] += random(-1,1);                        //update the x and y locations
      walky[i] += random(-1,1);
      //if(dist(walkx[i],walky[i],walkx[int(random(0,num))],walky[int(random(0,num))]) < 25) {
      //walkSize[i] *=4;
      //}
    }
  }

  void display() {                                     //display draws the rectangles with their new locations
    pushMatrix();
    translate(width/2,height/2);
    noStroke();
    fill(colorPicker,2);
    for(int i = 0; i < num; i++) {
      rect(walkx[i],walky[i],walkSize,walkSize);
    }
    popMatrix();
  }
}


