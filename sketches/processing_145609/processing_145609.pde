
int frameX = 50;
int frameY = 30;
float[][][] point;
float rd = 0;

void setup() {
  size(800, 400); 
  background(255); 
  point = new float[frameX][frameY][3];
  for (int i = 0; i <= frameX-1; i ++) {
    for (int j = 0; j <= frameY-1; j ++) {      
      point[i][j][0] = width/2 + (i - frameX/2)*10;   
      point[i][j][1] = height/2 + (j - frameY/2)*10;
      point[i][j][2] = 0;
    }
  }
}

void draw() {

  background(255);
  stroke(0, 0, 0);
  strokeWeight(5);
  rd = sqrt(sq(width/2 - mouseX) + sq(height/2 - mouseY));
  point(width/2 + 100*(width/2 - mouseX)*pow(rd, -2), height/2 + 100*(height/2 - mouseY)*pow(rd, -2));

  for (int i = 0; i <= frameX-1; i ++) {
    for (int j = 0; j <= frameY-1; j ++) {  
      point[i][j][2] = sqrt(sq(point[i][j][0] - mouseX) + sq(point[i][j][1] - mouseY));    
      //point(point[i][j][0], point[i][j][1]);
      point(point[i][j][0] + 200*(point[i][j][0] - mouseX)*pow(point[i][j][2], -2), point[i][j][1] + 200*(point[i][j][1] - mouseY)*pow(point[i][j][2], -2));
    }
  }
}



