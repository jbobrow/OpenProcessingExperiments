
//int steps = 100;
float i = 0;
color A;
float[] y = new float[10];
PFont fontA;

void setup() {

  size(1000, 500);
  frameRate(25);
  colorMode(HSB, 360,360,360);
  y[0] = height/2;
  y[1] = 1;
  y[2] = height - 11;
  y[3] = height - 11;
  fontA = loadFont("Univers-66.vlw");
  textFont(fontA, 15);
  smooth();
  textAlign(CENTER);
}

void draw() {
background(0);
  //i = i + 1;
  
  i = map(y[1],0,height-13,0,360);
  
  A = color(i,map(y[2],0,height-13,0,360),map(y[3],0,height-13,0,360));

  if(i>360) {
    i = 0;
  }

  
   
  int how_many = int(map(y[0],0,height-13,1,11));
   
  for (int j = 0; j<=how_many ; j++){
  noStroke();
  fill(complymentary(A,how_many,j));
  rect(j*width/how_many,0,width/how_many+1,height);
  fill(0,0,180);
  text(int(hue(complymentary(A,how_many,j))) +
       "," + int(saturation(complymentary(A,how_many,j))) +
       "," + int(brightness(complymentary(A,how_many,j)))    
             ,j*width/how_many+(width/how_many+1)/2,height - 100);
  }

  
  cursors ();

}

void cursors (){
  
  fill(0,0,180);
 stroke(0,0,180);
  for( int i = 0; i <=3 ; i++){
    line(i*20+5,0,i*20+5,height);
    rect(i*20,y[i],10,10);
    
    if(mousePressed == true & dist(mouseX,0,i*20,0)<10 & mouseY<height - 11 & mouseY>0){y[i] = mouseY;}
    
  }
  
}

color complymentary(color A, float all, int one) {

  float h = hue(A);
  float s = saturation(A); 
  float b = brightness(A);
  float angle = 360/all*one;
  
  h = h + angle;
  
  if (h> 360) {h = h - 360;}

  return(color(h,s,b));
}


