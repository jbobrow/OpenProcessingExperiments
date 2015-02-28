
int num = 100;
float[] mySize = new float [num];
float[] ypos = new float[num];
float[] speed = new float[num];
float[] N = new float [num];
color[] myColors = new color[4];
int[] col = new int[num];

void setup() {

  size(300,300);

  //explicitly add colors to the myColors array
  myColors[0] = color(200,40,35,75);
  myColors[1] = color(65,185,54,75);
  myColors[2] = color(255,217,0,75);
  myColors[3] = color(0,168,255,75);

  //use a loop to randomly seed ypos, speed, and col
  for(int i=num-1; i>=0; i--) {
    ypos[i] = random(0,height);
    speed[i] = random(-5,5);
    col[i] = floor(random(0,4));
    mySize[i] = random (-50, 50);
    N[i] = random (10);
  }
  noStroke();
  smooth();
}

void draw() {
  background(220);
  
  for(int i=0; i<num-1; i++) {
    
    if (width/num > 1){
    //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    //draw the ellipse using ypos[]
    ellipse(width/num * i + width/num, ypos[i], mySize[i], mySize[i]);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    }else{
      
      //this solution to the bug doesn't space everything proportionally, and it doesn't necessarily put all the ellipses in the screen
      
      //use the int from col[] to choose the fill from myColors[]
    fill(myColors[col[i]]);
    //draw the ellipse using ypos[]
    ellipse(width/num * i + i*.1 + width/num, ypos[i], mySize[i], mySize[i]);
    //update ypos[] with speed[]
    ypos[i] = ypos[i] + speed[i];
    }
      
    
    //if the circles go off the screen, reset them
    if(ypos[i] > height + abs(mySize[i]/2)) ypos[i] = abs(-mySize[i])/2;
    if(ypos[i] < -abs(mySize[i]/2)) ypos[i] = height - +abs(mySize[i]/2);
  }
}

