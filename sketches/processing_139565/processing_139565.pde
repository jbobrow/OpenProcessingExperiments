
//Naomi Rauch
//CS 118
//March 11, 2014
//Making Functions Using Previously submitted waves drawing

float speed = 1.5;//determines speed of wave across screen by changing x coord

float i = 0;//X coordinate

void setup() {
size(1000, 400);
background(255); 
noStroke();
smooth();

}

void draw () {
      background(0);
   
      i += speed;
    
      float scale = map(i,0,width,1,0.3);
      float y = map(i,0,width,0,147);
      float t = map(i,0,width,0,255);
      wave(i,y,scale,t);
      wave(i+50,y,scale,t);
      wave(i+50,y+50,scale,t);
      wave(i+100,y+50,scale,t);
      wave(i+100,y+100,scale,t);
      wave(i+150,y+100,scale,t);
      wave(i+150,y+150,scale,t);
      }

      

      
void wave (float x, float y, float s, float t) {
          
          pushMatrix();
          translate(x,y);
          scale(s);
          fill(0,50,t,100);
          stroke(1);
          beginShape();
          vertex(0,147);
          vertex(16,108);
          vertex(36,78);
          vertex(57,58);
          vertex(82,44);
          vertex(111,39);
          vertex(139,46);
          vertex(157,59);
          vertex(163,81);
          vertex(160,102);
          vertex(150,117);
          vertex(138,107);
          vertex(118,104);
          vertex(105,117);
          vertex(104,134);
          vertex(120,148);
          endShape(CLOSE);
          noStroke();
          popMatrix();
      }

  


