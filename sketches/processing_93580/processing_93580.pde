
PImage img;

void setup() 
{
   size(900,900);
 
   img =loadImage("chicken.jpg");
   img.loadPixels();
   //img.resize(400,400);
}
void draw()
{
//1
filter(INVERT);
image(img,0,0,300,300);
filter(BLUR,4);
filter(POSTERIZE,4);


//2
filter(INVERT);
image(img,300,0,300,300);
filter(DILATE);

filter(POSTERIZE,200);

//3
filter(INVERT);
filter(DILATE);
filter(POSTERIZE,200);
image(img,600,0,300,300);
///filter(BLUR,5);


//4
filter(INVERT);
image(img,0,300,300,300);
filter(ERODE);

//5
filter(INVERT);
image(img,300,300,300,300);
filter(POSTERIZE,10);
//6
filter(INVERT);
image(img,600,300,300,300);

//7
filter(INVERT);
image(img,0,600,300,300);


//8
filter(INVERT);
image(img,300,600,300,300);
//filter(THRESHOLD);
//9
filter(INVERT);
image(img,600,600,300,300);
//filter(GRAY);


}

