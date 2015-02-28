
//Sketch by Miles Thomas
//September 28, 2011
//Bauhaus Split Between Mies van der Rohe & Adolf Meyer

//number of faces for array
int faces = 20;

//sets up x & y variable for faces
float[] x = new float[faces];
float[] y = new float[faces];

//sets up future variable for speed
float[] fly = new float[faces];

//sets up variable for tint
color[] tintImage = new color[faces];


//sets up variable for images
PImage meyer;
PImage mies;

void setup(){
  size(300,300);
  smooth();
  
  //load images in drawing
  meyer = loadImage("meyer.jpg");
  mies = loadImage("mies.jpg");
  
  
for (int a=0; a < faces; a++){
  x[a] = random(width);
  y[a] = a * (height/faces);
  fly[a] = random(1,6);
  tintImage[a] = color(int(random(1,255)),random(1,255),random(1,255));  
}

}

void draw(){
  background(0);
  
  
  for (int a=0; a < faces; a++){
    
    //centered origin
    pushMatrix();
    translate(width/2,0);
    
    tint(tintImage[a]);
    
    //meyer moves left from origin because of -x variable
    image(meyer, -x[a], y[a]);
    //mies moves right from origin
    image(mies, x[a], y[a]);
    
    popMatrix();
    
    
    x[a] = x[a] + fly[a];
    if (x[a] > width + 50){
      x[a] = -5;
    }
  }
}

void mousePressed() {//when mouse is pressed the sketch redraws
  if (mousePressed == true) {//when mouse is pressed setup is reset to draw over sketch
    setup();
  }
}

