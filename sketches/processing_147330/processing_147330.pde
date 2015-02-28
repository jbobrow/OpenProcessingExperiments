
int numFrames = 82;
int frame = 0;
PImage[] images = new PImage[numFrames];
 
void setup(){
  size(640, 480);
  frameRate(24);
   
  images[0]  = loadImage("castle.0001.jpg");
  images[1]  = loadImage("castle.0002.jpg");
  images[2]  = loadImage("castle.0003.jpg");
  images[3]  = loadImage("castle.0004.jpg");
  images[4]  = loadImage("castle.0005.jpg");
  images[5]  = loadImage("castle.0006.jpg");
  images[6]  = loadImage("castle.0007.jpg");
  images[7]  = loadImage("castle.0008.jpg");
  images[8]  = loadImage("castle.0009.jpg");
  images[9] = loadImage ("castle.0010.jpg");
  images [10] = loadImage ("castle.0011.jpg");
  images [11] = loadImage ("castle.0012.jpg");
  images [12] = loadImage ("castle.0013.jpg");
  images [13] = loadImage ("castle.0014.jpg");
  images [14] = loadImage ("castle.0015.jpg");
  images [15] = loadImage ("castle.0016.jpg");
  images [16] = loadImage ("castle.0017.jpg");
  images [17] = loadImage ("castle.0018.jpg");
  images [18] = loadImage ("castle.0019.jpg"); 
  images [19] = loadImage ("castle.0020.jpg"); 
  images [20] = loadImage ("castle.0019.jpg"); 
  images [21] = loadImage ("castle.0020.jpg"); 
  images [22] = loadImage ("castle.0021.jpg"); 
  images [23] = loadImage ("castle.0022.jpg"); 
  images [24] = loadImage ("castle.0023.jpg"); 
  images [25] = loadImage ("castle.0024.jpg"); 
  images [26] = loadImage ("castle.0025.jpg"); 
  images [27] = loadImage ("castle.0026.jpg"); 
  images [28] = loadImage ("castle.0027.jpg"); 
  images [29] = loadImage ("castle.0028.jpg"); 
  images [30] = loadImage ("castle.0029.jpg"); 
  images [31] = loadImage ("castle.0030.jpg"); 
  images [32] = loadImage ("castle.0031.jpg");
 images [33] = loadImage ("castle.0032.jpg"); 
images [34] = loadImage ("castle.0033.jpg"); 
images [35] = loadImage ("castle.0034.jpg"); 
images [36] = loadImage ("castle.0035.jpg"); 
images [37] = loadImage ("castle.0036.jpg"); 
images [38] = loadImage ("castle.0037.jpg"); 
images [39] = loadImage ("castle.0038.jpg"); 
images [40] = loadImage ("castle.0039.jpg"); 
images [41] = loadImage ("castle.0040.jpg"); 
images [42] = loadImage ("castle.0041.jpg"); 
images [43] = loadImage ("castle.0042.jpg"); 
images [44] = loadImage ("castle.0043.jpg"); 
images [45] = loadImage ("castle.0044.jpg"); 
images [46] = loadImage ("castle.0045.jpg"); 
images [47] = loadImage ("castle.0046.jpg"); 
images [48] = loadImage ("castle.0047.jpg"); 
images [49] = loadImage ("castle.0048.jpg"); 
images [50] = loadImage ("castle.0049.jpg"); 
images [51] = loadImage ("castle.0050.jpg"); 
images [52] = loadImage ("castle.0051.jpg"); 
images [53] = loadImage ("castle.0052.jpg"); 
images [54] = loadImage ("castle.0053.jpg"); 
images [55] = loadImage ("castle.0054.jpg"); 
images [56] = loadImage ("castle.0055.jpg"); 
images [57] = loadImage ("castle.0056.jpg"); 
images [58] = loadImage ("castle.0057.jpg"); 
images [59] = loadImage ("castle.0058.jpg"); 
images [60] = loadImage ("castle.0059.jpg"); 
images [61] = loadImage ("castle.0060.jpg"); 
images [62] = loadImage ("castle.0061.jpg"); 
images [63] = loadImage ("castle.0062.jpg"); 
images [64] = loadImage ("castle.0063.jpg"); 
images [65] = loadImage ("castle.0064.jpg"); 
images [66] = loadImage ("castle.0065.jpg"); 
images [67] = loadImage ("castle.0066.jpg"); 
images [68] = loadImage ("castle.0067.jpg"); 
images [69] = loadImage ("castle.0068.jpg"); 
images [70] = loadImage ("castle.0069.jpg"); 
images [71] = loadImage ("castle.0070.jpg");
}
 
void draw(){
  background(0);
  frame = (frame+1) % numFrames;
  if (frame>numFrames){
    frame=0;
  }
  image(images[frame],0,0);
}


