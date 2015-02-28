
//Impressionist Canvas Analysis

//this gridded drawing machine pulls color from random pixels within "Impressionist Sunrise" by Cluade Monet
//the canvas 


PImage monet;                                                //create space in memory for the image insert through PImage coding

void setup() {
  monet = loadImage ("Impressionist Sunrise.png");           //place the image found in the sketch folder into the space found in memory
  size(1000,600);                                            //match the size of the canvas to that of the painting
  colorMode(RGB,255);
}

int count = 0;                                               //this count and number combination will determine how many lines will be draw in the gridded line output formatted below
int num = 1;

void draw() {
  //loadPixels();                                              //loads the pixels of the canvas itself (not really necessary)
  monet.loadPixels();                                        //loads the pixels of the painting so that they may be accessed
  for(int i = 0; i < monet.width; i++) {                     //first for loop here is created to decode and access the one dimensional matrix of pixels
    for(int j = 0; j < monet.height; j++) {
      

      if(count < num) {                                      //creating a grid to draw in from. In this case, the size of each grid block is 5 pixels x 5 pixels
        for(int x = 0; x < width; x+=5) {
          for(int y = 0; y < width; y+=5) {
            
            int loc = i + j*width;                           //determine the location of any pixels based on this equation. Breaking down the matrix. Later a randomization is added to select a color from the Monet painting
            int locRand = loc + floor((random(0,width*height)));
            
            int a = x;                                       //integer represents where the lines will be drawn in the gridded pieces
            int b = y;
            int c = floor(random(0,100));                    //integer for length of lines drawn from within the grid (a larger random range will overlap more)
            
            float d = red(monet.pixels[locRand]);            //selects the red value from the RGB color of the pixel found at locRand (a randomly selected pixel within the image pixel matrix)
            float e = green(monet.pixels[locRand]);          //selects the green value from the RGB color of the pixel found at locRand (a randomly selected pixel within the image pixel matrix)
            float f = blue(monet.pixels[locRand]);           //selects the blue value from the RGB color of the pixel found at locRand (a randomly selected pixel within the image pixel matrix)
            
            stroke(d,e,f);                                   //draws lines with stroke values found from the RGB settings above
            line(a,b+c,a+c,b);                               //diagonal line set 1 (bottom left to top right)
            line(a,b,a+c,b+c);                               //diagonal line set 2 (top left to bottom right)
          }
        }
      }
      count++;
    }
  }
}


