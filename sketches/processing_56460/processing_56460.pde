
int w=450;
float i,j,r,t;
int x,y,bg;
float mysize = 0.05;
String myshape = "rectangle";
float myspeed;
color c = color(0, 0, 0);

void setup(){
  size(450,450);
  frameRate(25);
  colorMode(HSB);
  smooth();
  background(255);
}
void draw(){
  
  myspeed = 3 * dist(mouseX, mouseY, pmouseX, pmouseY);
  x=mouseX;
  y=mouseY;
  noStroke();
  rectMode(CENTER);
  fill(c);
  
  if(keyPressed) {
    if (key == '+') {
      mysize = mysize + 0.1;
    }
    if (key == '-') {
      if(mysize>0.05){
        mysize = mysize - 0.1;
      }
    }
    if (key == 'c') {
      myshape = "circle";
    }
    if (key == 'r') {
      myshape = "rectangle";
    }
    if (key == ' '){
     
      background(255);
      c = color(0); 
    }
    if (key == 's'){
      saveFrame("jungwirth-drawing-####.png");
    }
  }

  if (mousePressed){
    if(mouseButton == LEFT){
      c = color(round(random(360)),0,round(myspeed*0.5));
      for(i=40f;i<w;i+=2)
      {
        for(j=0;j<w;j+=40)
        {
          if(myshape== "rectangle"){
            r=3E3/(dist(x,y,i,j)+1E2);
            rect(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),(10*mysize),(10*mysize));
          }
          if(myshape== "circle"){
            r=3E3/(dist(x,y,i,j)+1E2);
            ellipse(i+r*cos(t=atan2(j-y,i-x)),j+r*sin(t),(10*mysize),(10*mysize));
          }
        }
      }
    }
    else{
      background(255);
      c = color(0); 
    }
  }
}

