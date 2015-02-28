
//needs opengl for transform
import processing.opengl.*;

//varz
int gridStep;
PImage from;
PImage to;
float where = 0;
float colorStep;
boolean ellipticalPixel = true;
int imagestotal;
PImage[] imgs;
int imgcount;
int transp = 255;

void setup(){
  
  ///////////////////////////
  //YOU SHOULD CHANGE THIS///
  ///////////////////////////
  imagestotal = 5;
  //this is the number of images in /data
  //these images should be named [number 0-x].jpeg
  //they all need to be the same size
  
  
  //defaults(changable from within program)  
  gridStep = 10; //pixel size
  colorStep = .01; //how drastically the color changes each draw, changed live based on mouseX on click
  colorMode(HSB); //RGB also works
  
  //load images
  imagestotal = imagestotal-1;
  imgs = new PImage[imagestotal];
  for(imgcount = 0; imgcount < imgs.length; imgcount++){
    imgs[imgcount] = loadImage(imgcount+".jpeg");
  }
  imgcount = 1;
  //vars you shouldn't change
  from = imgs[imgs.length -1];
  to = imgs[0];
  size(imgs[0].width, imgs[0].height, OPENGL);
  noStroke();
  frameRate(30);
}

void draw() {
  //saveFrame("out/anim/"+imgcount+"-"+where+".gif");
  smooth();
  // loop grid
  for (int gridY=0; gridY<from.height; gridY+=gridStep) {
    for (int gridX=0; gridX<from.width; gridX+=gridStep) {
      //set fill to image color at grid position
      fill(lerpColor(from.get(gridX, gridY), to.get(gridX, gridY), where),transp);

      //set diameter based on distance
      float diameter = float(gridStep)*2;
      
      pushMatrix();
      translate(gridX, gridY, diameter*5);
      if(ellipticalPixel == true){
        ellipse(0, 0, diameter, diameter);
      } else {
        rect(0, 0, diameter, diameter);
      }
      popMatrix(); 
    }
  }
  
  where += colorStep;
  
  
  if(abs(float(1)-where) <= colorStep) {
   //delay(1000);
   println("imgcount " + imgcount);
   println("imgs.length " + imgs.length);
   if(imgcount==0) from = imgs[imgs.length - 1];
   else from = imgs[imgcount-1];
   to = imgs[imgcount];
   where = 0;
   println("flip");
   imgcount++;
   if (imgcount == imgs.length) imgcount = 0;
  }
}



//keyboard
void keyReleased(){
  if (key=='s' || key=='S') saveFrame("out/"+timestamp()+"_##.png");
  if (key==' ') ellipticalPixel = !ellipticalPixel;
  if (key=='r' || key=='R') colorMode(RGB);
  if (key=='h' || key=='H') colorMode(HSB);
//  if (key=='c' || key =='C') {
//    if(colorMode() == RGB) colorMode(HSB);
//    else colorMode(RGB);
//  }
  if (key=='1') transp = 2;
  if (key=='2') transp = 3;
  if (key=='3') transp = 5;
  if (key=='4') transp = 9;
  if (key=='5') transp = 16;
  if (key=='6') transp = 28;
  if (key=='7') transp = 48;
  if (key=='8') transp = 84;
  if (key=='9') transp = 147;
  if (key=='0') transp = 255;
}
void mouseReleased() {
  gridStep = int((float(mouseY)/float(height) * height/20)+10);
  colorStep = float(mouseX) / float(width) * .04;
  println("grid step: " + gridStep);
  println("color step: " + colorStep);
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}




