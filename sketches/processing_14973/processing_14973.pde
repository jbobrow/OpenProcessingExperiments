
size(500,500);
PImage myImage;
myImage = loadImage("myimage.jpg");
image(myImage,10,40);

tint(100,100,100,225);
myImage = loadImage ("myimage2.jpg"); 
image(myImage,200,200);

tint(100,100,100,180);
myImage = loadImage ("myimage3.jpg"); 
image(myImage,10,10);

textSize(100);
fill(112,227,21,150);
text("HELLO?",50,450);

textSize(100);
fill(112,227,21,100);
text("WORLD?",100,90);

