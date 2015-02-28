
PImage blissImage;
PImage sceneryImage;
PImage bendImage;
PImage unicornImage;
PImage cloudImage;
PImage teardropImage;


color skyBlue = color(200,200,255);
color midnightBlue = color(0,0,50);

void setup() {
  size(1000, 500);
}

void draw() {
  

  float amt = map( mouseY, 0,height, 1,0 );
  color c = lerpColor( skyBlue, midnightBlue, amt );
  
  background(c);


  blissImage= loadImage("bliss.png");
  unicornImage=loadImage("unicorn.png");
  bendImage=loadImage("bend.png");
  cloudImage=loadImage("cloud.png");
 teardropImage=loadImage("teardrop.png");
  

 
  

  float blissX = map(mouseX, 0,width, -600,100 );
  image(blissImage, blissX,300);


  float bendX = round( map(mouseY, 0,height, -200,300 ));
  image(bendImage, 100,bendX);
  
  
  image(unicornImage, 700,160);
   float teardropY = round( map(mouseY, 0, height, 100, 200) );
  image( teardropImage, 850, mouseY );
  
  //how to make it transparent 
  
}



