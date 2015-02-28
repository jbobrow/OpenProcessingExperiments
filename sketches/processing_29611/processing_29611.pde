
int numFrames = 78;
int frame=0;
PImage[] images = new PImage[numFrames];
PImage[] imagesb = new PImage[numFrames];
PImage start;
PImage paper1, paper2, paper3;
PImage paper;
//String f = "false";
//String t = "true";
//boolean b = boolean(f);


void setup() {

  size(1440, 700);
  frameRate(20);

  start = loadImage("artist_easel.jpg");
  image(start, 0, 0);

  images[0] = loadImage("1.jpg");
  images[1] = loadImage("2.jpg");
  images[2] = loadImage("3.jpg");
  images[3] = loadImage("4.jpg");
  images[4] = loadImage("5.jpg");
  images[5] = loadImage("6.jpg");
  images[6] = loadImage("7.jpg");
  images[7] = loadImage("8.jpg");
  images[8] = loadImage("9.jpg");
  images[9] = loadImage("10.jpg");
  images[10] = loadImage("11.jpg");
  images[11] = loadImage("12.jpg");
  images[12] = loadImage("13.jpg");
  images[13] = loadImage("14.jpg");
  images[14] = loadImage("15.jpg");
  images[15] = loadImage("16.jpg");
  images[16] = loadImage("17.jpg");
  images[17] = loadImage("18.jpg");
  images[18] = loadImage("19.jpg");
  images[19] = loadImage("20.jpg");
  images[20] = loadImage("21.jpg");
  images[21] = loadImage("22.jpg");
  images[22] = loadImage("23.jpg");
  images[23] = loadImage("24.jpg");
  images[24] = loadImage("25.jpg");
  images[25] = loadImage("26.jpg");
  images[26] = loadImage("27.jpg");
  images[27] = loadImage("28.jpg");
  images[28] = loadImage("29.jpg");
  images[29] = loadImage("30.jpg");
  images[30] = loadImage("31.jpg");
  images[31] = loadImage("32.jpg");
  images[32] = loadImage("33.jpg");
  images[33] = loadImage("34.jpg");
  images[34] = loadImage("35.jpg");
  images[35] = loadImage("36.jpg");
  images[36] = loadImage("37.jpg");
  images[37] = loadImage("38.jpg");
  images[38] = loadImage("39.jpg");
  images[39] = loadImage("40.jpg");
  images[40] = loadImage("41.jpg");
  images[41] = loadImage("42.jpg");
  images[42] = loadImage("43.jpg");
  images[43] = loadImage("44.jpg");
  images[44] = loadImage("45.jpg");
  images[45] = loadImage("46.jpg");
  images[46] = loadImage("47.jpg");
  images[47] = loadImage("48.jpg");
  images[48] = loadImage("49.jpg");
  images[49] = loadImage("50.jpg");
  images[50] = loadImage("51.jpg");
  images[51] = loadImage("52.jpg");
  images[52] = loadImage("53.jpg");
  images[53] = loadImage("54.jpg");
  images[54] = loadImage("55.jpg");
  images[55] = loadImage("56.jpg");
  images[56] = loadImage("57.jpg");
  images[57] = loadImage("58.jpg");
  images[58] = loadImage("59.jpg");
  images[59] = loadImage("60.jpg");
  images[60] = loadImage("61.jpg");
  images[61] = loadImage("68.jpg");
  images[62] = loadImage("70.jpg");
  images[63] = loadImage("72.jpg");
  images[64] = loadImage("74.jpg");
  images[65] = loadImage("76.jpg");
  images[66] = loadImage("78.jpg");
  images[67] = loadImage("80.jpg");
  images[68] = loadImage("83.jpg");
  images[69] = loadImage("85.jpg");
  images[70] = loadImage("87.jpg");
  images[71] = loadImage("90.jpg");
  images[72] = loadImage("91.jpg");
  images[73] = loadImage("92.jpg");
  images[74] = loadImage("93.jpg");
  images[75] = loadImage("94.jpg");
  images[76] = loadImage("95.jpg");
  images[77] = loadImage("96.jpg");

  imagesb[0] = loadImage("1b.jpg");
  imagesb[1] = loadImage("2b.jpg");
  imagesb[2] = loadImage("3b.jpg");
  imagesb[3] = loadImage("4b.jpg");
  imagesb[4] = loadImage("5b.jpg");
  imagesb[5] = loadImage("6b.JPG");
  imagesb[6] = loadImage("7b.jpg");
  imagesb[7] = loadImage("8b.jpg");
  imagesb[8] = loadImage("9b.jpg");
  imagesb[9] = loadImage("10b.jpg");
  imagesb[10] = loadImage("11b.jpg");
  imagesb[11] = loadImage("12b.jpg");
  imagesb[12] = loadImage("13b.jpg");
  imagesb[13] = loadImage("14b.jpg");
  imagesb[14] = loadImage("15b.jpg");
  imagesb[15] = loadImage("16b.jpg");
  imagesb[16] = loadImage("17b.jpg");
  imagesb[17] = loadImage("18b.jpg");
  imagesb[18] = loadImage("19b.jpg");
  imagesb[19] = loadImage("20b.jpg");
  imagesb[20] = loadImage("21b.jpg");
  imagesb[21] = loadImage("22b.jpg");
  imagesb[22] = loadImage("23b.jpg");
  imagesb[23] = loadImage("24b.jpg");
  imagesb[24] = loadImage("25b.jpg");
  imagesb[25] = loadImage("26b.jpg");
  imagesb[26] = loadImage("27b.jpg");
  imagesb[27] = loadImage("28b.jpg");
  imagesb[28] = loadImage("29b.jpg");
  imagesb[29] = loadImage("30b.jpg");
  imagesb[30] = loadImage("31b.jpg");
  imagesb[31] = loadImage("32b.jpg");
  imagesb[32] = loadImage("33b.jpg");
  imagesb[33] = loadImage("34b.jpg");
  imagesb[34] = loadImage("35b.jpg");
  imagesb[35] = loadImage("36b.jpg");
  imagesb[36] = loadImage("37b.jpg");
  imagesb[37] = loadImage("38b.jpg");
  imagesb[38] = loadImage("39b.jpg");
  imagesb[39] = loadImage("40b.jpg");
  imagesb[40] = loadImage("41b.jpg");
  imagesb[41] = loadImage("42b.jpg");
  imagesb[42] = loadImage("43b.jpg");
  imagesb[43] = loadImage("44b.jpg");
  imagesb[44] = loadImage("45b.jpg");
  imagesb[45] = loadImage("46b.jpg");
  imagesb[46] = loadImage("47b.jpg");
  imagesb[47] = loadImage("48b.jpg");
  imagesb[48] = loadImage("49b.jpg");
  imagesb[49] = loadImage("50b.jpg");
  imagesb[50] = loadImage("51b.jpg");
  imagesb[51] = loadImage("52b.jpg");
  imagesb[52] = loadImage("53b.jpg");
  imagesb[53] = loadImage("54b.jpg");
  imagesb[54] = loadImage("55b.jpg");
  imagesb[55] = loadImage("56b.jpg");
  imagesb[56] = loadImage("57b.jpg");
  imagesb[57] = loadImage("58b.jpg");
  imagesb[58] = loadImage("59b.jpg");
  imagesb[59] = loadImage("60b.jpg");
  imagesb[60] = loadImage("61b.jpg");
  imagesb[61] = loadImage("68b.jpg");
  imagesb[62] = loadImage("70b.jpg");
  imagesb[63] = loadImage("72b.jpg");
  imagesb[64] = loadImage("74b.jpg");
  imagesb[65] = loadImage("76b.jpg");
  imagesb[66] = loadImage("78b.jpg");
  imagesb[67] = loadImage("80b.jpg");
  imagesb[68] = loadImage("83b.jpg");
  imagesb[69] = loadImage("85b.jpg");
  imagesb[70] = loadImage("87b.jpg");
  imagesb[71] = loadImage("90b.jpg");
  imagesb[72] = loadImage("91b.jpg");
  imagesb[73] = loadImage("92b.jpg");
  imagesb[74] = loadImage("93b.jpg");
  imagesb[75] = loadImage("94b.jpg");
  imagesb[76] = loadImage("95b.jpg");
  imagesb[77] = loadImage("96b.jpg");




  paper1 = loadImage("paper1.jpg");
  paper2 = loadImage("paper2.jpg");
  paper3 = loadImage("paper3.jpg");
}

