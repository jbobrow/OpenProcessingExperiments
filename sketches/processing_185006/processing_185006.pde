
Figure mother;
int[] pushedList;
int   pushedListIndex;
int   pushedSum;
int   PUSHED_LIST_LENGTH = 5;
int   COLOR_RESOLUTION = PUSHED_LIST_LENGTH * 10;
int   COLOR_RANGE = 160;

int   window_w = 480;
int   window_h = window_w;

void setup() {
  size(window_w, window_h); 
  colorMode(HSB, width, height, 100); 
  frameRate(30);

  //background(48);
  stroke(255);
  //fill(255);

  noStroke();
  noFill();
  //smooth();
  
  // init vars
  mother = new Figure(new Vertex(0, 0));
  
  pushedList = new int[PUSHED_LIST_LENGTH];
  pushedListIndex = 0;
}

void draw() {
  background((13 * pushedSum)%360, 100, 16);
  mother.update();
  
  pushMatrix();
  translate(width/2, height/2);
  noStroke();
  mother.draw();
  popMatrix();
  
  // UI
  pushMatrix();
  stroke(0, 9, 255, 220);
  fill(0, 9, 255, 220);
  translate(width/10, height/10);
  for(int i = 0; i < PUSHED_LIST_LENGTH ; i++)
  {
    float rad = 0;
    float dRad = 2 * PI / pushedList[(pushedListIndex + PUSHED_LIST_LENGTH - i)%PUSHED_LIST_LENGTH];
    float r = 10;
      
    beginShape();
    for(int n = 0; n < pushedList[(pushedListIndex + PUSHED_LIST_LENGTH - i)%PUSHED_LIST_LENGTH]; n++)
    {
      vertex(r * cos(rad), r * sin(rad));
      rad += dRad;
    }
    endShape();  
  
    translate(3 * r, 0);
  }
  popMatrix();
  //String str = new String(pushedList, 0, PUSHED_LIST_LENGTH);
  //text(str, 5, 15);
}

void keyPressed() {
  if('0'<= key && key <= '9')
  {
    pushedListIndex = (pushedListIndex + 1) % PUSHED_LIST_LENGTH;
    pushedList[pushedListIndex] = (int)key - '0';
    
    pushedSum = 0;
    for(int i = 0; i < PUSHED_LIST_LENGTH; i++)
    {
      pushedSum += pushedList[i];
    }
  }
  if(key == '0')
  {
    for(int i = 0; i < PUSHED_LIST_LENGTH; i++)
    {
      pushedList[i] = 0;
      pushedListIndex = 0;
    }
  }
  makeFigure();
  draw();
}

void keyReleased() {

}

void makeFigure()
{
  mother = null;
  mother = new Figure(new Vertex(0, 0));
  
  int l = width/2;
  
  // slide buffer
  for(int i = 0; i < PUSHED_LIST_LENGTH ; i++)
  {
    mother.addChildren(pushedList[(pushedListIndex + PUSHED_LIST_LENGTH - i)%PUSHED_LIST_LENGTH], l);
    l /= 2;
  }
}





