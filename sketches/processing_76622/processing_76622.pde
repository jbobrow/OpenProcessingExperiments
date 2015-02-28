
float cred = 0;
float cblue = 0;
float cgreen = 0;
float cdistance = 0;
float ctime = 0;
float speed = 100;
float distincrement = 10;

//color stuff
float colorspeed = 50;
float colortime = 0;
float redprob = 0;
float redsign = 1;
float greenprob = 0;
float greensign = 1;
float blueprob = 0;
float bluesign = 1;
int changefactor1 = 10;
int changefactor2 = 25;

//ellipse collection
int maxripples = 40;
int currentripple = 0;
Ripple[] ripples = new Ripple[maxripples];



void setup() {
  size(640, 640);
  noStroke();
  background(0);
  cred = random(255);
  cblue = random(255);
  cgreen = random(255);
}

void draw(){
     if(mousePressed){
        if(millis()>speed+ctime){
 
           ctime = millis();
           if(currentripple>maxripples-1){
             currentripple = 0;
             cdistance = 0; 
           }
           ripples[currentripple] = new Ripple(cred,cblue,cgreen,cdistance);
           cdistance += distincrement;
           for(int i=currentripple;i>0;i--){
              ripples[i].display();
           }
           currentripple++;
           
        }
        if(millis()>colorspeed+colortime){
           colortime = millis();
           if(random(-1,1)<redprob){
              redsign = -1;
           }
           else{
              redsign = 1; 
           }
          if(random(-1,1)<greenprob){
              greensign = -1;
           }
           else{
              greensign = 1; 
           } 
          if(random(-1,1)<blueprob){
              bluesign = -1;
           }
           else{
              bluesign = 1; 
           }  
           cred += (random(changefactor1,changefactor2)*redsign);
           cblue += (random(changefactor1,changefactor2)*bluesign);
           cgreen += (random(changefactor1,changefactor2)*greensign);
           //red control
           if(cred < 50){ redprob = -.5; }
           else if(cred > 200){ redprob = .5; }
           else{ redprob = 0; }
           //green control
           if(cgreen < 50){ greenprob = -.5; }
           else if(cgreen > 200){ greenprob = .5; }
           else{ greenprob = 0; }
           //blue control
           if(cblue < 50){ blueprob = -.5; }
           else if(cblue > 200){ blueprob = .5; }
           else{ blueprob = 0; }
        }
        
           
     } 
}

void mouseReleased(){
     cred = random(255);
     cblue = random(255);
     cgreen = random(255);
     cdistance = 0;
     currentripple = 0;
}

void mouseDragged(){
   cdistance = 10; 
   currentripple = 1;
}

class Ripple{
      float r;
      float g;
      float b;
      float dist;
      float transp;
      
      Ripple(float red,float green, float blue,float distance){
            r = red;
            g = green;
            b = blue;
            dist = distance;
            transp = 50;
      }
      
      void display(){
           fill(r,g,b,transp);
           ellipse(mouseX,mouseY,dist,dist);
      }
      
}


