
int numFrames = 10;
int numFrames2 = 62;

int frame = 0;
int frame2 = 0;

//boolean tests
int frame1test = 1;    //1 starts initial animation in draw
int frame2test = 0;    //1 starts girl eating boy animation
int frame3test = 0;    //1 starts redrawing boy & girl animation
int frame4test = 0;    //1 starts last frame of boy & girl

PImage[] images = new PImage [numFrames];
PImage[] images2 = new PImage [numFrames2];
PImage bg;

void setup(){
  size(1280,720);
  frameRate(10);
  bg = loadImage("backgroundzh.jpg");

  images[0] = loadImage("yd01.png");
  images[1] = loadImage("yd02.png");
  images[2] = loadImage("yd03.png");
  images[3] = loadImage("yd04.png");
  images[4] = loadImage("yd05.png");
  images[5] = loadImage("yd06.png");
  images[6] = loadImage("yd07.png");
  images[7] = loadImage("yd08.png");
  images[8] = loadImage("yd09.png");
  images[9] = loadImage("yd10.png");
  
  images2[0] = loadImage("bx01.png");
  images2[1] = loadImage("bx02.png");
  images2[2] = loadImage("bx03.png");
  images2[3] = loadImage("bx04.png");
  images2[4] = loadImage("bx05.png");
  images2[5] = loadImage("bx06.png");
  images2[6] = loadImage("bx07.png");
  images2[7] = loadImage("bx08.png");
  images2[8] = loadImage("bx09.png");
  images2[9] = loadImage("bx10.png");
  images2[10] = loadImage("bx11.png");
  images2[11] = loadImage("bx12.png");
  images2[12] = loadImage("bx13.png");
  images2[13] = loadImage("bx14.png");
  images2[14] = loadImage("bx15.png");
  images2[15] = loadImage("bx16.png");
  images2[16] = loadImage("bx17.png");
  images2[17] = loadImage("bx18.png");
  images2[18] = loadImage("bx19.png");
  images2[19] = loadImage("bx20.png");
  images2[20] = loadImage("bx21.png");
  images2[21] = loadImage("bx22.png");
  images2[22] = loadImage("bx23.png");
  images2[23] = loadImage("bx24.png");
  images2[24] = loadImage("bx25.png");
  images2[25] = loadImage("bx26.png");
  images2[26] = loadImage("bx27.png");
  images2[27] = loadImage("bx28.png");
  images2[28] = loadImage("bx29.png");
  images2[29] = loadImage("bx30.png");
  images2[30] = loadImage("bx31.png");
  images2[31] = loadImage("bx32.png");
  images2[32] = loadImage("bx33.png");
  images2[33] = loadImage("bx34.png");
  images2[34] = loadImage("bx35.png");
  images2[35] = loadImage("bx36.png");
  images2[36] = loadImage("bx37.png");
  images2[37] = loadImage("bx38.png");
  images2[38] = loadImage("bx39.png");
  images2[39] = loadImage("bx40.png");
  images2[40] = loadImage("bx41.png");
  images2[41] = loadImage("bx42.png");
  images2[42] = loadImage("bx43.png");
  images2[43] = loadImage("bx44.png");
  images2[44] = loadImage("bx45.png");
  images2[45] = loadImage("bx46.png");
  images2[46] = loadImage("bx47.png");
  images2[47] = loadImage("bx48.png");
  images2[48] = loadImage("bx49.png");
  images2[49] = loadImage("bx50.png");
  images2[50] = loadImage("bx51.png");
  images2[51] = loadImage("bx52.png");
  images2[52] = loadImage("bx53.png");
  images2[53] = loadImage("bx54.png");
  images2[54] = loadImage("bx55.png");
  images2[55] = loadImage("bx56.png");
  images2[56] = loadImage("bx57.png");
  images2[57] = loadImage("bx58.png");
  images2[58] = loadImage("bx59.png");
  images2[59] = loadImage("bx60.png");
  images2[60] = loadImage("bx61.png");
  images2[61] = loadImage("bx62.png");

}

void draw(){
  image(bg,0,0,1280,720);
  
  //Begin initial animation on load
  if (frame1test == 1){
     frame = frame + 1;
     image(images[frame], 340, 0);
     
     if (frame == 8) {
         frame = 0; 
         frame1test = 0; //stops initial animation
         frame4test = 1; //shows last frame of animation (see last if statement)
     }
   } 
  
  //When mouse is clicked, frame2test will = 1 and will begin next animation
  //this starts girl eating boy animation
  if (frame2test == 1){
     frame2 = frame2 + 1;
     image(images2[frame2], 340, 0);
     
     if (frame2 == 61) { 
         frame2 = 0; 
         frame2test = 0; //stops girl eating boy animation
         frame3test = 1; //this starts the yd01 animation in next if statement
     }
   }
        
   //begin yd01 animation
   if (frame3test == 1){
       frame = frame + 1;
       image(images[frame], 340, 0);
       
       if (frame == 8) {
           frame = 0; 
           frame3test = 0; //stops yd01 animation
           frame4test = 1; //initializes last frame
       }
   }        
     
   //will show last frame of boy & girl happy together
   //when mouse is clicked, this will not show bcause frame4test = 0
   if (frame4test == 1){
       image(images[9], 340, 0);
   }
   
}

  
void mousePressed(){
   frame2test = 1;  //will begin girl eating boy animation
   frame4test = 0; 
}

