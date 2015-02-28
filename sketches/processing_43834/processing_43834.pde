
//document setup

size(500,500);
smooth();

//load "this.jpg" 
//define it as "img"
PImage img = loadImage("this.jpg");

//load "img" pixel data
img.loadPixels();
//define color c as first 


int b1 = 0;
int b2 = 0;

for (int i =0; i<img.pixels.length ;i++){
  if(i > img.pixels.length/2){
    //bottom
    b2 += brightness(img.pixels[i]);
  } else {
    //top
    b1 += brightness(img.pixels[i]);
  }
}

//average value of brightness for top and bottom
int brightTop = int(b1)/img.pixels.length;
int brightBot = int(b2)/img.pixels.length;



float s1 = map(brightTop, 1, 255, 0, (width+height)/2);
float s2 = map(brightBot, 1, 255, 0, (width+height)/2);


image(img, 0, 0, width, height);
stroke(0);
line(0, height/2, width, height/2);

//setup ellipse
noStroke();
ellipseMode(CENTER);

//ellipse b1
fill(brightTop);
ellipse(width/2,height/3,s1,s1);

//ellipse b2
fill(brightBot);
ellipse(width/2,height*2/3,s2,s2);

//print value
println("b1 = " + int(b1)/img.pixels.length +" b2 = "+ int(b2)/img.pixels.length);
println("s1 = " + s1 + " s2 = " + s2);



