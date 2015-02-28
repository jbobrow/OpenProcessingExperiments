
float a;
float g;
float r;
float state;
float diam;
float x;
float y;
float count;
int circleX;
int circleY;

void setup() {
  size(500,500);
  background(0);
  smooth();
  state = 0;
  x = 0;
  y = 0;
  diam = 0;
  count = 0;
}
void draw() {
    a = random(255);
    r = random(255);
    g = random(0);
    diam = count;
    state++;
    frameRate(4);
    
   { //body
    line(250,300,250,200);
    line(250,250,215,230);
    line(250,250,290,260);
    
    //head
    ellipse(250,200,40,40);
    fill(0);
    
}   
    //elipse
    stroke(255);
    fill(a = a + count);
    ellipse(x,y,count,count/2);
    
    if (state > 1) { fill(0);
} else if (state < 0) { state = 0;
}   
    
    if(state > 1) { // stars
     
     count = 90;
     
      x = int(random(0,250));
      y = int(random(0,100));
      
    }
    if (state > 15){
      
      count = 150;
      
      x = int(random(250,500)); //grass
      y = int(random(0,100));
      }
     if(state > 25){
     
      count = 6; 
      
      x = int(random(0,500));//balloons
      y = int(random(100,150));
      } 
     if(state > 30){ //smiley
     
     count = 3;
     
      x = int(random(0,500));//balloons
      y = int(random(120,250));
      }
     if(state > 80){// do over
        background(254,255,0);
 
       if(state > 81){// do over
        background(0);
        state = state-state;
        count = 0;
        diam = 0;    
      } 
        
      }

}
