
PImage img;
import com.ibm.icu.util.Calendar;
int ballX,ballY;

void setup() {
  size(700,700);
  smooth();
  img = loadImage("image2.png");
}

void draw() {
  fill(255,50);
  rect(0,0,width,height);
   float mouseXFactor = map(mouseX, 0,width, 0.05,1);
  float mouseYFactor = map(mouseY, 0,height, 0.05,1);
  for (int gridX = 0; gridX < img.width; gridX++) {
    for (int gridY = 0; gridY < img.height; gridY++) {
      // grid position + tile size
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;

      // get current color
      color c = img.pixels[gridY*img.width+gridX];
      // greyscale conversion
      int greyscale =round(red(c)*0.222+green(c)*0.707+blue(c)*0.071);
       ballX = 0;
        ballX = ballX+15;
        ballY = 0;
        ballY = ballY+5;
        float diameter = random(5,15);
        stroke(c);
        float w7 = map(greyscale, 0,255, 5,0.1);
        strokeWeight(w7);
        fill(c,255* mouseXFactor);
        pushMatrix();
        translate(posX, posY);
        rotate(greyscale/255.0 * PI/2* mouseYFactor);
        //rect(0,0,diameter,30);
        //triangle(0,0,20,0,10,20);
       // ellipse(ballX,ballY,diameter,diameter);
        line(ballX,0,0+diameter*5,0+diameter*5);
        popMatrix();
          
        
        
        //float diameter = random(5,70);
        // float w7 = map(greyscale, 0,255, 5,0.1);
        // stroke(c,10);
        // strokeWeight(w7);
        // fill(c,10);
        // //ellipse(posX,posY,diameter,diameter);
        // triangle(posX, posY, posX+random(50,70), posY, posX+random(20,40), posY+random(50,70));
        // //rect(posX,posY,diameter,diameter);
          }
        }
    }


