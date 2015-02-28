
int clickStart = 0;
int clickEnd = 0;
color lineColor = color(255);
int Xvalues = 0;
int Yvalues = 0;
int[] mouseXValues= new int[0];
int[] mouseYValues= new int[0];
int diam = 10;
int y = 30;

int[] ellipseSpot = new int[3];
int dripCount = 0;

int[] sleep = {2, 5, 9};
int[] monitor = {12,15,19};
int[] coffee = {2,4,6};
int [] homework = {6,10,16};

int[] circleY={0,0,0};
int[] circleYbackup={0,0,0};
int[] circleX={-600,-600,-600};

  boolean[] circle = {false, false, false, false};
//  boolean circle1 = false;
//  boolean circle2 = false;
//  boolean circle3 = false;
//  boolean circle4 = false;
//  boolean circle5 = false; 

void setup(){
  size(1024,768);
  background(0);
  frameRate(8);
}

void draw() {
  if(key == 'e' && y <= 700) {
    noStroke();
     fill(255,106,48);
    //shape(rect,0,-700,width, height);
    beginShape ();
    vertex (1024,10);
    vertex (1024, 0);
    vertex (0, 0);
    vertex (0, 30);
    curveVertex(-15, y+5);
    curveVertex(0, y+20);
    curveVertex(53,y+15);
    curveVertex(101, y+5);
    curveVertex(180, y+10);
    curveVertex(300, y);
    curveVertex(500, y+5);
    curveVertex(700, y+10);
    curveVertex(900, y-5);
    curveVertex(1024, y-20);
    curveVertex(1010, y-40);
    endShape();
    y+=4;
  }

  stroke(lineColor);
  strokeWeight(10);
  smooth();
  if(mousePressed) {
    mouseXValues = append(mouseXValues,mouseX);
    mouseYValues = append(mouseYValues,mouseY);
    println(mouseYValues[mouseYValues.length-1]);
//    println("clickStart: " + clickStart);
//    println("clickEnd: " + clickEnd);
    stroke(lineColor);
    line(mouseX, mouseY, pmouseX, pmouseY);
    noStroke();
  }
    for(int i=0; i<ellipseSpot.length; i++){
      if(circle[0] == true && circleY[i]<= circleYbackup[i] + 10*sleep[i]) {
        noStroke();
        ellipse(circleX[i], circleY[i]+3, 10,10);
        circleY[i] += sleep[i]/2; 
      }
//      println(circle[0]);
      println(circleY[i]<= 10*sleep[i]);
      println(circle[1]);
//      println(circleY);
//      println(mouseXValues);
      if(circle[1] == true && circleY[i]<= circleYbackup[i] + 10*coffee[i]){
        noStroke();
        ellipse(circleX[i], circleY[i]+3, 10,10);
        circleY[i] += coffee[i]/2; 
//        }
          
      }
     if(circle[2] == true && circleY[i]<= circleYbackup[i] + 10*monitor[i]){
        noStroke();
        ellipse(circleX[i], circleY[i]+3, 10,10); 
        circleY[i] += monitor[i]/6; 
      }
    
     if(circle[3] == true && circleY[i]<= circleYbackup[i] + 10*homework[i]){
        noStroke();
        ellipse(circleX[i], circleY[i]+3, 10,10);
        circleY[i] += homework[i]/6;
      }

    }
  
}

void mousePressed(){
  clickStart=mouseXValues.length;
  println(clickStart);
}
void mouseDragged(){
  clickEnd=mouseXValues.length;
  println(clickEnd);
}

void mouseReleased(){
    if(clickEnd>5){
      for(int i = 0; i<ellipseSpot.length; i++){
        ellipseSpot[i] = clickStart + i*3+4;
        circleY[i] = mouseYValues[ellipseSpot[i]];
        circleYbackup[i] = mouseYValues[ellipseSpot[i]];
        circleX[i] = mouseXValues[ellipseSpot[i]];
      }
     circle[dripCount] = true;
     dripCount++;
    } 
   
}


void keyPressed() {
  if (key=='b') {
    lineColor = color(0, 80, 200);
    fill(lineColor);
    stroke(lineColor);
  }
   
  if (key =='y'){
    lineColor = color(247,245,55);
    fill(lineColor);
    stroke(lineColor);
  } 
 
  if (key=='p'){
    lineColor = color(#ed1c24);
    fill(lineColor);
    stroke(lineColor);
  }
  
  if(key == 'g'){
    lineColor = (#225c0c);
    fill(lineColor);
    stroke(lineColor);
  }
  
  if (key == 't'){
    fill(0);
    PFont Helvet;
    Helvet = loadFont("HelveticaNeue-CondensedBold-48.vlw"); 
    textFont (Helvet, 48);  
    text("THANK YOU", 350, 450);
    textAlign(RIGHT);
  }
}




  



