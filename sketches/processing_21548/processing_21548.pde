
int counter = 0;
PImage[] images = new PImage[37]; // an array holding 36 images in the animation

void setup () {
  size (575,575);
  background(200);
  images [0] = loadImage ("flower1.jpg");
  images [1] = loadImage ("flower2.jpg");
  images [2] = loadImage ("flower3.jpg");
  images [3] = loadImage ("flower4.jpg");
  images [4] = loadImage ("flower5.jpg");
  images [5] = loadImage ("flower6.jpg");
  images [6] = loadImage ("flower7.jpg");
  images [7] = loadImage ("flower8.jpg");
  images [8] = loadImage ("flower9.jpg");
  images [9] = loadImage ("flower10.jpg");
  images [10] = loadImage ("flower11.jpg");
  images [11] = loadImage ("flower12.jpg");
  images [12] = loadImage ("flower13.jpg");
  images [13] = loadImage ("flower14.jpg");
  images [14] = loadImage ("flower15.jpg");
  images [15] = loadImage ("flower16.jpg");
  images [16] = loadImage ("flower17.jpg");
  images [17] = loadImage ("flower18.jpg");
  images [18] = loadImage ("flower19.jpg");
  images [19] = loadImage ("flower20.jpg");
  images [20] = loadImage ("flower21.jpg");
  images [21] = loadImage ("flower22.jpg");
  images [22] = loadImage ("flower23.jpg");
  images [23] = loadImage ("flower24.jpg");
  images [24] = loadImage ("flower25.jpg");
  images [25] = loadImage ("flower26.jpg");
  images [26] = loadImage ("flower27.jpg");
  images [27] = loadImage ("flower28.jpg");
  images [28] = loadImage ("flower29.jpg");
  images [29] = loadImage ("flower30.jpg");
  images [30] = loadImage ("flower31.jpg");
  images [31] = loadImage ("flower32.jpg");
  images [32] = loadImage ("flower33.jpg");
  images [33] = loadImage ("flower34.jpg");
  images [34] = loadImage ("flower35.jpg");
  images [35] = loadImage ("flower36.jpg");
  images [36] = loadImage ("flower37.jpg");
 
 
}

void draw() {
   background (200);
   
   
   
   image(images[counter],0,0);
   
   
  
}

void mousePressed() {
  counter ++;
  
  if (counter == 36) {
    counter = 0; 
   }
}

