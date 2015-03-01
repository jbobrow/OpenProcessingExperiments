
/**
 *Pierre MARZIN 07/2014
 *I decided to morph some characters into some other characters. To achieve that, I designed
 *each letter using a curve of 6 Bezier points. The letters in this sketch are choosen according
 *to their frequency in english...
 */
int nbePoints=6;//number of points in each bezier "character"
int [] palette= {
  //#BF2B1D, #FFD16A, #FF7B45
  #BF220B, #7F1707, #FF2E0E, #A00B04, #E5290D
};//,#D1769C};//colors used for the characters
float [][] vertC;//all the points absolute coordinates for each of the 26 english letters
float []lettersFreq= {//global letter frequencies in english
  8.167, 1.492, 2.782, 4.253, 13.0001, 2.228, 2.015, 6.094, 6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 
  1.929, 0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.360, 0.150, 1.974, 0.074
};
float totalFreq=0;//sum of these frequencies, used for the weighted algorithm
MutCharact [] chars=new MutCharact[374];// array of the displayed morphable characters
float ech=1;//scale of the characters
//**********************************************************************************************************
//**********************************************************************************************************
void setup() {
  size(800, 800); 
  strokeWeight(3*ech);//strokeWeight proportionate to the characters
  stroke(255);
  strokeJoin(ROUND);
  noFill();
  for (float f : lettersFreq) {//summing the letters frequencies
    totalFreq+=f;
  }
  String[] stuff = loadStrings("data.txt");//loading and parsing the coordinates ofthe vectorized characters
  vertC=new float[stuff.length][32];
  // Convert string into an array of integers using ';' as a delimiter
  for (int i=0; i<stuff.length; i++) {
    for (int j=0; j<32; j++) {
      if (j%2==0)vertC[i][j]=float(split(stuff[i], ";")[j]);//my Bezier characters were badly centered, I had to lower their y coordinate...
      else vertC[i][j]=float(split(stuff[i], ";")[j])-170;
    }
  }
  for (int c=0; c<chars.length; c++) {//creation of the MutCharact objects (mutable characters), displayed as a grid
    chars[c]=new MutCharact(char(97+weightedRandom()), new PVector(20+35*(c%22), 30+int(c/22)*45));
  }
}
//**********************************************************************************************************
void draw() {
  background(200);//#0C0526);
  for (int c=0; c<chars.length; c++) {//every MutCharact cycles through its morphing cycle
    chars[c].morphCycle();
  }
}
//**********************************************************************************************************
int weightedRandom() {//this algorithm is a simple way of choosing by weighted random (favor each element according to its frequency/probability)
  float ran=random(totalFreq);
  int randomIndex=-1;
  for (int i = 0; i < 26; ++i)
  {
    ran -= lettersFreq[i];
    if (ran <= 0)
    {
      randomIndex = i;
      break;
    }
  }
  return randomIndex;
}
//**********************************************************************************************************
float[] randomize(float[]arr, int min, int max) {//not used, filling an array with ranged random values
  for (int i=0; i<arr.length; i++) {
    arr[i]=random(min, max);
  }
  return arr;
}

//**********************************************************************************************************
//**********************************************************************************************************
class MutCharact {//this is the main object class
  char ch;//initial character
  PVector loc;//location
  int valchar;//index of the currently displayed character in the alphabet
  float t=0;//will cycle from 0 to morphTime, used in morphCharact function
  int stayTime=20+int(random(50));//how long a character stays after being fully morphed
  int morphTime=20+int(random(20));//how long the morphing takes
  int cycleTime=(morphTime+stayTime+1);//total cycle
  int newValChar;//morphing target index
  int col=palette[int(random(palette.length))];//choosen color

  MutCharact(char ch, PVector loc) {//constructor
    valchar=int(ch)-97;
    this.loc=loc;
  }
  //**********************************************************************************************************
  void morphCycle() {//here is the morph cycle function
    stroke(col);
    if (frameCount%(cycleTime)<=stayTime) {//first the character is fixed for a while
      loc.x+=2;
      loc.y+=2;
      stroke(col, 150);
      displayCharact(valchar, loc);      
      loc.x-=2;
      loc.y-=2;
      stroke(col);
      displayCharact(valchar, loc);
      if (frameCount%(cycleTime)==stayTime) {//at the end of this period, a target character is choosen for the morphing
        newValChar=weightedRandom();
        t=0;//timecount is reset
      }
    } else if (frameCount%(cycleTime)<=stayTime+morphTime) {//now the initial character is morphed into the target
      morphToChar(vertC[valchar], vertC[newValChar], loc, t);
      t+=(float)1/morphTime;//morphing ratio is increased at each frame
      if (frameCount%(cycleTime)==stayTime+morphTime) {//when morphing is done, 
        valchar=newValChar;//the target becomes the initial character
        t=0;//timecount is reset and the length for the next cycle are computed
        stayTime=80+int(random(280+350*sin(frameCount/150)));//80+int(random(250));//
        morphTime=20+int(random(20));
        cycleTime=(morphTime+stayTime+1);
        if (random(1)>.6)col=palette[int(random(palette.length))];//from times to times color is changed
      }
    }
  }
  //**********************************************************************************************************
  void displayCharact(int val, PVector location) {//displaying the character

    beginShape();
    vertex(location.x+ech*vertC[val][0], location.y+ech*vertC[val][1]);//first control point
    for (int i = 2; i <nbePoints*6-6; i +=6) {//for each of the remaining points,
      bezierVertex(location.x+ech*vertC[val][i], location.y+ech*vertC[val][i+1], location.x+ech*vertC[val][i+2], //2 anchor points and the second control are added to the shape
      location.y+ech*vertC[val][i+3], location.x+ech*vertC[val][i+4], location.y+ech*vertC[val][i+5]);
    }
    endShape();
  }
  //**********************************************************************************************************
  void morphToChar(float[] src, float[] dest, PVector location, float ratio) {//here is the morphing function
    float[]temp=new float[src.length];
    for (int i=0; i<src.length; i++) {
      temp[i]=src[i]+ratio*(dest[i]-src[i]);//morphed points calculation
    }
    beginShape();//new bezier is built and displayed
    vertex(location.x+ech*temp[0], location.y+ech*temp[1]);
    for (int i = 2; i <nbePoints*6-6; i +=6) {//
      bezierVertex(location.x+ech*temp[i], location.y+ech*temp[i+1], location.x+ech*temp[i+2], 
      location.y+ech*temp[i+3], location.x+ech*temp[i+4], location.y+ech*temp[i+5]);
    }
    endShape();
  }
}
//**********************************************************************************************************
//**********************************************************************************************************
class Charact {//simple character class, used to test my bezier characters designs
  char ch;
  PVector loc;
  int valchar;

  Charact(char ch) {
    valchar=int(ch)-97;
  }
  //**********************************************************************************************************
  void display(PVector location) {
    beginShape();
    vertex(location.x+ech*vertC[valchar][0], location.y+ech*vertC[valchar][1]);
    for (int i = 2; i <nbePoints*6-6; i +=6) {//
      bezierVertex(location.x+ech*vertC[valchar][i], location.y+ech*vertC[valchar][i+1], location.x+ech*vertC[valchar][i+2], 
      location.y+ech*vertC[valchar][i+3], location.x+ech*vertC[valchar][i+4], location.y+ech*vertC[valchar][i+5]);
    }
    endShape();
  }
}