void draw() {

 
}
  
  void mouseClicked() {
  
  if (mouseButton == LEFT && pmouseX > 1080 && pmouseX<1150 && pmouseY< 300 && pmouseY>= 50) {
     frame = (frame+1) % numFrames;
    tint(255, 100);
    image(images[frame], 40, 30);
    delay(150);
            noStroke(); 
        fill(193, 113, 14, 20);
        ellipse(1110, 150, 175, 175);
        ellipse(1120, 160, 95, 95);
        ellipse(1110, 150, 350, 350);
        tint(255,80);
        image(start, 0, 0);
        tint(255, 20);
        image(paper1, 20, 15);
    //if (b==boolean(t)) {
      //tint(255, 100);
      //image(imagesb[frame], 40, 30);
      //delay(250);
    //}
  }

  if (mouseButton == RIGHT && pmouseX > 1080 && pmouseX<1150 && pmouseY< 300 && pmouseY>= 50) {
    
     frame = (frame+1) % numFrames;tint(255);
    image(start, 0, 0);
    tint(255, 80);
    image(imagesb[frame], 40, 30);
    delay(150);
    tint(255, 20);
    image(paper1, 20, 15);
    //if (b==boolean(f)) {
      //tint(255, 100);
      //image(imagesb[frame], 40, 30);
      //delay(250);
    //}
  }







//void mouseClicked() {

  if (mouseButton == LEFT) {
    if (pmouseX > 450 && pmouseX < 575 && pmouseY>=560) {
      //paper = paper1;
      image(paper1, 20, 15);
    }
    if (pmouseX > 575 && pmouseX<700 && pmouseY>=560) {
      //paper = paper2;
      image(paper2, 20, 15);
    }
    if (pmouseX > 700 && pmouseX<900 && pmouseY>=560) {
      //paper = paper3;
      image(paper3, 20, 15);
    }

   /* if (mouseButton == LEFT) {
      if (pmouseX > 1080 && pmouseX<1150 && pmouseY< 300 && pmouseY>= 50 && b==boolean(f)) {
        b= boolean(t);
        noStroke(); 
        fill(193, 113, 14, 40);
        ellipse(1110, 150, 175, 175);
        ellipse(1120, 160, 95, 95);
        ellipse(1110, 150, 350, 350);
      }
      if (mouseButton == RIGHT) {
        if (pmouseX > 1080 && pmouseX<1150 && pmouseY< 300 && pmouseY>= 50) {
          b= boolean(f);
          tint(255);
          image(start, 0, 0);
        }
      }*/
    }
  }



