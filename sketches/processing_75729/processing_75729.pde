
/*
 Free Fall Update
 by Dongzhi Xia
 */
PFont f;
int currentTime;
float[][] circles;
int i = 0;
float newY;

void setup() {
  size(480, 480);
  //background(255,255,0);
  circles = new float[200][5];
}

void draw() {
  background(255, 255, 0);

  //Add texts
  f = createFont("Arial", 16, true);
  textFont(f, 16);
  fill(50);
  textAlign(LEFT);
  text("FREE FALL", 20, 30);
  textFont(f, 12);
  fill(100);
  text("by Dongzhi Xia", 20, 45);

  //Display created circles
  for (int x = 0; x < i; x ++) {
    currentTime = millis();
    
    newY = circles[x][1]+0.5*50*0.001*0.001*(currentTime-circles[x][2])*(currentTime-circles[x][2]);
    fill(circles[x][4]);
    ellipse(circles[x][0], newY, circles[x][3], circles[x][3]); 
    
    //add speed info
    textFont(f, 11);
    fill(100);
    textAlign(LEFT);
    float v = 9.8*0.001*(currentTime-circles[x][2]);
    text("Speed:"+v, (circles[x][0]-circles[x][3]/2), (newY-10-circles[x][3]/2));
  }
}

void mousePressed() {
  //Create new circle by mousePress
  //Add data to array 
  circles[i][0] = mouseX;
  circles[i][1] = mouseY;
  circles[i][2] = millis();
  circles[i][3] = random(10, 100);
  circles[i][4] = random(255);
  i = i + 1;
}



