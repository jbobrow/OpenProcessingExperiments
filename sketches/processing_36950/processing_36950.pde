
void setup()
{
  size(1000,1000);
  frameRate(30);
  noStroke();
  smooth();
  background(0,0,0);
  
}

float lf =-500;
float rt =500;
float tp =-500;
float bm =500;
float pinwheel = random(0,20);

boolean mdown = false;
void mousePressed() {
mdown = true;
}
 
void mouseReleased() {
mdown = false;
}


void draw()
{
  

float fieldx = random(lf, rt);
float fieldy = random(tp, bm);
float splitchance = round(random(0, 180));


  if ( mdown== true )
  {
    
    
pushMatrix();
    translate(mouseX, mouseY);
    
    fill(random(100, 200),random(150),50);
  ellipse(fieldx, fieldy, 20, 20);
  
  popMatrix();
  
  
 if (lf<0 && rt > 0 && tp <0 && bm >0){
   lf = lf + noise(lf)*5.6;
  rt = rt - noise(rt)*5.6;
  tp = tp +noise(tp)*5.6;
  bm = bm -noise(bm)*5.6;}
  
  
  if (lf>0){
     
  pinwheel = pinwheel + noise(pinwheel)*3;
  
  float pinwheelseatx = pinwheel/5+random(0, 10);
  float pinwheelseaty = pinwheel/5+random(0,10);
  float diamx = 20;
  float diamy = 20;
  
    pushMatrix();
    
    translate(mouseX, mouseY);
    rotate (radians(pinwheel));
    fill(random(120), random(100), random(120));
    ellipse (pinwheelseatx, pinwheelseaty, diamx,diamy);
    fill(0,0,0);
    ellipse (1,1,26,26);
  popMatrix();
  
  
  
  }
  
  fill(0,0,0,5);
  rect(0,0,height, width);
  
  
  }
  
  else
  {
    pushMatrix();
    translate(mouseX, mouseY);
    
    fill(random(100, 200),random(150),50);
  ellipse(fieldx, fieldy, 20, 20);
  
  popMatrix();
  fill(0,0,0,5);
  rect(0,0,height, width);
  
if (lf>-500 && rt < 500 && tp >-500 && bm <500){
   lf = lf - noise(lf)*4;
  rt = rt + noise(rt)*4;
  tp = tp -noise(tp)*4;
  bm = bm +noise(bm)*4;}
  
  pinwheel = random(0,20);
  
}
println (splitchance);
}


