
float xoff = 0.0;
float yoff = 1.0;
float xincrement = 0.01;
float yincrement = -0.01; 

int step = 0 ;
int radius = 170;

var Xmax = 0;
var Xmin =0;

var points = Array();

void setup() {
  size(640, 360);
  background(0);
  noStroke();
  frameRate(6);
}

void mousePressed() {
  if(width/2 - radius < mouseX && mouseX < width/2 + radius) {
    ellipse(mouseX, mouseY, 10, 10);
    var pointCoord = Array(mouseX, mouseY);
    points.push(pointCoord);
  }
}

void keyPressed() {
  fill(0);
  stroke(0);
  rect(0, 0, width, height);
  step = 0;
  points = Array();
}

void draw()
{
  
  
  //basic setup
  fill(30);
  stroke(0,200,0);
  // noFill();
  ellipse(width/2, height/2, radius*2, radius*2);
  stroke(255);
  ellipse(width/2, height/2, 5, 5);
  
  //x-lines
  line(width/2+radius-3, height/2,width/2+radius+3, height/2);
  line(width/2-radius-3, height/2,width/2-radius+3, height/2);
  
  //y-lines
  line(width/2, height/2+radius-3,width/2, height/2+radius+3);
  line(width/2, height/2-radius-3,width/2, height/2-radius+3);
  
  //--------------------------
  
  //showing points from array
  for (i=0;i<points.length;i++){
    fill(220,0,0);
    ellipse(points[i][0], points[i][1], 5, 5);
    
    text(points[i][0] + "x" + points[i][1], points[i][0] + 10, points[i][1] + 10); 
  }
  
  //--------------------------
  
  //line going by circle
  if (step<360) {
    stroke(0,200,0);
    strokeWeight(3);
    line(width/2, height/2,
    width/2 + radius*cos(step/PI),
    height/2 + radius*sin(step/PI));
    
    stroke(0,200,0);
    line(width/2, height/2,
    width/2 + radius*cos((step-0.1)/PI),
    height/2 + radius*sin((step-0.1)/PI));
    
    stroke(0,100,0);
    line(width/2, height/2,
    width/2 + radius*cos((step-0.2)/PI),
    height/2 + radius*sin((step-0.2)/PI));
    
    fill(255);
    strokeWeight(1);
    ellipse(width/2 + radius*cos(step/PI), height/2 + radius*sin(step/PI), 5, 5);
    
    //highlight
    /*
      for (i=0;i<points.length;i++){
        if(points[i][0]*points[i][1]){
          scale(2);
        }
      fill(220,0,0);
      ellipse(points[i][0], points[i][1], 25, 25); 
    }
    */
    
    
    
    step++;
  } else {
    fill(0);
     stroke(0);
     rect(0, 0, width, height);
    step = 0;
 }
  
}




