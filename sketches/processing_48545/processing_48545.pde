
PImage dreamland;
PImage[] top = new PImage[19];

int[] x = {0,0,0,0,0,0,0,
           300,300,300,300,300,300,300,
           100,100,200,200,200};
int[] y = {0,100,200,300,400,500,600,
           0,100,200,300,400,500,600,
           0,100,600,500,0};
           
int xlines = 7;
int ylines = 4;

void setup()
{
  size (400,700);
  dreamland = loadImage("dreamland.jpg");
 for(int k=0; k<19; k++) {
 String imageName = "top" + nf(k, 2) + ".jpg";
 top[k] = loadImage(imageName);
}
}
void draw()
{
  frameRate = 50;
  background (255);
  stroke(150);
  
  //placing images
  image (dreamland,0,0);

  float xlinegap = (float)height/xlines;
  float ylinegap = (float)width/ylines;

  for(int i = 0; i < xlines; i++)
  {
    line(0, i*xlinegap, width, i*xlinegap);
  }
  
  for(int i = 0; i < ylines; i++)
  {
    line (i*ylinegap,0,i*ylinegap, height);
  }
  
  for (int k=0;k<19;k++){
  image (top[k],x[k],y[k]);    

}


  if ((mouseX <100) && (mouseX >0) &&(mouseY <100) && (mouseY >0) ) 
    { 
    fill(100,100,0,100);
    rect (0,0,100,100);
    } 
    if ((mouseX <100) && (mouseX >0) &&(mouseY <200) && (mouseY >100) ) 
    { 
    fill(100,100,0,100);
    rect (0,100,100,100);
    } 
    if ((mouseX <100) && (mouseX >0) &&(mouseY <300) && (mouseY >200) ) 
    { 
    fill(100,100,0,100);
    rect (0,200,100,100);
    } 
    if ((mouseX <100) && (mouseX >0) &&(mouseY <400) && (mouseY >300) ) 
    { 
    fill(100,100,0,100);
    rect (0,300,100,100);
    } 
    if ((mouseX <100) && (mouseX >0) &&(mouseY <500) && (mouseY >400) ) 
    { 
    fill(100,100,0,100);
    rect (0,400,100,100);
    } 
    if ((mouseX <100) && (mouseX >0) &&(mouseY <600) && (mouseY >500) ) 
    { 
    fill(100,100,0,100);
    rect (0,500,100,100);
    } 
    if ((mouseX <100) && (mouseX >0) &&(mouseY <700) && (mouseY >600) ) 
    { 
    fill(100,100,0,100);
    rect (0,600,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <100) && (mouseY >0) ) 
    { 
    fill(100,100,0,100);
    rect (300,0,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <200) && (mouseY >100) ) 
    { 
    fill(100,100,0,100);
    rect (300,100,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <300) && (mouseY >200) ) 
    { 
    fill(100,100,0,100);
    rect (300,200,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <400) && (mouseY >300) ) 
    { 
    fill(100,100,0,100);
    rect (300,300,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <500) && (mouseY >400) ) 
    { 
    fill(100,100,0,100);
    rect (300,400,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <600) && (mouseY >500) ) 
    { 
    fill(100,100,0,100);
    rect (300,500,100,100);
    } 
    if ((mouseX <400) && (mouseX >300) &&(mouseY <700) && (mouseY >600) ) 
    { 
    fill(100,100,0,100);
    rect (300,600,100,100);
    } 
    
    if ((mouseX <200) && (mouseX >100) &&(mouseY <100) && (mouseY >0) ) 
    { 
    fill(100,100,0,100);
    rect (100,0,100,100);
    } 
    if ((mouseX <200) && (mouseX >100) &&(mouseY <200) && (mouseY >100) ) 
    { 
    fill(100,100,0,100);
    rect (100,100,100,100);
    } 
    if ((mouseX <300) && (mouseX >200) &&(mouseY <700) && (mouseY >600) ) 
    { 
    fill(100,100,0,100);
    rect (200,600,100,100);
    } 
    if ((mouseX <300) && (mouseX >200) &&(mouseY <600) && (mouseY >500) ) 
    { 
    fill(100,100,0,100);
    rect (200,500,100,100);
    } 
    if ((mouseX <300) && (mouseX >200) &&(mouseY <100) && (mouseY >0) ) 
    { 
    fill(100,100,0,100);
    rect (200,0,100,100);
    }     
}






