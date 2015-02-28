
int oldMouseX, oldMouseY;
color myPenStroke;
int myPenWeight;
float[] x = new float[101];
float[] y = new float[101];

void setup(){
  size(800,800);
  background(255);
  smooth();
  oldMouseX=0;
  oldMouseY=0;
  myPenStroke = color(0,0,0);
  myPenWeight=1;
  
  for (int j=0;j<101;j++){
x[j]=width/101*j;
y[j]=height/2;
  
}
}

void draw(){
  move(x,y);
  display();

 strokeWeight(0);
  stroke(myPenStroke,150);
      if(mousePressed) {
    if(oldMouseX != mouseX || oldMouseY != mouseY) {
     for(int j=1;j<100;j++){
        oldMouseX++;
        oldMouseY++;
      curve(mouseX,mouseY,x[j],y[j],x[j],y[j],x[j],y[j]);
      curve(mouseX,mouseY,mouseX,mouseY,x[j],y[j],x[j],y[j]);
  
            follow();

        }
      }
    }
 
  oldMouseX=mouseX;
  oldMouseY=mouseY;
 //red button
fill(255,0,0);
stroke(0);
strokeWeight(0);
ellipse  (20,20,20,20);
if(mousePressed && dist(20,20,mouseX,mouseY) < 20) {
myPenStroke = color(255,0,0);
}
//yellow button
fill(255,255,0);
stroke(0);
ellipse(60,20,20,20);
if(mousePressed && dist(60,20,mouseX,mouseY) < 20) {
myPenStroke = color(255,255,0);
}
//blue button
fill(0,0,255);
stroke(0);
ellipse(100,20,20,20);
if(mousePressed && dist(100,20,mouseX,mouseY) < 20) {
myPenStroke = color(0,0,255);
}
//black
fill(0);
stroke(255);
ellipse(140,20,20,20);
if(mousePressed && dist(140,20,mouseX,mouseY) < 20) {
myPenStroke = color(0);
}
//eraser
fill(255);
stroke(0);
strokeWeight(0);
ellipse(180,20,20,20);
if(mousePressed && dist(180,20,mouseX,mouseY) < 20) {
myPenStroke = color(255);
}

//clear screen
fill(255);
stroke(0);
rect(10,60,20,20);
if(mousePressed) {
if(mouseX > 10 &&mouseX <30 && mouseY > 60&&mouseY<80){
background(255);
}
}

//clear screen black
fill(0);
stroke(255);
rect(10,90,20,20);
if(mousePressed) {
if(mouseX > 10 &&mouseX <30 && mouseY > 90&&mouseY<110){
background(0);
}
}

}

  
void follow(){
x[100]=x[100]+(mouseX-x[100])/8;
y[100]=y[100]+(mouseY-y[100])/8;
}




void move(float[] X,float[] Y){
for(int j=0;j<100;j++){
X[j]+=(X[j+1]-X[j])/8;
Y[j]+=(Y[j+1]-Y[j])/8;
}

}

void display(){

}


