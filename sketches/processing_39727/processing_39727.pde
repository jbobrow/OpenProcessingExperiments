
PImage img, img2, img3, img4;
//PImage stands for processing image
void setup()
{ size(900,900);

//png is a cleaner compression than JPEG, it wont appear as smoooth. Use JPEG for pics however
// its good practice to initalize the image in the setup.
img3= loadImage("meupdown.png");
img4= loadImage("meblue.png");
img2 = loadImage("me2.png");
img = loadImage("me.png");

}

float q;
float distance;
float t=100;
int numObjects = 6;
int centerX = 330;
int centerY = 300;
float r= 100; 
float z;
void draw()
{
  z=random(0,20);
  fill(0,0,0,5);
   rect(0,0,900,900);
       ellipse(470,260,30+z,20+z);
       ellipse(560,250,30+z,20+z);
     float angleObject = TWO_PI/numObjects;
   for (int i=0; i<numObjects;i++)
  {
    q=random(t,r);
    distance = r+q;
    t=random(q-0.1,q+0.1);
    if(t>400){
      t=100;
    }
    //the sin (angle) cos(angle) has to be multiplied by the distance from the center
    //because trigonometric functions assume a  circle with radius
   q=r;
 float posX=centerX +distance*sin(angleObject*i-frameCount*0.01);
    float posY=centerY + distance*cos(angleObject*i-frameCount*0.01);
     posX=centerX +distance*sin(angleObject*i-frameCount*0.01)*0.2+20;
  posY=centerY + distance*cos(angleObject*i-frameCount*0.01)*0.2;
image(img4,posX,posY);
    ellipse(150+posX,150+posY,50,50);

      posX=centerX +distance*2*sin(angleObject*i-frameCount*0.01);
   posY=centerY + distance*2*cos(angleObject*i-frameCount*0.01);
    ellipse(150+posX,150+posY,50,50);
//pic1
 posX=centerX +distance*sin(angleObject*i+frameCount*0.01);
  posY=centerY + distance*cos(angleObject*i+frameCount*0.01);
image(img,posX,posY);
   image(img2,posX,posY, random(240,270), random(250,270));
   //pic2
    posX=centerX +distance*sin(angleObject*i+frameCount*0.01)*1.5;
  posY=centerY + distance*cos(angleObject*i+frameCount*0.01)*1.5;
image(img3,posX,posY);

   //pic3
    posX=centerX +distance*sin(angleObject*i-frameCount*0.01)*1.9;
  posY=centerY + distance*cos(angleObject*i-frameCount*0.01)*1.9;
image(img4,posX,posY);

//pic4
   pushMatrix();
   translate(posX,posY);
   rotate(angleObject*(numObjects-i));


  posX=centerX +distance*sin(angleObject*i-frameCount*0.01)*0.2+20;
  posY=centerY + distance*cos(angleObject*i-frameCount*0.01)*0.2;
image(img4,posX,posY);

popMatrix();

  }
 

  //images function displays the image
  
  

}

  



