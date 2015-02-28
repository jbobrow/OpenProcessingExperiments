
//set global list of rows to simulate varying strip lengths
int[] rowList = {10, 10, 8, 12, 8, 13, 10, 10, 11, 12 , 7, 10, 10, 10};
ArrayList<Boxel> boxels;
int frameIndex;
ChaseFX chase;
color selectedC;

void setup(){
  size(400, 600); //change this to 1200 for nexus 7
  background(255);
  //colorMode(HSB, 360, 100, 100);
  colorMode(HSB, 360, 100, 100);
  boxels = new ArrayList<Boxel>();
  for (int i = 0; i < rowList.length; i++) {
      for (int j = 0; j < rowList[i]; j++) {
        Boxel newBoxel = new Boxel(j, i);
        boxels.add(newBoxel);
      }
    }
  chase = new ChaseFX(color(0,0,0));
  noStroke();
  translate(width * 0.25, height * 0.75);
  saturationChanger(50,100);
}

void draw(){
  frameIndex = (frameCount % boxels.size());
  //pickColor(); //<-- once per frame check to see whether a enw color has been picked
  //pickEffect(); <-- once per framae check to see whether a new effect has been picked
  //doEffect(frameIndex % boxels.size());
  doEffect();
  for (int i = 0; i < boxels.size(); i++) {
      Boxel b = boxels.get(i);
      render(b);
    }
}

void mousePressed() {
  selectedC = get(mouseX, mouseY);
  chase.setBaseC(selectedC);
}

void render(Boxel b) {
  //if (b.currentC != b.lastC) {
    fill(b.currentC);
    b.setC(b.currentC);
    float ysize = (height/rowList.length)/2;
    float xsize = width/rowList[b.ypos];
    rect((xsize * b.xpos), (ysize * b.ypos), xsize, ysize);
  //}
}

void pickColor() {
  if ((frameCount % (60 * 10)) == 0) {
    float newH = random(360);
    float newS = random(100);
    color newC = color(newH, newS, 50.0);//brightness(chase.baseC));
    chase.setBaseC(newC);
  }
}

void doEffect() {
  chase.FXloop();
}

void saturationChanger(int i, int initial){
 if(i > 0){
  colorTriangle(256,0,initial,initial);
  saturationChanger(i-1, initial-2);
 }
}

void colorTriangle(int iteration, int h, int s,int height){
 if(iteration > 0){
  fill(h%6,s,256);
  triangle(0,0,128*tan(radians(5.625/4)),height,-128*tan(radians(5.625/4)),height);
  rotate(radians(5.625/4));
  colorTriangle(iteration-1, h+1, s, height);
 }
}

class ChaseFX {
  color baseC;
  int chaseFlip;
  int leadFlip;

  ChaseFX(color tempBaseC) {
    baseC = tempBaseC;
    chaseFlip = 1;
    leadFlip = 1;
  }

  void FXloop() {
    int changeMag;
    for (int i = 0; i < boxels.size(); i++) {
      if ((i >= (frameIndex - 25)) && ((i + 1) <= frameIndex)) {
        println("normal case, frameIndex: " + str(frameIndex) + " bindex: " + str(i) + " mag: " + str(frameIndex - i));
        changeBri(i, (frameIndex - i));
      }
      if ((frameIndex < 25) && (frameCount > 25)) { //skip chase the wrap case the first 25 frames
        int diff = 25 - frameIndex;
        if (i >= (boxels.size() - diff)) {
          println("wrap case, frameIndex: " + str(frameIndex) + " bindex: " + str(i) + " mag: " + str(boxels.size() - i + frameIndex));
          changeBri(i, (boxels.size() - i + frameIndex));
        }
      }
    }
  }

  void changeBri(int bIndex, int briChange) {
    Boxel b = boxels.get(bIndex);
    Boxel leadb = boxels.get(frameIndex);
    //float bri = brightness(b.currentC);
    float bri = brightness(leadb.currentC);
    int increment = 1;
    println("incrementing " + str(bIndex) + " by briChange " + str(briChange));
      //println("Incrementing lead boxel brightness from " + str(bri) + " to " + str(bri + leadFlip)); 
    for (int i = 0; i < briChange; i++) {
        if (((bri + increment) > 100) || ((bri + increment) < 0)) {
          chaseFlip *= -1;
        }
      bri += increment * chaseFlip;
      println("bri incrementing: " + str(bri));
    }
    color newC = color(hue(baseC), saturation(baseC), bri);
    println("Old brightness: " + str(brightness(b.currentC)));
    println("New brightness: " + str(brightness(newC)));
    println("Bri: " + str(bri));
    b.setC(newC);
  }

  void setBaseC(color newBaseC) {
    baseC = newBaseC;
  }
}

class Boxel {
  color currentC;
  color lastC;
  int xpos;
  int ypos;

  Boxel(int tempXpos, int tempYpos) {
    currentC = color(0,0,0);
    lastC = color(0,0,0);
    xpos = tempXpos;
    ypos = tempYpos;
  }

  void setC(color newC) {
    lastC = currentC;
    currentC = newC;
  }
}
