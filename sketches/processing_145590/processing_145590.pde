
float map;

float x = 0;

float y = 0;

float ang = 0;

PImage img1,img2,img3,img4;

void setup() {
  
  size(682, 960);
    
  img1 = loadImage("irrlicht.jpg");
  
  img2 = loadImage("mann.png");
 
  img3 = loadImage("titel-3.png"); 
 
  img4 = loadImage("14.png");

}

void draw() {

  background(0);
  
  pushMatrix();
  
    translate(340+x,530+y); //center of the "irrlicht"rotation
  
    rotate (radians(ang));
  
    image(img1, -width/2-340,-height/4-530); //x and y coordinate of the image relative to rotationpoint
    
  
  // the size of the image must be bigger than width and height to cover the whole frame during the rotation
  
  popMatrix();
  
  image(img2, 25, 119);
  
  image(img3, 0, 0);
  
  image(img4, 25, 822);
  
  ang = ang + sq(map(mouseX,0,width,0,15))*0.25; //rotationangle increases with mouseX - sq for smoother acceleration

  if (mouseX > width/2){  //for more chaos the rotationcenter shifts randomly also increases with mouseX

    map = map(mouseX,width/2,width,0,100);

    x = random(-map,map);

    y = random(-map,map-25);

  }

  else {x = 0;}

}

