
PImage myImage;
int posx;
int posy;
 
void setup(){
  size(600,600);
  color(0);
}


void draw(){
  smooth();
  background(255);
  noStroke();
  
  myImage = loadImage("face.png");
      image(myImage, 0, 0);
      //load the background image
      
      // myImage = loadImage("eyes.png");
      // image(myImage, 0, 0);
      //load the forard image
     
   
      fill(0);
      noStroke();
      ellipse(380+mouseX/100,250+mouseY/12, 60,110);
      ellipse(180+mouseX/100,250+mouseY/12, 60,110);
     
 
 
 posx=mouseX;//-(600-mouseX);
 posy=mouseY;//-(600-mouseY)



if(mousePressed == true) {
   
      myImage = loadImage("face.png");
      image(myImage, 0, 0); 
       
   //eyes movement
   fill(0);
   noStroke();
  //Left eye smlie
   ellipse(170+mouseX/20,60+mouseY/2, 80,10);
  //Right eye smlie
   ellipse(370+mouseX/20,60+mouseY/2, 80,10);

     
  }
   
}


//image source: http://abortioneers.blogspot.com/2011/06/put-on-happy-face.html

