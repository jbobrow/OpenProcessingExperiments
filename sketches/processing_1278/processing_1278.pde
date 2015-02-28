
PImage a;
int dotsize = 20;
float scaleamount = 0.75;

//fill colors
color fill_l = color(0,0,0);
color fill_m = color(0,0,0);
color fill_s = color(0,0,0);
color white = color(255,255,255);

int r = 0;
int g = 0;
int b = 0;

float part = 1.5;
float colorpart = 0.5;
float tiny = sqrt(2)-1;
float bigpoint = dotsize;
float pointiny = dotsize*tiny;

int rpart = 0;
int gpart = 0;
int bpart = 0;

//color arrays
int[] red = new int[3];
int[] green = new int[3];
int[] blue = new int[3];

//color sort array
int[] pixarr = new int[3];

void setup()
{
/*  //get an image to work with
  String imgName = selectInput();
  a = loadImage(imgName);
*/
  a = loadImage("toby.jpg");
 
  size(500,650); //for demo
  noStroke();
//  smooth();
}

void draw()
{ 
  background(255);
  scale(scaleamount);
  translate(15,20);  //for demo
  
  colorpart = norm(mouseX, 0, width);
  
  for (int i = dotsize; i < a.width; i = i+dotsize) {
  for (int j = dotsize; j < a.height; j = j+dotsize) {
  int x = i;
  int y = j;
  int xtin = int(i+dotsize/2);
  int ytin = int(j+dotsize/2);
  
  getcolors(x,y);
  circles(x,y,bigpoint);
  
  getcolors(xtin,ytin);
  circles(xtin,ytin,pointiny);
  
  
   }//end i
  }//end j
  
  
}

void getcolors(int x, int y){
  color pix = a.get(x, y);
 
 //setup small, med, large
  r=int(red(pix));
  g=int(green(pix));
  b=int(blue(pix));
  
  rpart = int(r*colorpart);
  gpart = int(g*colorpart);
  bpart = int(b*colorpart);
  
  color r_focus=color(r,gpart,bpart);
  color g_focus=color(rpart,g,bpart);
  color b_focus=color(rpart,gpart,b);
  
  pixarr[0] = r;
  pixarr[1] = g;
  pixarr[2] = b;
  pixarr = sort(pixarr);
  
  if (pixarr[2]==r) {
    fill_l =r_focus;}
    else if (pixarr[2]==g) {
    fill_l =g_focus;}
    else {
    fill_l =b_focus;}
   if (pixarr[1]==r) {
    fill_m =r_focus;}
    else if (pixarr[1]==g) {
    fill_m =g_focus;}
    else {
    fill_m =b_focus;}   
  if (pixarr[0]==r) {
    fill_s=r_focus;}
    else if (pixarr[0]==g) {
    fill_s=g_focus;}
    else {
    fill_s=b_focus;}
}
   //actually draw
 void circles(int x, int y,float pointillize)
 {
  fill(fill_l); 
  ellipse(x, y, pointillize, pointillize);
  
  fill(white);
  ellipse(x, y, pointillize/part, pointillize/part);
  
  fill(fill_m); 
  ellipse(x, y, pointillize/part, pointillize/part);
 
  fill(white); 
  ellipse(x, y, pointillize/(part*part), pointillize/(part*part)); 
  
  fill(fill_s); 
  ellipse(x, y, pointillize/(part*part), pointillize/(part*part));

 }

/*
void mouseClicked() {

  String savePath = selectOutput("Choose a filename, sucka.");  // Opens file chooser

  if (savePath!=null) {
    save(savePath +".png");
  }// If a destination was chosen, save the current image as a png file where chosen. 
  else save("dots.png");
  
}
*/

