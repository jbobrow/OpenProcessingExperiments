
float r=255; //early code for the color change.
  float g=255;
  float b=255;

  void setup(){
  size(800,800);
  frameRate(100); //for the drawing too

 }


  void draw() {
  
  background(0); //to make sure that the background refreshes along with the rectangles for the draw tool.
  r-=0.5;
  g-=0.5;
  b-=0.5;
   
  if(r<2){
    r=b;
  }
   
  if(g<2){
    g=r; //I have no idea what this will do...
  }
   
  if(b<2){
    b=255;
  }//should initiate a color change after a few moments. Still trying to figure out how exactly to make them change independently of each other.
  
  
  
  noStroke();
  fill(r,g,b);
  rect(0,0,200,100); //top corner
  rect(210,0,400,100); //second from the top right
  rect(0,110,100,200); //second from the right down

  fill(r,5,5);
  rect(110,110,500,500); //large square

  fill(0,0,0);
  rect(120,620,200,200); //square below large

  fill(255);
  rect(110,830,190,190);


  fill(255,g,255);
  rect(330,620,280,100); //square below that
  rect(330,730,280,100); //square below that

  fill(255);
  rect(320,950,690,50);

  rect(0,320,100,300); //third from the right down


  fill(232,222,b);
  rect(0,630,100,370); //fourth from the right down
  rect(620,0,300,100); // third from the top right
  rect(620,110,300,200); //one below third from top right

  fill(b,255,255);
  rect(620,320,140,300);
  rect(770,320,150,300);

  fill(255);
  rect(620,630,300,100);

  fill(5,5,b);
  rect(620,740,300,250);

  fill(255);
  rect(930,0,70,600); // fourth from the top right

  fill(r,5,5);
  rect(930,610,70,400); // second down right

  stroke(255);
  strokeWeight(20);
  smooth(); //early code for the line drawing tool


  if (mousePressed){
  line(pmouseX,pmouseY,mouseX,mouseY);//tried to do ellipse, but it kept doing weird resizing things.
  } 



}
