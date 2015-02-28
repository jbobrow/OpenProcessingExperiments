
//Alphabet Smog
//Math, Programming, and Art fall 2011
//Greg Johnson
//Midterm assignment

//Creates randomly called letterforms, which overlay to get a cloud-like effect. Click to restart.
//I think it's laggy becasue of all the images it loads


//Image array code sampled from: http://processing.org/discourse/yabb2/YaBB.pl?num=1274221858
PImage[] myImageArray = new PImage[27];
float x,y;

void setup (){
  
 // colorMode(HSB, 360, 100,100);
  background(#ffffff);
  size(800,800);
  smooth();
  

}
void draw(){
  imageMode(CENTER);
//List of images that may be called. A-Z and &.
  for (int i=0; i<myImageArray.length; i++){
            myImageArray [0] = loadImage( "0.png");
            myImageArray [1] = loadImage( "1.png");
            myImageArray [2] = loadImage( "2.png");
            myImageArray [3] = loadImage( "3.png");
            myImageArray [4] = loadImage( "4.png");
            myImageArray [5] = loadImage( "5.png");
            myImageArray [6] = loadImage( "6.png");
            myImageArray [7] = loadImage( "7.png");
            myImageArray [8] = loadImage( "8.png");
            myImageArray [9] = loadImage( "9.png");
            myImageArray [10] = loadImage( "10.png");
            myImageArray [11] = loadImage( "11.png");
            myImageArray [12] = loadImage( "12.png");
            myImageArray [13] = loadImage( "13.png");
            myImageArray [14] = loadImage( "14.png");
            myImageArray [15] = loadImage( "15.png");
            myImageArray [16] = loadImage( "16.png");
            myImageArray [17] = loadImage( "17.png");
            myImageArray [18] = loadImage( "18.png");
            myImageArray [19] = loadImage( "19.png");
            myImageArray [20] = loadImage( "20.png");
            myImageArray [21] = loadImage( "21.png");
            myImageArray [22] = loadImage( "22.png");
            myImageArray [23] = loadImage( "23.png");
            myImageArray [24] = loadImage( "24.png");
            myImageArray [25] = loadImage( "25.png");
            myImageArray [26] = loadImage( "26.png");
             //noLoop();
  //Translate to center of the 800X800
  translate(400,400);
 //For loop to get grip pattern
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y+=1){
     //Variable that dictate the rotation of the called letters
      if (x%40==0 && y%40==0){
      rotate(radians(random (tan(121*1000/9))));
      tint(0,50);
      image(myImageArray[(int)random(27)],x,y,20,20);
}

  if (frameCount%40==0){
    rotate(radians(20));
       
        }
      } 
    }
  }
}
 //Overlays with white to re-start buildup
  void mousePressed(){
    background(#ffffff,100);
  }


