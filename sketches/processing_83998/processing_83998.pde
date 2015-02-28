
import processing.video.*; //비디오 라이브러리 불러오기
Capture video; //Capture타입 오브젝트 video 생성 

float xpos, ypos;

void setup ()
{
 
  size (900,900);
    video = new Capture(this, 160, 120, 15);
  video.start();
  smooth ();
  xpos = 450;
  ypos = 450;
  noCursor();
 

}
 
void draw ()
{
  //   INT

    
    
    if (video.available()) {
    video.read();
    video.loadPixels();
    }
    image (video,130,450); image (video,290,330); image (video,450,690);  image (video,450,210);
    image (video,770,450);  image (video,610,330); image (video,610,570);
    image (video,290,450); image (video, 290,570);filter (THRESHOLD); 
    image (video,610,450);  image (video,290,450); filter (ERODE);
    image (video,450,570); image (video,450,330); filter (INVERT);
    image (video,450,450);
    image (video,mouseX,mouseY); image (video,mouseX+320,mouseY+240); image (video,mouseX,mouseY+240);
    image (video,mouseX+320,mouseY-240); image (video,mouseX+320,mouseY); image (video,mouseX-320,mouseY-240); image (video,mouseX-320,mouseY);
    image (video,mouseX-320,mouseY+240); image (video,mouseX,mouseY-240);
      filter (INVERT);
      imageMode(CENTER);
     
     if (mousePressed == true) {
    if (mouseButton == LEFT) {
    image (video,130,450); image (video,290,330); image (video,450,690);  image (video,450,210);
    image (video,770,450);  image (video,610,330); image (video,610,570);
    image (video,290,450); image (video, 290,570);filter (THRESHOLD); 
    image (video,610,450);  image (video,290,450); filter (ERODE);
    image (video,450,570); image (video,450,330); filter (INVERT);
    image (video,450,450);
  
  imageMode(CENTER);
  }
}
    else {
    
  
    
  //   épaisseur traits (ept) et points (ept), plus la valeur est grande, plus les traits sont fins.
  int eptl;
  eptl = 150;
  int eptc;
  eptc = 150;
  int epp;
  epp = 200;
 
  //   vibrations traits (vibl  et   viblc) et forme ellipse (vibc) et rect (vibr)
  int vibl;
  vibl = 2+mouseX/50;   // JAMAIS 0
  int viblc;
  viblc = 2+mouseX/50;  // JAMAIS 0
  int vibc;
  vibc = 2+mouseX/50;
  int vibr;
  vibr = 2+mouseX/50;
  
    int bidule;
  bidule = width/2;
  int bidule2;
  bidule2 = height/2;
 
  //   décalage  horizontal  vertical
  int dech;
  dech = -width/250;
  int decv;
  decv = -height/250;
 
  stroke (random (0,255), random (0), random (0));
  strokeWeight (random (((width/2)+(height/2))/epp/vibl, ((width/2)+(height/2))/epp));
 
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
 

  noFill ();
  stroke (random (250, 255), random (250, 255), random (240, 245));
  strokeWeight (random (((width/2)+(height/2))/eptc/viblc+1, ((width/2)+(height/2))/eptc+1));
 
  ellipse (width/2, height/2, 220, 220);
  ellipse (width/2, height/2, 500, 500);
  ellipse (width/2, height/2, 700, 700);

  stroke (random (250, 255), random (0), random (0));
  strokeWeight (random (((width/2)+(height/2))/eptl/vibl+1, ((width/2)+(height/2))/eptl+1));
  rect (210, 270, 160, 120);
  rect (530, 270, 160, 120);
  rect (210, 510, 160, 120);
  rect (530, 510, 160, 120);
  rect (50, 390, 160, 120);  
  rect (690, 390, 160, 120);
  rect (370, 630, 160, 120);
  rect (370, 150, 160, 120);
  rect (210, 270, 480, 360);
   
    stroke (random (0,255));
  strokeWeight (random (((width/2)+(height/2))/eptl/vibl+1, ((width/2)+(height/2))/eptl+1));
  rect (210, 270, 160, 120);
  rect (530, 270, 160, 120);
  rect (210, 510, 160, 120);
  rect (530, 510, 160, 120);
  rect (50, 390, 160, 120);
  rect (690, 390, 160, 120);
  rect (370, 630, 160, 120);
  rect (370, 150, 160, 120);
  rect (210, 270, 480, 360);
 
  }}
    
  /*stroke (random (200,210),random (175,185),random (130,140));
   strokeWeight (1);
    
   rect (width/2-(width/10*1)/2,height/2-(height/10*1)/2,(width/10*1),(height/10*1));
   rect (width/2-(width/10*2)/2,height/2-(height/10*2)/2,(width/10*2),(height/10*2));
   rect (width/2-(width/10*3)/2,height/2-(height/10*3)/2,(width/10*3),(height/10*3));
   rect (width/2-(width/10*4)/2,height/2-(height/10*4)/2,(width/10*4),(height/10*4));
   rect (width/2-(width/10*5)/2,height/2-(height/10*5)/2,(width/10*5),(height/10*5));
   rect (width/2-(width/10*6)/2,height/2-(height/10*6)/2,(width/10*6),(height/10*6));
   rect (width/2-(width/10*7)/2,height/2-(height/10*7)/2,(width/10*7),(height/10*7));
   rect (width/2-(width/10*8)/2,height/2-(height/10*8)/2,(width/10*8),(height/10*8));
   rect (width/2-(width/10*9)/2,height/2-(height/10*9)/2,(width/10*9),(height/10*9));
   rect (width/2-(width/10*10)/2,height/2-(height/10*10)/2,(width/10*10),(height/10*10));
   */




