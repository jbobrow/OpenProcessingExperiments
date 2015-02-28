
float[] xCoords = new float[500];
float[] yCoords = new float[500];
float[] xCoordsSquare = new float[500];
float[] yCoordsSquare = new float[500];
float[] xMove = new float[500];
float[] yMove = new float[500];

void setup(){
  size(600,600);
  for(int i = 0; i <500; i++) {
    xCoords[i]= random(width);
     yCoords[i]= random(height);
      xMove[i]= random(-1,1);
       yMove[i]= random(-3,1);
       xCoordsSquare[i]= random(width);
       yCoordsSquare[i]= random(width);
  }
}
       

void draw(){
  fill(20,50,220,20);
  rect(0,0, width,height);
  fill(random(0,255),random(0,255),180,random(0,100));
  rect(110,110,390,390);
 fill(random(0,255),random(0,255),random(0,255),random(0,255));
  rect(200,200, 200,200);
  ellipse(300,300, 100,100);
  stroke(random(0,255),random(0,255),random(0,255));
 fill(random(0,255),random(0,255),random(0,255));
  for(int i = 0; i<500; i++) {
    stroke(random(0,255),random(0,255),random(0,255));
    ellipse(xCoords[i], yCoords[i],random(8,12),random(8,12));
    xCoords[i]+= xMove [i];
    yCoords[i]+= yMove [i];
   fill(random(0,255),random(0,255),random(0,255));
    stroke(random(50,255),random(0,255),random(60,200),50);

    line(xCoordsSquare[i], yCoordsSquare[i],random(40,560),random(40,560));
    xCoordsSquare[i]+= xMove [i];
    yCoordsSquare[i]+= yMove [i];
  }
}

