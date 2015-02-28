
import processing.video.*;

Capture video;

int mx = 320;
int my = 240;

void setup() {
size(640,480);

// Step 3. Initialize Capture object via Constructor
// video is 320 x 240, @15 fps
video = new Capture(this,640,480,25);
}
void draw() {
// Check to see if a new frame is available
if (video.available()) {
// If so, read it.
video.read();
}
// Display the video image
image(video,0,0);
if (mouseX<mx &&mouseY<my){
filter(THRESHOLD,0.8);
}
if (mouseX>mx &&mouseY<my){
filter(GRAY);
}
if (mouseX<mx &&mouseY>my){
filter(INVERT);
}
if (mouseX>mx &&mouseY>my){
filter(POSTERIZE,2);
}
stroke(255,0,0);
line (mx,0,mx,480);
line (0,my,640,my);
}

