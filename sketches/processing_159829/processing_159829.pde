
void setup(){
  size(600,600);
  smooth();
  
  
}

int sunX = 280;
int sunY = 450;
int moonX = 280;
int moonY = 450;
int state = 0;
int speed = 1;
float SSColorR = 0;
float SSColorG = 24;
float SSColorB = 72;
float a;
float diam;
float starX;
float starY;
int count = 0;


void draw(){
  
  //sunrise
 if(state == 0){
    sunY = sunY - speed;
    SSColorR = SSColorR + ((198.0-0.0)/(450.0+52.0));
    SSColorG = SSColorG + ((229.0-24.0) /(450.0+52.0)); //  sum it by difference of color divided by number of steps
    SSColorB = SSColorB + ((217.0-72.0) /(450.0+52.0)); // same here
    background(int(SSColorR),int(SSColorG),int(SSColorB));
    fill(248,202,0);
    noStroke();
    ellipse(sunX,sunY, 100,100);
       if (sunY < -52) {
       sunY = 450;
       state = 1;
        } 
 } 
 //darkness falls / moonrise
 else if (state == 1){
    moonY = moonY - speed;
    SSColorR = SSColorR - ((198.0-0.0)/(450.0-150.0)); //  sum it by difference of color divided by number of steps
    SSColorG = SSColorG - ((229.0-24.0) /(450.0-150.0)); 
    SSColorB = SSColorB - ((217.0-72.0) /(450.0-150.0)); 
    background(int(SSColorR),int(SSColorG),int(SSColorB)); // must cast to integer
    fill(255);
    noStroke();
    ellipse(moonX,moonY, 30,30);
    if (moonY < 150) {
      state=2;
      moonY = 450;
         } 
    } 
    else if (state == 2){
     count++;
     a = random(255);
     diam = random(10);
  //casting to integer
  starX = int(random(width)); 
  starY = int(random(height)); 
  
  // stars come out
   noStroke();
   fill(255,255,255,a);
   ellipse(starX,starY,diam,diam); 
    }
       //reset the machine
       if(count > 450){
         count = 0;
         state = 0;
      }
  
 
 //mountains
  stroke(155,200,155,100);
  fill(155,200,155,255); 
  triangle(0,600,220,300,440,600);
  triangle(150,600,400,200,700,600);
  
}


