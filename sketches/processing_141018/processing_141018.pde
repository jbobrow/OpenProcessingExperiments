


int w = 768;
int h = 768;
PImage img;
//how many pixels are in a group? ---g
int grSize = 11;
// this will be the full count of groups in the entire comp
int grCount;
IntList blacklist;

//how much of the accent color do you want to mix in? The lower this number the higher chance of the color showing appearing. -- p
float oddMix = 31;
color oddCol;

//this is all just test stuff
PImage newimg;



PixGr[] pixGr;

//this object represents each pixel group
class PixGr {
  boolean horz;
  IntList members;
  PixGr(boolean h) {
    this.members = new IntList();
    this. horz = h;
  }
}

void setup() {
  size(w, h);
  img = loadImage("image.jpg");
  img.loadPixels();
  //println(img.pixels.length);
  //println(img.width * img.height);
  grCount = img.width * img.height / grSize;

  //odd color
  oddCol = color(48, 191, 247);

  //instantiate pixel groups
  pixGr = new PixGr[grCount];
  //instantiate the blacklist
  //this holds pixel indices that have already been used
  blacklist = new IntList();
  //current pixel index
  int p = 0;
  //for each pixel group
  for (int g = 0; g<grCount; g++) {
    //if the pixel is on the blacklist up the increment until one is found that's not
    while ( (pFound (blacklist, p))) {
      p++;
    }

    //instantiate a new pixel group
    pixGr[g] = new PixGr(binRand());
    //if there's not enough pixels in horizontal space to clear then the group cannot be horizontal*/
    for (int q = 1; q<grSize-1; q++) {
      if (pFound(blacklist, p+q)) {
        pixGr[g].horz=false;
        break;
      }
    }

    int inc;
    //set the pixel group member increment based on horizontal vs vertical
    if (pixGr[g].horz) {
      inc = 1;
    }
    else {
      inc = img.width;
    }

    //for each member of each pixel group
    for (int m = 0; m<grSize; m++) {
      //set a new pixel index to work with
      int pix = p+m*inc;
      //make sure the pixel is within the bounds of the image
      if (pix<img.pixels.length) {
        //set the pixel to be a member of the latest group
        pixGr[g].members.set(m, pix);
        //add the pixel to the blacklist so it doesn't get overlapped
        blacklist.append(pix);
      }
      //float prog = g/grCount;
      //println(prog);
      println(g + "/" + grCount);
    }
    //close (if not found)
    p++;
    if (p>img.pixels.length) {
      break;
    }
  }

  //renderColorMap();
  renderLineSmear();
}
void draw() {
  if(mousePressed){
   save("smear_"+ frameCount +".jpg"); 
  }
}
//helper function that chooses a random boolean
boolean binRand() {
  boolean b;
  float r = random(4);
  if (r > 1) {
    b = true;
  } 
  else {
    b = false;
  }
  return b;
}

//this helper function checks the existing groups for the pixel in question
boolean pFound(IntList bl, int p) {
  boolean f = false;
  for (int i = 0; i<bl.size();i++) {
    if (bl.get(i) == p) {
      f=true;
      break;
    }
  }
  return f;
}

//this function extrudes the pixel color of each group along a line.
void renderLineSmear() {
  IntList played = new IntList();
  int c = 0;
  while (c<pixGr.length) {
    int g = round(random(grCount));
    if (!pFound(played, g)) {

      //will the lines increase or decrease?
      boolean pos = binRand();
      for (int m=0; m<pixGr[g].members.size(); m++) {
        int thisp = pixGr[g].members.get(m);
        stroke(1);
        stroke(img.pixels[thisp]);
        smooth();
        if (isit(oddMix)) {
          stroke(oddCol);
        }
        int x= thisp % img.width;
        int y = floor(thisp / img.width);
        if (pixGr[g].horz && pos) {
          line(x, y, x, 0);
        }
        else if (pixGr[g].horz && !pos) {
          line(x, y, x, h);
        }
        else if (!pixGr[g].horz && pos) {
          line(x, y, 0, y);
        }
        else if (!pixGr[g].horz && !pos) {
          line(x, y, w, y);
        }
        played.append(g);
      }
    }
    c=played.size();
  }
  println("finished: "+played.size());
}

//this function renders a test color map to see if pixels are arranging properly in groups.
void renderColorMap() {

  //temp draw function to see group layouts
  newimg = new PImage(img.width, img.height);
  newimg.loadPixels();
  for (int g=0; g<pixGr.length; g++) {
    color c = color(random(255), random(255), random(255));
    for (int m=0; m<pixGr[g].members.size(); m++) {
      newimg.pixels[pixGr[g].members.get(m)] = c;
      pixGr[g].members.get(m);
    }
  }
  newimg.updatePixels();
  image(newimg, 0, 0);
}


boolean isit(float p) {
  boolean bin;
  float r = random(1);
  float prb = 1/p;
  if (r<prb) {
    bin = true;
  }
  else {
    bin = false;
  }
  return bin;
}

