
/*************************
 Random Color Dots
 Random colored dots that grow in size and diminish in Alpha.  
 Can randomize Hue, Saturation, or Brightness, by pressing 'h', 's', or 'b' key.
 
 By dagoch.
****************************/

int numdots = 400;
dot[] dots = new dot[numdots];
boolean looping=true;
int testx = 0;
float central_hue;
int prev;
int mode = 0; // 0 is stopped
int last_mode = 0;

void setup() {
  noLoop();
  prev=millis();
  size(800,800);
  background(255);
noStroke();

textSize(32);
fill(0);
text("To start: Select hue, saturation or brightness\n by pressing h, s or b.",20,400);
colorMode(HSB, width);
//ellipseMode(RADIUS);


}

void draw() {
if (mode>0 && (millis()-prev)>10) {
  for (int i=0; i<dots.length;i++) {
 dots[i].grow();
 dots[i].display();
}
prev=millis();
}
}

void mouseClicked() {
  if (looping) {
  noLoop();
  looping=false;
  } else {
    loop();
    looping=true;
  }
}

void keyPressed() {

  if (key == 'h') { 
    mode = 1;
   restart();
  } else if (key == 's') {
    mode = 2;
   restart();
  } else if (key == 'b') {
    mode = 3;    
   restart();
 } else if (key == 'c') {
   clear_and_restart();
 } else if (key == ' ') {
   // pause
   
   toggle_mode();
 }  

}

void toggle_mode() {
     if (mode>0) {
       last_mode = mode;
       mode=0;
     } else {
       mode = last_mode;
     }
}

void clear_and_restart() {
    background(0,0,width,width/2); // clear everything with white bg
 restart();
}

void restart() {
 central_hue=random(height);
 for (int i=0; i<dots.length;i++) {
     dots[i]= new dot();
  }
  loop();
}
class dot {
  int x,y,z,d,grow;
  float alpha, h,s,b;
  boolean visible;

  dot() {
    x =  int(random(width));
    //   testx+=2;   // for testing with direct progression
    y = int(random(height));
    z=int(random(300)-150);
    d = int(random(width/10));
    alpha = random(height/2)+(height/2);
    
    float r = sqrt((x*x) + (y*y));    // Convert cartesian to polar -- PRODUCES LINEAR PROGRESSION
    float theta = atan2(y,x);         // Convert cartesian to polar  -- ALSO PRODUCES LINEAR PROGRESSION      // Compute 2D polar coordinate function
    float val = sin(cos(r) + 5 * theta);    // Results in a value between -1 and 1  -- MORE RANDOM LOOKING for HUE

// default functions,for the parameters that will not vary
     h = central_hue+(random(50)-25); // HUE is centered around gobal central_hue
    s = height-random(height/10); // Saturation within 10% of max
    b = height-random(height/10);  // brightness within 10% of max
  
  // which function varies is switchable by letter on keyboard 
 if (mode == 1) { 
    h = (val+1)*width/2; //((sin(x)+1)*width/2); // HUE is function of x
 } else if (mode==2) { 
   s = (sin(y)+1)*height/2;// (val+1)*width/2; //   // Saturation is function of y
 } else if (mode==3) {
   b=  random(height/2)+(height/2);  // randomize brightness, no dimmer than 50%
 }
 if (alpha>0) visible=true;
    grow = int(random(5)+1);
    
  }
  
  void display() {
    if (visible) {
    noStroke();
    fill(h,s,b,alpha);
//    fill(x,y,500,500);

    ellipse(x,y,d,d);
//    ellipse(x,100,50,100);

    println(x,y,z,d,alpha);
    }
  }
  
  void grow() {
    d+=grow;
    alpha-=grow; // or -1
    if (alpha<1) visible = false;
  }
}



