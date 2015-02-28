
//Charlotte Stiles cc2014
//cstiles
//2014
int numConfetti=26;
int MAX=26;
//float xpos, ypos,cs;//for confetti
float r, p; //speed of letters
float sec, m; //time keepers
int i = 0;// is the [i]
int j=0;
PImage[ ] picArray;
String [] prezString;
int change= 10;
float x, y; 
int [] confettiX =new int [numConfetti];
int [] confettiY =new int [numConfetti];
float a, b, c;
int [] confettiSpeed= new int [numConfetti];
color [] colorVals = new color[numConfetti];
void setup() {
  size(500, 500);
  smooth();
  frameRate(30);
  picArray = new PImage [MAX];
  initImageArray( picArray ); 
  prezString = loadStrings ("presidents2.txt");
  r=0;
  sec = millis()/1000;
  m=9;
initColorArray (colorVals);
    for (int h=0; h < confettiX.length; h++)
  {
  confettiX[h] = int( random(0,width));
  confettiY[h] =  int (random(0, -height));
  confettiSpeed[h] = int (random (.2,10));
  
  }
}

void draw() {
  m= (millis()/1000)-sec;
  a = random(1, 255);
  b = random(1, 255);
  c = random(1, 255);
  println(r);
  if (j==0) {
    image( picArray[i], 0, 0, width, height);
    j=1;
  }

  if (m==change) {
    i++;
    image( picArray[i], 0, 0, width, height);
    sec=millis()/1000;
    x=0;
    y=0;
    r=0;
  }
  image( picArray[i], 0, 0, width, height);
  fill(a, b, c, 100);
  rect(0, 0, width, height);
  confetti();
  showText(); 

}
void initColorArray (color [] colorVals)
{
  for (int i = 0; i < colorVals.length; i++)
    colorVals [i] = color( random( 255 ), random( 255 ), random( 255 ) );
}
 

void showText()
{
  p+=.1;
  x =r*cos(p);
  y =r*sin(p);
  r+=.5; 

  fill(a, b, c, 255);     
  textSize(20);     
  text(prezString[i], x+width/2-100, y+width/2);
}


void  initImageArray( PImage [ ] picArray )
{
  for (int i = 0; i < picArray.length; i++)
  {
    String imageName = "pic" + i + ".jpg" ;
    picArray[i] = loadImage(imageName );
  }
}

void confetti ()
{

  for (int h=0; h < confettiX.length; h++)
  {
   strokeWeight(7);
  stroke(colorVals[h]);
line( confettiX[h] + random(-2,2), confettiY[h],  confettiX[h] + random(-2,2), confettiY[h]+random(4, 8));
    if ( confettiY[h] >= height)
    confettiY[h] = int(random(0,-height/2));
    
confettiY[h] += confettiSpeed[h];

  }
}

void keyPressed() {
  if (key == ' ') {
    setup();
  }
  else {
    exit();
  }
}



