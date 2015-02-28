

int i;
int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 50;     // Diameter of rect
int circleSize = 53;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

PVector current_p;
PVector old_p;
float rotation,t,a=0,c,d,b=0;

void setup() {
  size(800, 600, P3D);


  background(#FFFFFF);
  lights();
  //frameRate(500);

  rectColor = color(0);
  rectHighlight = color(#FFFFFF);
  circleColor = color(255);
  circleHighlight = color(255,0,0);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = 700;
  circleY = 520;
  rectX = 600;
  rectY = 495;
  c=300;
  d=300;
  stroke(1);
  //strokeWeight(5);
  ellipseMode(CENTER);

  current_p=new PVector(150,150,0);

  rotation=0;
}

void keyPressed() {
  print("pressed a key");

  if(key=='r') {
    background(#FFFFFF);
  }
  else if(key=='w') {

    current_p.y-=5.0;
  }
  else if(key=='s') {

    current_p.y+=5.0;
  }
  else if(key=='a') {

    current_p.x-=5.0;
  }
  else if(key=='d') {

    current_p.x+=5.0;
  }
  else if(key=='e') {

    current_p.z-=5.0;
  }
  else if(key=='q') {

    current_p.z+=5.0;
  }
  else if(key=='c') {
    rotation++;
  }
  else if(key=='v') {
    rotation--;
  }
  if(current_p.x<22)
    current_p.x=22;
  else if(current_p.x>770)
    current_p.x=770;
  if(current_p.y<25)
    current_p.y=25;
  else if(current_p.y>565)
    current_p.y=565;
  if(current_p.z<-400)
    current_p.z=-400;
  else if(current_p.z>200)
    current_p.z=200;
}

void draw() {

  // rect(x, y, width, height)
  rect(0, 0, 20, 600);
  rect(780, 0, 20, 600);
  rect(-10, 0, 815, 25);
  rect(-10, 580, 815, 25);

  if(mousePressed) {
    if(circleOver==false && rectOver==false)
    {
      current_p.x=mouseX;
      current_p.y=mouseY;
      current_p.z=0;
    }
  }

  update(mouseX, mouseY);
  rect(rectX, rectY, rectSize, rectSize);

  if(circleOver) {
    fill(circleHighlight);
  } 
  else {
    fill(circleColor);
  }

  ellipse(circleX, circleY, circleSize, circleSize);
  //point(current_p.x,current_p.y,current_p.z);
  println("---");
  //background(0);
  translate(current_p.x,current_p.y,current_p.z);
  rotate(radians(rotation));
  fill(current_p.z+(255-80));



  //noStroke();
  rect(0,0,15,15);
  print("current_p:");
  print(current_p.x);
  print(" , ");
  print(current_p.y);
  print(" , ");
  println(current_p.z);
  t=t+0.01;
}
void update(int x, int y)
{
  if( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } 
  else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } 
  else {
    circleOver = rectOver = false;
  }
}
void mousePressed()
{
  if(circleOver) {
    currentColor = circleColor;
  } 
  if(circleOver==true) {
    if(a<4)
      a++;
    if(a==1)
      if(circleOver) {
        currentColor = color(255,0,0);
        circleHighlight = color(0,255,0); 
        stroke(currentColor);
      }
      else
        if(circleOver)
          a++;
    if(a==2) {
      currentColor = color(0,255,0);
      circleHighlight = color(0,0,255); 
      stroke(currentColor);
    }
    else
      if(a==3) {
        a=0;
        currentColor = color(0,0,255);
        circleHighlight = color(255,0,0);
        stroke(currentColor);
      }
  }
  if(rectOver==true) {
    if(b<4)
      b++;
    if(b==1)
      if(rectOver)
        strokeWeight(1);

      else
        if(rectOver)
          b++;
    if(b==2)
      strokeWeight(2); 
    else
      if(rectOver)   
        if(b==3) {
          b=0;
          strokeWeight(3);
        }
  }
}  
boolean overRect(int x, int y, int width, int height) 
{
  if (mouseX >= x && mouseX <= x+width && 
    mouseY >= y && mouseY <= y+height) {
    return true;
  } 
  else {
    return false;
  }
} 
boolean overCircle(int x, int y, int diameter) 
{
  float disX = x - mouseX;
  float disY = y - mouseY;
  if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } 
  else {
    return false;
  }
}

//}


