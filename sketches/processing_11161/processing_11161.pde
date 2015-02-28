
void setup() {
  size( 800, 400 );
  smooth();
  noLoop();
}

void keyPressed() {
  setup();
  redraw();
} 

void draw() {
  background(random(0, 50));
  float tmpX = random(0,20);

  while ( tmpX < 800 ) {
    float tmpHeight = random(height/3, height * 1.1);
    float tmpWidth = tmpHeight / random(3, 4);

    Building tmpBuild = new Building(tmpX, tmpHeight, tmpWidth, int(random(8, 12)), int(random(8, 12)));
    tmpBuild.display();
    tmpX += tmpWidth + random(-20,20);
  }
}


class Building {
  float x, y; // X-coordinate, y-coordinate
  float myHeight;
  float myWidth;

  Windows windows;  

  Building(float xpos, float h, float w, int horizCount, int vertCount) {
    x = xpos;
    y = height - h;
    myHeight = h;
    myWidth = w;//

    vertCount = horizCount * 2;

    if ( horizCount % 2 == 0) {
       horizCount++; 
    }
    if ( vertCount % 2 == 0) {
       vertCount++; 
    }

    windows = new Windows(x, y, myWidth, myHeight, horizCount, vertCount);
  }

  void display() {
    fill(255);
    stroke(0);

    fill(random(100, 200));
    quad(x, y,
        x+myWidth, y,
        x+myWidth, y+myHeight,
        x, y+myHeight);

    windows.display();

  }
}

class Windows {
  float x, y;
  float windowWidth, windowHeight;
  float myWidth, myHeight;
  int countW; 
  int countH; 

  Windows(float xpos, float ypos, float w, float h, int cW, int cH) {
    x = xpos;
    y = ypos;

    myHeight = h;
    myWidth = w;
    countW = cW;
    countH = cH;


    windowWidth = myWidth/(countW);
    windowHeight = myHeight/(countH);
  }


  void display() {
    stroke(0);
    fill(255, 255, 0);

    for(float windowX = x + windowWidth; windowX < x+myWidth-windowWidth; windowX += windowWidth*2 ) {
      for(float windowY = y + windowHeight; windowY < y+myHeight-windowHeight ; windowY += windowHeight*2 ) {
		quad(windowX, windowY,
  		  windowX + windowWidth, windowY,
                 windowX + windowWidth, windowY + windowHeight,
	         windowX, windowY + windowHeight);
      }
    }

  }  
} // Windows


