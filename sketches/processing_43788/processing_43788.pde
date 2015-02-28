
// Weiyuh Li
// practice of many bouncing balls
// move the horizontal bar by mouse to help the balls to escape
// only above the bar these balls have chance to escape 
// background color changes by the position of mouse
// have no ideas why can't set color of balls????
//reference http://www.openprocessing.org/visuals/?visualID=42444
 
 
float  g1, g2, g3;
float ball_size=13;
float bound_color1=0;
float bound_color2=0;
float bound_color3=0;
 
float[] x=new float[10];
float[] y=new float[10];
float[] w=new float[10];
float[] h=new float[10];
float[] c=new float[10];
 
void setup() {
  size(400, 600);
  frameRate=12;
  for (int i=0;i<10;i++) {
    x[i]=random(width);
    y[i]=70+random(height-50);
    w[i]=random(10);
    h[i]=random(10);
    c[i] = color(random(255), random(255), random(255));
  }
}
void draw() {
  //set background
  g1=mouseX/2+50;
  g2=mouseY/2+50;
  g3=(g1+g2)/2;
  background(g1, g2, g3, 150);
 
  //set boundary
  strokeWeight(5);
  noFill();
  stroke(bound_color1, bound_color2, bound_color3);
  //boundary 1
  rect(0, 0, (width/2)-15, 50);
  //boundary 2
  rect( (width/2)+15, 0, (width/2)-15, 50);
  //boundary 3
  line(0, mouseY, 400, mouseY);
 
  for (int i=0;i<10;i++) {
    if ((y[i]<=50) && (x[i]>= (width/2)-15+(ball_size/2))) {
      w[i]=-w[i];
    }
    if ((y[i]<=50) && (x[i]<= (width/2)+15-(ball_size/2))) {
      w[i]=-w[i];
    }
    if ((y[i]>50) && (x[i]>=width-ball_size/2)) {
      w[i]=-w[i];
    }
    if ((y[i]>50) && (x[i]<=0+ball_size/2)) {
      w[i]=-w[i];
    }
    if ((x[i]<=width/2-15) && (y[i]<=50+(ball_size/2))) {
      h[i]=-h[i];
    }
    if ((x[i]>=width/2+15) && (y[i]<=50+(ball_size/2))) {
      h[i]=-h[i];
    }
    if ( y[i]>=mouseY-(ball_size/2)) {
      h[i]=-h[i];
    }
    //draw balls
 
    noStroke();
    fill(c[i]);/////球只有黑色???
    ellipse(x[i]+=w[i], y[i]+=h[i], ball_size, ball_size);
 
    // boundary change color if ball goes out
    if ( y[i]<0 && y[i]>-250) {
      bound_color1=random(255);
      bound_color2=random(255);
      bound_color3=random(255);
    }
  }
}

