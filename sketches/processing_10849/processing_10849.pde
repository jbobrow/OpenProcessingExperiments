
/*

    Welcome to 
              Flow    
                  by Tom Ashworth
    
    Flow is a hybrid of computer and human generated artwork.
    
    Controls:
    
      Q/W/E  -   Increase R/G/B Value
      A/S/D  -   Decrease R/G/B Value
      C      -   Clear Screen
      [/]    -   Decrease/Increase Y Randomness 
      -/=    -   Decrease/Increase X Randomness
      P      -   Force Change of X/Y Speed
      Click  -   Stop Drawing
    
    Tips:
    
      - Try tapping P to force Flow to re-evaluate it's random X&Y drift
      - Click to pause, press C and then use the colour mod keys, then click to begin.
      - Try changing the colours while drawing for awesome images.
    
    
*/

int pointnum = 7;
boolean drawit = true;

float[][] points = new float[pointnum][4];
int[] colour = { 150, 150, 150 };
float[] rand = { 1.5, 0.5 };

void setup() {
  
  size(925,450);
  smooth();
  
  noFill();
  
  background(0);
 
  frameRate(50);
  
  generate();
  
}

void draw() {
  
  if(drawit) {
        
    stroke(colour[0],colour[1],colour[2],10);
    float division = width / pointnum;
    
    beginShape();
      curveVertex(-division,height/2);
      
      for(int i=0;i<pointnum;i++) {
        points[i][1] += points[i][2] * 2;
        points[i][0] += points[i][3] * 2;
        if((points[i][1] > height) || (points[i][1] < 0)) {
          points[i][2] *= -1;
          points[i][2] += random(-rand[1],rand[1]);
        }
        if((points[i][0] > width) || (points[i][0] < 0)) {
          points[i][3] *= -1;
          points[i][3] += random(-rand[1],rand[1]);
        }
        curveVertex(points[i][0],points[i][1]);
      }
      
      curveVertex(width+division,height/2);
    endShape();
    
    beginShape();
      curveVertex(-division,height/2);
      
      for(int i=0;i<pointnum;i++) {
        curveVertex(points[i][0],height-points[i][1]);
      }
      
      curveVertex(width+division,height/2);
    endShape();
    
  }
  
}

void generate() {
  
  float division = width / pointnum;
  for(int i=0;i<pointnum;i++) {
    points[i][0] = random(division*i,division*(i+1));
    points[i][1] = random(height);
    points[i][2] = random(-rand[0],rand[0]); 
    points[i][3] = random(-rand[1],rand[1]);     
  }
  
}

void mousePressed() {
  drawit = (drawit) ? false : true;
}

void keyReleased() {
  
  if(key == 'c') {
      background(0);
  }
  
  // Speed Modifiers
  switch(key) {
    case '-':
      rand[0] -= 0.5;
      break;
    case '=':
      rand[0] += 0.5;
      break;
    case '[':
      rand[1] -= 0.5;
      break;
    case ']':
      rand[1] += 0.5;
      break;
  }
  rand[0] = constrain(rand[0],0,6);
  rand[1] = constrain(rand[1],0,8);
  
  if(key == 'g') {
    background(0);
    generate();
  }
  
}

void keyPressed() {
  
  // Colour Changes
  int cstep = 2;
  if(key == 'q') {
    colour[0] += (colour[0] <= 254) ? cstep : 0;
  }
  else if(key == 'w') {
    colour[1] += (colour[1] <= 254) ? cstep : 0;
  }
  else if(key == 'e') {
    colour[2] += (colour[2] <= 254) ? cstep : 0;
  }
  
  if(key == 'a') {
    colour[0] -= (colour[0] >= 0) ? cstep : 0;
  }
  else if(key == 's') {
    colour[1] -= (colour[1] >= 0) ? cstep : 0;
  }
  else if(key == 'd') {
    colour[2] -= (colour[2] >= 0) ? cstep : 0;
  }
 
  // Reset Speed
  if(key == 'p') {
    rand[0] = 1.5;
    rand[1] = 0.5;
    for(int i=0;i<pointnum;i++) {
      points[i][2] = random(-rand[0],rand[0]); 
      points[i][3] = random(-rand[1],rand[1]);     
    }
  }
  
}

