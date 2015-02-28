
void setup() {
                  size(900,300);
                  background(5);
                  stroke(255, 255, 0, 1);
                  strokeWeight(10);
                  frameRate(20);
                  smooth();
                }
                float len = 1;
                float lastX,lastY;
                float startX = random(width);
                float startY = random(height);
                int t = 0;
                float ang = random(360);

                void draw() {
                  t = 0;
                  float blue = startX/5+round(random(startX/width)*75);
                  float red =200-(startX/width)*80-round(random(startX/width)*100);
                  float green = random(200);
                  int kosa = 100;
                  while (t <= 30) {
                    if (startX < -50 || startX>width || startY < -50 || startY>height) {
                      kosa=0;
                    }
                    if (startX >=-50 && startX<=width && startY >=-50 && startY<=height) {
                      ang+=random(-1,1)*5;
                      stroke(red, green, blue, kosa);
                      lastX = startX + cos(radians(ang))*len*(width/height);
                      lastY = startY + sin(radians(ang))*len;
                      line(startX, startY,lastX*2 ,lastY*2) ; 
                      startX = lastX;
                      startY = lastY;
                    }
                    else if (startX <-50) {
                      startX = width - random(len);
                    }
                    else if (startX > width) {
                      startX = -50 + random(len);
                    }
                    else if (startY <-50) { 
                      startY = height - random(len);
                    }
                    else if (startY >height) {
                      startY = -50 + random(len);
                    }
                    t++;
                  }
                  float t2 = 0;
                  float x = 0;
                  float y = 0;
                  while (t2<=width*height/300) {
                    fill(0, 30);
                    stroke(255, 0);
                    rect(floor(random(90*2))*6-90, floor(random(30*2))*6-30, 20, 20);
                    t2++;
                  }
                }
