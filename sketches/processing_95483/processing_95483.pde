
//Charlotte Lim

//centre of head
int cX = 256;
int cY = 280;

//irisDiameter
int iD = 60;

void setup(){
  size(512,600);  
  
  println("HAPPY EASTER!!!\n");
}

void draw(){
  
  int r = int(random(0, 255));
  int g = int(random(0, 255));
  int b = int(random(0, 255));
  
  background(183, 222, 255);
  
  if (keyPressed){
    background(r, g, b);
    println("YAY CHOCOLATE!! ");
  }
  
  noStroke();
  
  //ears
  fill(255); //white
  ellipse(cX-55, cY-150, 80, 220); //earL
  ellipse(cX+55, cY-150, 80, 220); //earR
  fill(248,214,252); //pink
  ellipse(cX-55, cY-150, 60, 200); //earL
  ellipse(cX+55, cY-150, 60, 200); //earR
  
  //white
  fill(255);
  ellipse(cX, cY, 210, 190); //upperHead
  ellipse(cX, cY+80, 260, 210); //lowerHead

  
  //pink
  fill(248,214,252); 
  ellipse(cX, cY, 190, 170); //upperHead
  ellipse(cX, cY+80, 240, 190); //lowerHead


  if(mousePressed){
    stroke(255);
    strokeWeight(10);
    line(cX-80, cY+40, cX-20, cY+40);
    line(cX+80, cY+40, cX+20, cY+40);
    
  } else {
    
    //eyes
    fill(255);
    ellipse(cX-50, cY+40, iD+20, iD+20); //L
    ellipse(cX+50, cY+40, iD+20, iD+20); //R
    //iris
    if (keyPressed){
      fill(r,g,b); 
    } else {
      fill (200);
    }
    ellipse(cX-50, cY+40, iD, iD); //L
    ellipse(cX+50, cY+40, iD, iD); //R
    
    
    //mapping mouse position to fit pupils in iris
    int iR = iD/2 - 10; //radius pupils may move in
    //x-value for right iris
    float xL = map(mouseX, 0, 512, cX-50-iR, cX-50+iR);
    //x-value for left
    float xR = map(mouseX, 0, 512, cX+50-iR, cX+50+iR);
    //yVal
    float y = map(mouseY, 0, 600, cY+40-iR, cY+40+iR);
    
    //pupils
    fill(255);
    ellipse (xL, y, 20, 20);
    ellipse (xR, y, 20, 20);
    
  }
  
  //mouth
  stroke(255);
  strokeWeight(10);
  line(cX-15, cY+110, cX+15, cY+125);
  line(cX-15, cY+125, cX+15, cY+110);  
}


