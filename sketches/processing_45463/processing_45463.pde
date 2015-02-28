
/* 
 This example needs a folder named "data" 
 inside data, the name of the images are fy000.jpg 
 fy005.jpg
 if you change the code to work with your images
 you will have to change line 18 to make it work 
 
 
 */

int frame = 0;
int numFrames = 4;
int opacity= 0;
PImage[] images = new PImage[numFrames];
boolean c = false;
 
p p[]; 
float globalZ=0;

void setup() {
  size(640,480);
  smooth();

  frameRate(15);
   p=new p[1000]; 
  for(int i=0; i<p.length; i++)    p[i]=new p(i/1000.0,  800,  800); 



  for (int i = 0; i<images.length; i++) {
    //change the line below to the name of the images in your data folder
    String imageName = "ghostly" + nf(i,3) + ".jpg";
    println("imageName" + imageName);
    images[i] = loadImage(imageName);
    println(numFrames);
  }
}

void draw() {
  /* changed where the next frame changes - used to be 
   frame++; */
  if (opacity == 100) {
    opacity=0;
    frame++;
  }
  if(frame == numFrames) {
    frame=0;
  } 

  image(images[frame], 0, 0);

  opacity += 50;
  fill(1,1.99); 
  rect(0,0,width,height);//fade background 
  
  stroke(0); 
  for(int i=0; i<p.length; i++) p[i].update();//render particles 
    
  globalZ+= map(mouseX, 0,width/2,  0.001,0.03); 

}

void mousePressed(){
  println("----------");
  int rnd = round(random(200));
  p[rnd].x=mouseX;
  p[rnd].y=mouseY;
 
}

  
class p {
  float id,x,y,xp,yp,s,d; 
  
  public p(float _id,float _x,float _y) { 
    id=_id; // prima valoare a "adincimi", Z pentru noise
    x=xp=_x; 
    y=yp=_y; 
    s=random(-2,10); //speed
  }
 
  
  
  void update(){ 
  
    id+=map(mouseX, 0,width/2,  0.001,0.05); 
    d=noise(x/(float)mouseY,y/(float)mouseY,globalZ)  *360;  // globalZ instead of id for continuity
    
    x+=cos(radians(d))*s; 
    y+=sin(radians(d))*s; 
  
    if(x<0) x=xp=width;//offscreen rewind 
    if(x>width)x=xp=0; 
    if(y<0) y=yp=height; 
    if(y>height)y=yp=0; 
  
    line(xp,yp,x,y); 
    xp=x; 
    yp=y; 
  } 
} 


