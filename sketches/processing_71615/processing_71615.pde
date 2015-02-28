
int counter;
eye1 = new eyeBall;
eye2 = new eyeBall;

PVector eye1_center;
PVector eye2_center;

PVector eyeleft;
PVector eyeright;

void setup() {  //setup function called initially, only once
  size(500, 250);
  background(225, 225, 235);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  eye1_center = new PVector(225,125);
  eye1 = new eyeBall(eye1_center, 24);
  
  eye2_center = new PVector(275,125);
  eye2 = new eyeBall(eye2_center, 24);
}

void draw() {  //draw function loops 
  background(225, 225, 235);
  eye1.display(new PVector (mouseX, mouseY));
  eye2.display(new PVector (mouseX, mouseY));

  
  if(mousePressed == true) { //add some interaction
    eyeleft =  new PVector (mouseX - 25, mouseY);
    eyeright =  new PVector (mouseX + 25, mouseY);
    eye1.move(eyeleft);
    eye2.move(eyeright);
  }

} 


class eyeBall {
  
 color ic;
 float r;
 PVector wc;
   
 eyeBall (PVector myCentre, float myRadius) {
  ic = color (random(50, 200), random(100, 200), random(100,200));
  wc = myCentre;
  r = myRadius;
 }
  
 void display(PVector direction) {
   noStroke();
   fill (255);
   ellipse (wc.x, wc.y, r*2, r*2);
    
   PVector d = direction;
   pushMatrix();
   if (d.dist(wc) < (r/2)) {
     translate (d.x, d.y);
   } else {
     translate ((r/2)*( (d.x - wc.x)/d.dist(wc)) + wc.x, (r/2)*((d.y - wc.y)/d.dist(wc)) + wc.y );
   }
   fill(ic);
   ellipse (0,0, r, r);
   fill(0);
   ellipse (0,0, r/2, r/2);
   fill (255, 200);
   ellipse (r*-0.2, r*-0.2, r*0.3, r*0.3);
 
   popMatrix();
 }


void move(PVector direction)
 {
     PVector mousepos = direction;
     PVector dir = PVector.sub(mousepos, wc);
     dir.mult(0.05);
     wc.add(dir);
 }
 }
