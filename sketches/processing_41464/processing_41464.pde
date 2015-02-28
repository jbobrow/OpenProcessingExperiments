
// Processing VideoGrid by Scott Shirbin and Jesusa Mercado
// Based on the work by Ross Philips

import hypermedia.video.*;
OpenCV opencv;


float x= random(-100,100);
int endtime = 3000; //end time of the production
int looptime = 25;
int grid = 3; // grid dimensions
int numFrames = looptime; // number of frames per loop
boolean randomGrid = true; // consecutive or random grid


PGraphics[] frames = new PGraphics[numFrames];
ArrayList randomNumbers = new ArrayList();
int t;

void setup() {
size(900,900);
opencv = new OpenCV(this);
opencv.capture(width/grid,height/grid);
for (int i=0; i<frames.length; i++) {
frames[i] = createGraphics(width,height,P2D);
}
fillRandomNumbers();
}

void draw() {

int currentFrame = frameCount % frames.length;
opencv.read();


//glitches and filters
println (frameCount);

if (frameCount > 221) {
opencv.threshold(random(0,59));
}

if (frameCount >329) {
opencv.contrast(30);
}

if (frameCount >373) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount >442) {
opencv.invert();
}

if (frameCount >497) {
opencv.brightness(25);
}

if (frameCount >= 559) {
opencv.threshold(random(0,0));
}

if (frameCount >673) {
opencv.brightness(-25);
}

if (frameCount > 620) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount >701) {
opencv.restore();
}

if (frameCount > 721) {
opencv.convert(OpenCV.GRAY);
}

if (frameCount > 757) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 764) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 771) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 780) {
opencv.brightness(-40);
}

if (frameCount > 813) {
opencv.contrast(-20);
}

if (frameCount > 823) {
opencv.contrast(40);
}

if (frameCount > 890) {
opencv.threshold(random(-50,50));
}

if (frameCount > 926) {
opencv.restore();
}

if (frameCount > 930) {
opencv.convert(OpenCV.GRAY);
}

if (frameCount > 938) {
opencv.restore();
}

if (frameCount > 946) {
opencv.convert(OpenCV.GRAY);
}

if (frameCount > 956) {
opencv.invert();
}

if (frameCount > 979) {
opencv.threshold(random(20,70));
}

if (frameCount > 1000) {
opencv.brightness(40);
}

if (frameCount > 1020) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 1067) {
opencv.convert(RGB);
}

if (frameCount > 1100) {
opencv.restore();
}

if (frameCount > 1121) {
opencv.absDiff();
}

if (frameCount > 1126) {
opencv.contrast(20);
}

if (frameCount == 1176) {
opencv.restore();
}

if (frameCount >= 1189) {
opencv.threshold(random(-20, 20));
}

if (frameCount > 1201) {
opencv.contrast(-10);
}

if (frameCount > 1222) {
opencv.brightness(40);
}

if (frameCount > 1279) {
opencv.restore();
}

if (frameCount > 1521) {
opencv.threshold(random(-60,20));
}

if (frameCount > 1578) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 1582) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 1592) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 1599) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 1601) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 1612) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 1518) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 1524) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 1530) {
opencv.restore();
}

if (frameCount > 1531) {
opencv.convert(GRAY);
}

if (frameCount > 1535) {
opencv.restore();
}

if (frameCount > 1537) {
opencv.convert(GRAY);
}

if (frameCount > 1541) {
opencv.restore();
}

if (frameCount > 1545) {
opencv.convert(GRAY);
}

if (frameCount > 1549) {
opencv.restore();
}

if (frameCount > 1551) {
opencv.convert(GRAY);
}

if (frameCount >1601) {
opencv.invert();
}

if (frameCount > 1618) {
opencv.contrast(16);
}

if(frameCount > 1676) {
opencv.invert();
}

if(frameCount > 1679) {
opencv.invert();
}

if(frameCount > 1681) {
opencv.invert();
}

if(frameCount > 1687) {
opencv.invert();
}

if(frameCount > 1692) {
opencv.invert();
}

if(frameCount > 1701) {
opencv.threshold(random(-20, 80));
}

if (frameCount >1740) {
opencv.brightness(25);
}

if (frameCount > 1799) {
opencv.threshold(random(0,59));
}

if (frameCount >1820) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount >1824) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount >1842) {
opencv.invert();
}

if (frameCount >1929) {
opencv.contrast(30);
}

if (frameCount > 2001) {
opencv.restore();
}

if (frameCount > 2178) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 2182) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2192) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 2199) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2101) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 2112) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2115) {
opencv.convert(GRAY);
}

if (frameCount > 2118) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 2124) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2178) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 2182) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2192) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 2195) {
opencv.invert();
}

if (frameCount > 2199) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2201) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 2212) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2218) {
opencv.flip(OpenCV.FLIP_BOTH);
}

if (frameCount > 2219) {
opencv.threshold(random(-90,90));
}

if (frameCount > 2224) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2270) {
opencv.contrast(10);
}

if (frameCount >2280) {
opencv.restore();
}


if (frameCount >2301) {
opencv.invert();
}

if (frameCount >2351) {
opencv.contrast(30);
}

if (frameCount >2373) {
opencv.brightness(-25);
}

if (frameCount >= 2381) {
opencv.threshold(random(0,0));
}

if (frameCount > 2401) {
opencv.flip(OpenCV.FLIP_VERTICAL);
}

if (frameCount > 2415) {
opencv.flip(OpenCV.FLIP_HORIZONTAL);
}

if (frameCount > 2423) {
opencv.flip(OpenCV.FLIP_BOTH);
}




//recording loop
if (frameCount % numFrames == 0) {
if (randomGrid) { t = getRandomGrid(); }
else { t++; }
}
int x = t%grid;
int y = (t/grid)%grid;
frames[currentFrame].beginDraw();
frames[currentFrame].image(opencv.image(),x*width/grid,y*height/grid);
frames[currentFrame].endDraw();
image(frames[currentFrame],0,0);


}


//playing back loop
int getRandomGrid() {
if (randomNumbers.size() == 0) { fillRandomNumbers(); }
int selected = int(random(randomNumbers.size()));
int randomNumber = (Integer) randomNumbers.get(selected);
randomNumbers.remove(selected);
return randomNumber;
}

void fillRandomNumbers() {
for (int i=0; i<grid*grid; i++) {
randomNumbers.add(i);
}
}

public void stop() {
opencv.stop();
super.stop();
}



