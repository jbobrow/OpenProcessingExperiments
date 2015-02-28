
Snail sn0, sn1, sn2;
int tn = 0;
int[] colors;
int fColour, sColour;
float sWidth;
int NBR_TRIANGLES = 216;
LinkedList<Integer> triList = new LinkedList<Integer>();

void setup() {
  size(660, 300);
  colors = new int[] { //define colors here
    color(#C00000), color(#00C000), 
    color(#0000C0), color(#C0C0C0), 
    color(#FFAA68), color(#000000)
  };
  sColour = color(0);
  sWidth = 1.0;
  sn0 = new Snail(this, width/6, height/2, 15.0);
  sn1 = new Snail(this, width/2, height/2, 20);
  sn2 = new Snail(this, 5 * width/6, height/2, 17.5);
  tn = 0;
  fillTriList();
  background(255);
  frameRate(30);
}

void draw() {
  if (tn < NBR_TRIANGLES) {
    fColour = colors[tn % colors.length];
    sn0.draw(tn, fColour, sColour, sWidth);
    sn2.draw(NBR_TRIANGLES - 1 - tn, fColour, sColour, sWidth);
    // Get a random triangle
    int rndTri = (int) random(0, triList.size());
    int rndTriNbr = triList.remove(rndTri);
    fColour = colors[rndTriNbr % colors.length];
    sn1.draw(rndTriNbr, fColour, sColour, sWidth);
  }
  else if (tn > NBR_TRIANGLES + 30) {
    background(255);
    fillTriList();
    sn0.setClockwise(!sn0.isClockwise());
    sn2.setClockwise(!sn2.isClockwise());
    sn0.setSize(random(12, 20));
    sn1.setSize(random(16, 20));
    sn2.setSize(random(12, 20));
    tn = -1;
  }
  tn++;
}

void fillTriList() {
  triList.clear();
  for (int i = 0; i < NBR_TRIANGLES; i++)
    triList.add(new Integer(i));
}


