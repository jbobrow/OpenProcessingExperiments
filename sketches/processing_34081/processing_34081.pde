
int[] mouseXValues= new int[0];
int[] mouseYValues= new int[0];
int clickStart=0;
int clickEnd=0;
//int ellipseSpot = int(random(clickStart, clickEnd)+.5);

color lineColor = color(255);

int[] ellipseSpot = new int[5];
int dripCount=0;

int[] circleY= {0, 0, 0, 0, 0};
int[] circleX= {-600, -600,-600,-600,-600};

boolean circle;

void setup() {
  size(1024, 768);
  background(102);
  frameRate(15);
  
  circle = false;
}

void draw() {
  stroke(255);
  strokeWeight(10);
  smooth();
  if(mousePressed) {
    mouseXValues = append(mouseXValues,mouseX);
    mouseYValues = append(mouseYValues,mouseY);
    println(mouseXValues[mouseXValues.length-1]);
    println(mouseYValues[mouseYValues.length-1]);
    println("clickStart: " + clickStart);
    println("clickEnd: " + clickEnd);
    stroke(lineColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
    //line(mouseX-noise(0)*.02, mouseY, mouseX, int(mouseY+(pmouseX-mouseX*.2)));
  }
 // if (mousePressed) {
  //  fill
  
  //make paint drip
  noStroke();
  if(circle == true && dripCount<40) {
    for(int i=0; i<ellipseSpot.length; i++){
      ellipse(mouseXValues[ellipseSpot[i]], circleY[i], 10,10);
      circleY[i]+=int(random(5)+.5); 
    }
    dripCount+=1;
  }
  
}

void mousePressed(){
  clickStart=mouseXValues.length;
}
void mouseDragged(){
  clickEnd=mouseXValues.length;
}

void mouseReleased(){
    if(clickEnd>5){
      for(int i = 0; i<ellipseSpot.length; i++){
        ellipseSpot[i] = int(random(clickStart, clickEnd)+.5);
        circleY[i] = mouseYValues[ellipseSpot[i]];
        circleX[i] = mouseXValues[ellipseSpot[i]];
        ellipse(circleX[i], circleY[i], 10,10);
      }
      //mouseYValues[ellipseSpot]++;  // really you ignore this, and delete at the end, if you still aren't using it.
    } 

    
     //ellipse(mouseXValues[ellipseSpot], mouseYValues[ellipseSpot], 50,50);     
     circle = true;
     dripCount=0;     
}

void keyPressed() {
   if (key=='a') {
     lineColor = color(0, 80, 200);
      //noStroke();
     fill(lineColor);
     line(mouseX, mouseY, pmouseX, pmouseY);
        if(circle == true && dripCount<40) {
            for(int i=0; i<ellipseSpot.length; i++){
              ellipse(mouseXValues[ellipseSpot[i]], circleY[i], 10,10);
            }
        }
   }
   
  if (key =='b'){
   lineColor = color(247,245,55);
    fill(lineColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
        if(circle == true && dripCount<40) {
            for(int i=0; i<ellipseSpot.length; i++){
              ellipse(mouseXValues[ellipseSpot[i]], circleY[i], 10,10);
            }
        }
  } 
 
  if (key=='c'){
    lineColor = color(#ed1c24);
    fill(lineColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
        if(circle == true && dripCount<40) {
            for(int i=0; i<ellipseSpot.length; i++){
              ellipse(mouseXValues[ellipseSpot[i]], circleY[i], 10,10);
            }
        }
  }
  
  if(key == 'o'){
    lineColor = (#225c0c);
    fill(lineColor);
     int diam=50; 

     //line(mouseX, mouseY, pmouseX, pmouseY);
      if(circle == true && dripCount<40) {
            for(int i=0; i<ellipseSpot.length; i++){
              //ellipse(mouseXValues[ellipseSpot[i]], circleY[i], 50,50);
       
       ellipse(mouseXValues[ellipseSpot[i]], circleY[i], diam,diam);
  }
  diam++;
      }
       }
}
    



