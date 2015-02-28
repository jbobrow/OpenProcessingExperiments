
int frameNumber = 0;
PImage dude;
int smallPoint, largePoint;
void setup() {
  size(800,700);
  dude = loadImage("the-dude.png");
  smooth();
 
 
 smallPoint = 4;
  largePoint = 40;
  imageMode(CENTER);
  
 background(0);
  
  colorMode(HSB);
  
}

void draw() {
  frameNumber ++;
  noStroke();
  
  color c = dude.get(mouseX,mouseY);
  fill(c, 102);
  //fill(100,200,0,15);
  
 
float pointillize = map(0, 0, width, smallPoint, largePoint);
  int x = int(random(dude.width));
  int y = int(random(dude.height));
  color pix = dude.get(x, y);
  fill(pix, 128);
  ellipse(x, y, pointillize, pointillize);
  

  //fill(random(100,255), random(150,255), random(100,255));
  
  //ellipse(random(0,width), random(0, height), 10, 10);
   //ellipse(random(0,width), random(0, height), 10, 10);
    //ellipse(random(0,width), random(0, height), 5, 5);
     //ellipse(random(0,width), random(0, height), 5, 5);
      //ellipse(random(0,width), random(0, height), 5, 5);
       //ellipse(random(0,width), random(0, height), 10, 10);
        //ellipse(random(0,width), random(0, height), 10, 10);
         //ellipse(random(0,width), random(0, height), 10, 10);
          //ellipse(random(0,width), random(0, height), 10, 10);
           //ellipse(random(0,width), random(0, height), 10, 10);
           //ellipse(random(0,width), random(0, height), 15, 15);
           //ellipse(random(0,width), random(0, height), 10, 10);
           ellipse(random(0,width), random(0, height), 2, 2);
           //ellipse(random(0,width), random(0, height), 2, 2);
            //ellipse(random(0,width), random(0, height), 2, 2);
             //ellipse(random(0,width), random(0, height), 2, 2);
              //ellipse(random(0,width), random(0, height), 2, 2);
               //ellipse(random(0,width), random(0, height), 2, 2);
                //ellipse(random(0,width), random(0, height), 2, 2);
                 //ellipse(random(0,width), random(0, height), 2, 2);
                 
           //ellipse(random(0,width), random(0, height), 15, 15);
           //ellipse(random(0,width), random(0, height), 15, 15);
           
  
  frameRate(10000);
  smooth();
  if(frameNumberP00==0){
    saveFrame("dude#######.jpg"); 
  }
 if (key == 's'){
    saveFrame(dude+".jpg"); //save image as .jpg
  }}
