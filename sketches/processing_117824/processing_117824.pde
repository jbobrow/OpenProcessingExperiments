
int numFrames = 53;  // The number of frames in the animation, there are total 53 frames
int frame = 0;
PImage[] images = new PImage[numFrames];
     
void setup() {
  size(600,397); //indicate the screen size of the stop motion
  frameRate(4); //set the speed of the stop motion
  
 //stop motion
  images[0]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3699_zps7f6adde6.jpg");
  images[1]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3701_zpsa4c90453.jpg");
  images[2]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3702_zps9e463c8d.jpg");
  images[3]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3703_zps459a86c9.jpg");
  images[4]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3708_zps264e781b.jpg");
  images[5]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3709_zps62a603cb.jpg");
  images[6]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3710_zpsc9939625.jpg");
  images[7]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3711_zpsd6593b31.jpg");
  images[8]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3715_zpsc4308619.jpg");
  images[9]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3717_zps002ff2b7.jpg");
  images[10] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3718_zps37dec7f7.jpg");
  images[11] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3719_zpseb2867b2.jpg");
  images[12] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3720_zpsf817b235.jpg");
  images[13] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3721_zpse2add3b9.jpg");
  images[14] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3722_zps2bb53ef5.jpg");
  images[15] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3723_zpsdcf9a965.jpg");
  images[16] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3724_zpsbee9322b.jpg");
  images[17] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3726_zpsaaa270de.jpg");
  images[18] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3729_zps46fa4ec9.jpg");
  images[19] = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3727_zps34b52cee.jpg");
  images[20]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3730_zps0e3fe622.jpg");
  images[21]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3731_zps35e184de.jpg");
  images[22]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3732_zps73b363ef.jpg");
  images[23]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3733_zps7cb0a34a.jpg");
  images[24]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3735_zps8300d6dd.jpg");
  images[25]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3736_zpsb81191cb.jpg");
  images[26]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3737_zps7692197d.jpg");
  images[27]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3738_zpsa0afaef4.jpg");
  images[28]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3740_zps5b0cc4d5.jpg");
  images[29]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3741_zps6c50739a.jpg");
  images[30]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3742_zpsaeb53ebf.jpg");
  images[31]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3743_zps06487516.jpg");
  images[32]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3744_zps7b1efe7c.jpg");
  images[33]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3745_zps92ec43b2.jpg");
  images[34]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3746_zps124111cf.jpg");
  images[35]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3747_zpse067fff1.jpg");
  images[36]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3748_zps92f677da.jpg");
  images[37]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3749_zps77185f10.jpg");
  images[38]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3750_zps2954de03.jpg");
  images[39]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3751_zps4e79aba1.jpg");
  images[40]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3753_zps8f5cbd69.jpg");
  images[41]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3756_zpsf93a0bd2.jpg");
  images[42]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3759_zps95eb85ec.jpg");
  images[43]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3761_zps91b548e3.jpg");
  images[44]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3762_zps32436fb7.jpg");
  images[45]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3763_zpsee09d871.jpg");
  images[46]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3764_zps401b1fc4.jpg");
  images[47]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3765_zpsdb794ada.jpg");
  images[48]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3766_zpsd7d0c0ca.jpg");
  images[49]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3767_zps513d657a.jpg");
  images[50]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3771_zps431af9e7.jpg");
  images[51]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3769_zps0ff41aba.jpg");
  images[52]  = loadImage("http://i79.photobucket.com/albums/j151/candy31828/DSC_3770_zps038c0f53.jpg");
 
}
  
void draw() {
  background(0);
  frame = (frame+1) % numFrames;  // Use % to cycle through frames
 frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame % numFrames], 0, 0);
}
