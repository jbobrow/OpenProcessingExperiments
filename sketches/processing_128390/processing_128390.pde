

/* @pjs preload="294892-shark-repellent-bat-spray.jpg"; */
/* @pjs preload="adam-west1.jpg";*/
PImage myimage;
PImage myimage2;

void setup () { 
  size(1200,813);

  myimage = loadImage("294892-shark-repellent-bat-spray.jpg");
  

myimage.filter(POSTERIZE,9);

  image(myimage, 0, 0, width, height);

//tint(225,217);
//image("adam-west1.jpg", 0,0);

myimage = loadImage("adam-west1.jpg");
image(myimage, 50, 50, width, height);
tint(255,127);


strokeWeight(3);
line(100,0,0,813);
line(200,0,0,813);
line(300,0,0,813);
line(400,0,0,813);
line(500,0,0,813);
line(600,0,0,813);
line(600,0,0,813);
line(800,0,0,813);
line(900,0,0,813);
line(1000,0,0,813);
line(1200,0,0,813);
line(1300,0,0,813);
line(1400,0,0,813);
line(1500,0,0,813);
line(1600,0,0,813);
line(1700,0,0,813);
line(1800,0,0,813);
line(1900,0,0,813);
line(2000,0,0,813);
line(2100,0,0,813);
line(2200,0,0,813);

}  

//PImage img1, img2;
//img1 = loadImage("adam-west1.jpg");
//img2 = loadImage("adam-west1.jpg");
//img2.filter(POSTERIZE, 4);



