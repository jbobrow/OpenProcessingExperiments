
/*@pjs preload= "bus0000.gif,bus0001.gif,bus0002.gif,bus0003.gif,bus0004.gif,bus0005.gif,bus0006.gif,bus0007.gif,bus0008.gif,bus0009.gif,bus0010.gif,bus0011.gif,bus0012.gif,bus0013.gif,bus0014.gif,bus0015.gif,bus0016.gif,bus0017.gif,bus0018.gif,bus0019.gif,bus0020.gif,bus0021.gif,bus0022.gif,bus0023.gif,bus0024.gif,bus0025.gif,bus0026.gif,bus0027.gif";*/ 

int frameNum = 28;
int frame = 0;
int lastFrame = 0;
PImage [] bus= new PImage[frameNum];

public void setup() {
  size(1500, 900);
  frameRate(20);
  bus[0] = loadImage("bus0000.gif");
  bus[1] = loadImage("bus0001.gif"); 
  bus[2] = loadImage("bus0002.gif");
  bus[3] = loadImage("bus0003.gif"); 
  bus[4] = loadImage("bus0004.gif");
  bus[5] = loadImage("bus0005.gif"); 
  bus[6] = loadImage("bus0006.gif");
  bus[7] = loadImage("bus0007.gif"); 
  bus[8] = loadImage("bus0008.gif");
  bus[9] = loadImage("bus0009.gif"); 
  bus[10] = loadImage("bus0010.gif");
  bus[11] = loadImage("bus0011.gif"); 
  bus[12] = loadImage("bus0012.gif");
  bus[13] = loadImage("bus0013.gif"); 
  bus[14] = loadImage("bus0014.gif");
  bus[15] = loadImage("bus0015.gif"); 
  bus[16] = loadImage("bus0016.gif");
  bus[17] = loadImage("bus0017.gif"); 
  bus[18] = loadImage("bus0018.gif");
  bus[19] = loadImage("bus0019.gif"); 
  bus[20] = loadImage("bus0020.gif");
  bus[21] = loadImage("bus0021.gif"); 
  bus[22] = loadImage("bus0022.gif");
  bus[23] = loadImage("bus0023.gif"); 
  bus[24] = loadImage("bus0024.gif");
  bus[25] = loadImage("bus0025.gif"); 
  bus[26] = loadImage("bus0026.gif");
  bus[27] = loadImage("bus0027.gif"); 

/*
  for (int i = 0; i < frameNum; i++) {
    String imageName = "bus" + nf(i, 4) + ".gif";
    bus[i] = loadImage(imageName);
  }
*/  
  
  /*
  // create the PImage array for the interactive display
  animation = Gif.getPImages(this, "lavalamp.gif");
  */
}

void draw() {
  background(255 / (float)height * mouseY);
  frame = (frame+1) % frameNum;
  
  for (int x = -100; x < width; x += bus[0].width) {

    image(bus[(int) (bus.length / (float) (width) * mouseX)], 0, 0);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width, 0);    
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width*2, 0);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width*3, 0);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], 0, bus[0].height);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width, bus[0].height);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width*2, bus[0].height);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width*3, bus[0].height);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], 0, bus[0].height*2);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width, bus[0].height*2);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width*2, bus[0].height*2);
    image(bus[(int) (bus.length / (float) (width) * mouseX)], bus[0].width*3, bus[0].height*2);
}

}


