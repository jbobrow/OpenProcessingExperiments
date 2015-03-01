
/**
 * Bezier. 
 * 
 * The first two parameters for the bezier() function specify the 
 * first point in the curve and the last two parameters specify 
 * the last point. The middle parameters set the control points
 * that define the shape of the curve. 
 */
int nbePoints=6;
int [] palette={#BF2B1D,#FFD16A,#FF7B45};//,#D1769C};
float [][] vertC;
float []lettersFreq= {
  8.167, 1.492, 2.782, 4.253, 13.0001, 2.228, 2.015, 6.094, 6.966, 0.153, 0.772, 4.025, 2.406, 6.749, 7.507, 
  1.929, 0.095, 5.987, 6.327, 9.056, 2.758, 0.978, 2.360, 0.150, 1.974, 0.074
};
float totalFreq=0;
float []vertDebut= {
  0, 0, 5, 0, 5, 0, 10, 0, 15, 0, 15, 0, 20, 0, 25, 0, 25, 0, 30, 0, 35, 0, 35, 0, 40, 0, 45, 0, 45, 0, 50, 0
};
float []vertTemp=new float[32];
MutCharact [] chars=new MutCharact[374];
float ech=1;

void setup() {
  size(800, 800); 
  frameRate(20);
  strokeWeight(3*ech);
  stroke(255);
  noFill();
  for (float f : lettersFreq) {
    totalFreq+=f;
  }
  String[] stuff = loadStrings("data.txt");
  vertC=new float[stuff.length][32];
  // Convert string into an array of integers using ';' as a delimiter
  for (int i=0; i<stuff.length; i++) {
    for (int j=0; j<32; j++) {
      if (j%2==0)vertC[i][j]=float(split(stuff[i], ";")[j]);
      else vertC[i][j]=float(split(stuff[i], ";")[j])-170;
    }
  }
  for (int c=0; c<chars.length; c++) {
    chars[c]=new MutCharact(char(97+weightedRandom()), new PVector(20+35*(c%22), 30+int(c/22)*45));
  }
  //vertDebut=randomize(vertDebut,0,100);
}

void draw() {
  background(#0C0526);
  //text(frameCount, 200, 200);
  for (int c=0; c<chars.length; c++) {//chars.length
    chars[c].morphCycle();
  }
}
int weightedRandom() {
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
  println(randomIndex);
  return randomIndex;
}
float[] randomize(float[]arr, int min, int max) {
  for (int i=0; i<arr.length; i++) {
    arr[i]=random(min, max);
  }
  return arr;
}
class Charact {
  char ch;
  PVector loc;
  int valchar;
  Charact(char ch) {
    valchar=int(ch)-97;
  }
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
class MutCharact {
  char ch;
  PVector loc;
  int valchar;
  float t=0;
  int stayTime=int(random(150));
  int morphTime=20+int(random(10));
  int cycleTime=2*(morphTime+stayTime);
  int newValChar;
  int col=palette[int(random(palette.length))];
  float []vertM=new float[vertDebut.length];
  MutCharact(char ch, PVector loc) {
    valchar=int(ch)-97;
    this.loc=loc;
  }
  void morphCycle() {
    stroke(col);

    if (frameCount%(cycleTime)<=stayTime) {
      displayCharact(valchar, loc);
      if (frameCount%(cycleTime)==stayTime) {
        newValChar=weightedRandom();
        t=0;
      }
    } else if (frameCount%(cycleTime)<=stayTime+morphTime) {
      morphToChar(vertC[valchar], vertC[newValChar], loc, t);
      t+=(float)1/morphTime;
      if (frameCount%(cycleTime)==stayTime+morphTime) {
        valchar=weightedRandom();
        t=0;
        if(random(1)>.8)col=palette[int(random(palette.length))];
      }
    } else if (frameCount%(cycleTime)<2*stayTime+morphTime) {
      displayCharact(newValChar, loc);
    } else if (frameCount%(cycleTime)<cycleTime) {
      morphToChar(vertC[newValChar], vertC[valchar], loc, t);
      t+=(float)1/morphTime;
    }
  }

  //  void displayDebut(PVector location) {
  //    float ratio;
  //    beginShape();
  //    vertex(location.x+ech*vertM[0], location.y+ech*vertM[1]);
  //    for (int i = 2; i <nbePoints*6-6; i +=6) {//
  //      ratio=sin(frameCount/5);
  //      bezierVertex(location.x+ech*vertM[i], location.y+ech*(vertM[i+1]+i*ratio), location.x+ech*vertM[i+2], location.y+ech*(vertM[i+3]-i*ratio), location.x+ech*vertM[i+4], location.y+ech*vertM[i+5]);
  //    }
  //    endShape();
  //  }
  void displayCharact(int val, PVector location) {
    beginShape();
    vertex(location.x+ech*vertC[val][0], location.y+ech*vertC[val][1]);
    for (int i = 2; i <nbePoints*6-6; i +=6) {//
      bezierVertex(location.x+ech*vertC[val][i], location.y+ech*vertC[val][i+1], location.x+ech*vertC[val][i+2], 
      location.y+ech*vertC[val][i+3], location.x+ech*vertC[val][i+4], location.y+ech*vertC[val][i+5]);
    }
    endShape();
  }
  void morphToChar(float[] src, float[] dest, PVector location, float ratio) {
    float[]temp=new float[src.length];
    for (int i=0; i<src.length; i++) {
      temp[i]=src[i]+ratio*(dest[i]-src[i]);
    }
    beginShape();
    vertex(location.x+ech*temp[0], location.y+ech*temp[1]);
    for (int i = 2; i <nbePoints*6-6; i +=6) {//
      bezierVertex(location.x+ech*temp[i], location.y+ech*temp[i+1], location.x+ech*temp[i+2], 
      location.y+ech*temp[i+3], location.x+ech*temp[i+4], location.y+ech*temp[i+5]);
    }
    endShape();
  }
}



