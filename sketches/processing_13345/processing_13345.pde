

///Code initialisation
float x =1; // the speed of the beat controller
int p= 0; // integer setting for p=0 which represents the stroke wheight
import processing.opengl.*;//USING OPEN GL FOR IMPORTING THE CITY BACKGROUND IN TO MY SKETCH
PImage img;// image importer
int a; 

 ///Main setup
void setup()
{
    size(740,335,OPENGL);//sets the size of the screen
        frameRate(x+18);//speed of the frame rate
        smooth();
 img = loadImage("sydney.jpg");//image file loader

}
 
 
 ///Drawing Setup
void draw()

{
  if (x>280)// setting x to be more tha 200 give the ellipse a chance to get bigger before the x=-x command initiates which makes it go smaller.
{
   
  x=-x; // makes the if condition true when x>200 it therefore makes this condition to be true and then by x=-x, the ellipse shrinks down and so on.
  {
    if (frameRate > 28)
    {

      {
        if (p>20){
          
          p=-p; }}}}
}
   
  image(img, 0, 0, width, height);//setting the sydney image to spread along the setup size of the screen
 
  
strokeWeight(p=20);//represent the thickeness of the rim around the ellipse.
 
stroke(155,80,200,98); //color for the rim around the ellipse
  
  
fill(150,75,50,155);// color of the red ellipse which represents the first half
 
ellipse(150,200,x,x);//second beating ellipse
  x=x+10.25;
  p= p+1;
  fill(10,300,5,105);
  
  ellipse(450,100,x,x);
  x=x+10.25;
  p= p+1;
    fill(130,70,5,15);
 
fill(150,75,50,155);
ellipse(650,180,x,x);
   

}
 
 
 
 
   
 
   


