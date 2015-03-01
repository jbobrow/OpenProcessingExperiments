
// Based on the KhanAcademy Processing Course, modified to run here with P5

int lX = 150;
int rX = 220;
int sunRad = 100;
int growShrink = 1;

void setup() {
size(600, 400);
noStroke();
}

void draw() {
    background(184, 236, 220);
    
  
   
    sunRad = sunRad+1*growShrink;
    fill(255, 170, 0);
    ellipse(200, 100, sunRad, sunRad);
    
    // clouds are white
    fill(255, 255, 255);
    // cloud moves left
    lX = lX - 1 * growShrink;
    ellipse(lX, 150, 126, 97);
    ellipse(lX+62, 150, 70, 60);
    ellipse(lX-62, 150, 70, 60);
    
    // cloud moves right
    rX = rX + 1 * growShrink;
    ellipse(rX, 100, 126, 97);
    ellipse(rX+62, 100, 70, 60);
    ellipse(rX-62, 100, 70, 60);
    
    // daytime
    if (sunRad == 299) growShrink = -1;
    if (sunRad == 100) growShrink = 1; 
    
};
