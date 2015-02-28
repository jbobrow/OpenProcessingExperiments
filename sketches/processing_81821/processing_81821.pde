
PImage img;
PFont font;
int px=-10; //to move the clouds along the x axis
//varaibles to give the clouds a sinusoid movement (code taken from Processing Handbook by Casey Reas and Ben Fry)
float offset = 20.0; // Y offset
float scaleVal = 10.0; // Scale value for the wave magnitude
float angleInc = PI/28.0; // Increment between the next angle
float angle = 0.0;
float py;


void setup () {
  background (#000000);
  size(600,450);
  frameRate(20);
  img = loadImage("Ex3A.jpg");
  fill(#FFFFFF);
}

void draw() {
  image (img,0,0);
  //floor
  smooth();
  fill(15);
  rect(0,height/7*6,width,height);
  fill(255);
  noStroke();
  for(int i=50; i < width;i+=110){
  ellipse(i,430,40,10);}
   
  //************stars***********************
  //x position, y position, size, orientation
    star(40,30,20,-70);
    star(100,90,30,180);
    star(150,30,15,110);
    star(240,110,30,-70);
    star(50,150,15,150);
    star(160,190,20,-70);
    star(300,170,20,-80);
    star(80,250,40,120);
    star(240,320,20,30);
    star(180,380,15,-90);
    star(60,360,20,240);
     
  //**********moving clouds*********
  // x position, y position, size of the ellipse that will form the cloud, color fill, kind of cloud
   
  float py = offset + (sin(angle) * scaleVal); //sinusod movement
    
  cloud(px,py+20,80,255,1); 
  cloud(px+50,py+80,50,225,2);
  cloud(width-px-50,py,60,255,1);
  cloud(width-px+60,py+100,50,255,2);
  cloud(width-px+20,py+30,70,235,1);
    
  px++;
  angle += angleInc; 
  if (px>width+180){px=0;}
}
 
void back(){
  for (int y=0;y<height/7*6;y++){
    float n = norm(y, 0.0, float(height/7*6)); // example from handbook to make the grey gradient
    float val = n * 175.0;
    stroke(val);
    smooth();
      line (0,y,width,y);}
   for (int l=height/7;l<=height;l+=height/7){
     stroke(0);
     strokeWeight(2);
     line(0,l,width,l);
   }
  }
 
 
void cloud(int x,float y,float t, int f, int k){
  noStroke();
  fill(f);
  if (k==1){
    ellipse(x,y,t,t);
    ellipse(x+0.4*t,y+0.6*t,t,t);
    ellipse(x+1.2*t,y+0.6*t,t,t);
    ellipse(x+1.6*t,y,t,t);
    ellipse(x+0.8*t,y-0.2*t,t+0.2*t,t+0.2*t);
  }
  else if (k==2){
    ellipse(x,y,t,t);
    ellipse(x+0.8*t,y,t+0.3*t,t+0.3*t);
    ellipse(x+1.6*t,y,t,t);
  }
}
 
void star(float cx, float cy, float w, float startAngle){ //http://processing.org/learning/anatomy/ adapted
    float angle = TWO_PI/ 10;  // twice as many sides
    float dw; // draw width
    float dh; // draw height
    float h=w*3/4;
     
    w = w / 2.0;
    h = h / 2.0;
 
    noStroke();
    float c=random(210,255); //by setting random colors you get the impression of shining stars
    fill(c);
     
    beginShape();
    for (int i = 0; i < 10; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * 0.4;
        dh = h * 0.4;
      }
      vertex(cx + dw * cos(radians(startAngle) + angle * i),
        cy + dh * sin(radians(startAngle) + angle * i));
    }
    endShape(CLOSE);
  }



