
ArrayList<Ember> embers;

void setup() {
  size(400,700);
  frameRate(50);
  background(0,0,0,10); 
  embers = new ArrayList<Ember>();
  for(int i=0;i<25;i++) embers.add(new Ember(random(3),500,random(width)));  
}

void draw(){
  background(1);
  for(int i = embers.size()-1; i>= 0; i--){
   Ember m = embers.get(i);
   m.display();
   if (m.yTrack[m.trailEnd]>height+m.size){
     embers.remove(i);
  }
 }
}

class Ember {
  
  int age;
  float size;//radius of ember
  int delay;//frames between ember and the end of its trail
  int trailEnd;//the end of the trail
  float speedX;
  float speedY; 
  float start; //starting x position
  float xpos; //changing x position
  float[] xTrack;
  float ypos; //changing y position
  float[] yTrack;
  
  Ember(float tempSize, float initSpeed, float tempStart){
    
    age = 0;
    size = tempSize;
    delay = int(random(50,150));
    
    speedX = 0;
    speedY = initSpeed;
    start = tempStart;
    
    xpos = 0; // init conds
    xTrack = new float[1];
    xTrack[0] = xpos;
    
    ypos = 0; // init conds
    yTrack = new float[1];
    yTrack[0] = ypos;
    
  }
 
 void display(){
   ellipseMode(RADIUS);
   noStroke();
   ++age;
   speedX = speedX + random(-(speedX+20),20);//larger drift for larger width of random, obv.
   speedY = speedY + random(-(speedY-10),20);
   xpos = xpos + speedX/frameRate;
   xTrack = append(xTrack,xpos);
   ypos = ypos + speedY/frameRate;
   yTrack = append(yTrack,ypos);
     for(int i = 0;i<age&i<delay;i++){
      fill(75,0,0,delay-i);
      ellipse(start+xTrack[age-i],yTrack[age-i],size,size);
      trailEnd = age-i;  
      }
   color col = color(255 - (155*abs(sin(frameCount+random(1)))),0,0);
   fill(col);
   ellipse(start+xpos,ypos,size,size);
 } 
}
void mousePressed(){
  if(embers.size()<100){
  for(int i=0;i<10;i++) embers.add(new Ember(random(3),500,random(width)));
  }
}


