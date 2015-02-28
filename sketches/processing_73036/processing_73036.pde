
int posx;
int posy;

void setup() {
  size(1000, 1000);
   PImage myImage = loadImage("http://sphotos-a.xx.fbcdn.net/hphotos-ash3/425543_3243117090777_1909467941_n.jpg");
  image(myImage, 0, 0);
  myImage.updatePixels();
}

void draw() 
{
   loadPixels();
  color pixel = get(mouseX,mouseY);
  //pixels[i]= pixel;
  noStroke();
  fill(pixel);
 
  if(mousePressed == true) 
 
    posx=mouseX-(mouseX );
    posy=mouseY-(mouseY );
    rect(posx,posy,20,20);
 }
