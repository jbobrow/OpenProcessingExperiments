
int counter;

void setup() {  //setup function called initially, only once

  americaWinCount=0;
  russiaWinCount=0;
  size(800, 400);
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  Obama=loadImage ("http://www.whitehouse.gov/sites/default/files/administration-official/ao_image/president_official_portrait_hires.jpg");
  Putin=loadImage ("https://pbs.twimg.com/profile_images/452901349341282306/0kDnx9qI.jpeg");
  RussiaVictory=loadImage ("http://i.imgur.com/Lc17Igh.png");
  AmericaVictory=loadImage ("http://i.imgur.com/N34JQ7N.png");
}
int[] bloodX = new int[2000];
int[] bloodY = new int[2000];
void splatter( posX, posY)
    {ellipse (posX, posY, 40, 20);
     ellipse (posX+20, posY-30, 29, 10);
     ellipse (posX-10, posY-15, 20, 15);}
void draw() {  //draw function loops 

      
  image (Putin, 0,0,400,400);
  image (Obama, 400, 0,400,400);
  if (russiaWinCount>10){
  //    println("Got here");
      background (0,0,0);
      image (RussiaVictory, 0,0, 800, 400);
  }
  if (americaWinCount>10){
      image (AmericaVictory, 0,0,800,400);
      }
  
//  println(russiaWinCount);
  noStroke();
  
  stroke (255,0,0);
  if(mousePressed == true) { //add some interaction

      if (mouseX<400){
          americaWinCount++;
          }
          else {russiaWinCount++;}

      bloodX[counter]=mouseX;
      bloodY[counter]=mouseY;
      counter++;
  }
  fill (255,0,0);
  for (int i=0; i<bloodX.length; i++){
      
      splatter (bloodX[i], bloodY[i]);
      }
}
