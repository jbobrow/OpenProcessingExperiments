
PImage trees;
PImage leaf;
PImage Falling;
PImage img;
int smallPoint = 2;
int largePoint;
int top, left;

int num = 2000;
int range = 50;


float[] ax = new float[num];
float[] ay = new float[num]; 




void setup(){ 

  size(1100,900);
    trees = loadImage("14265_169710671667_667776667_2741305_1600136_n.jpg");
   
    leaf = loadImage("n667776667_981833_3617-1.jpg");
     int smallPoint = 2;
     int largePoint;
     int top, left;

 size(1100, 900);
  for(int i = 0; i < num; i++) {
    ax[i] = width/.5;
    ay[i] = height/2;
  }
  frameRate(5000);
}
void draw(){
  
stroke(15,15,21,100);
strokeWeight(5);
line(200,1,200,mouseX);
stroke(15,15,21,mouseY);
strokeWeight(5);
line(210,mouseY,210,900); 
stroke(24,28,33,100);
strokeWeight(7);
line(380,mouseX,380,900);

stroke(72,27,27,mouseX);
strokeWeight(7);
line(495,mouseX,495,560);
stroke(9,27,49,140);
strokeWeight(5);
line(535,mouseX,540,530);
stroke(72,27,27,150);
strokeWeight(4);
line(565,mouseX,570,505);

stroke(mouseX,54,30,mouseX);
strokeWeight(10);
line(1000,mouseX,1000,900);

stroke(64,30,14,160);
strokeWeight(4);
line(545,mouseY,550,516);

stroke(64,30,14,100);
strokeWeight(4);
line(560,mouseY,560,510);

stroke(201,51,51,120);
strokeWeight(4);
line(575,mouseX,582,500);

stroke(88,11,16,170);
strokeWeight(4);
line(590,mouseY,598,498);

  tint(mouseX,300,200,70);
//image(trees,mouseX,mouseY,367,300);
   tint(mouseX,mouseY,150,50);
  image(leaf,0,mouseY,1100,900);
   tint(mouseY,300,200,70);
//image(trees,mouseY,mouseX,367,300);
 size(1100,900);
  img = loadImage("n667776667_981833_3617-1.jpg");
  //img = loadImage("sunflower.jpg");  // an alternative image
  noStroke();
  //background(255);
  smooth();
  largePoint = min(width, height) / 10;
 // center the image on the screen
  //left = (width - img.width) / 2;
  //top = (height - img.height) / 2;
  float pointillize = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 80);
  ellipse(left + x, top + y, pointillize, pointillize);
  // Shift all elements 1 place to the left
  for(int i = 1; i < num; i++) {
    ax[i-1] = ax[i];
    ay[i-1] = ay[i];
  }

  // Put a new value at the end of the array
  ax[num-1] += random(-range, range);
  ay[num-1] += random(-range, range);

  // Constrain all points to the screen
  ax[num-1] = constrain(ax[num-1], 0, width);
  ay[num-1] = constrain(ay[num-1], 0, height);
  
  // Draw a line connecting the points
  for(int i=1; i<num; i++) {    
    float val = float(i)/num * 204.0 + 51;
    stroke(val);
    color(250,210,167);
    strokeWeight(1);
    line(ax[i-1], ay[i-1], ax[i], ay[i]);
  }
  

stroke(64,30,14,mouseX);
strokeWeight(10);
line(250,1,250,mouseX);
stroke(64,30,14,mouseX);
strokeWeight(15);
line(150,1,150,mouseX);
stroke(225,26,30,mouseY);
strokeWeight(12);
line(120,1,120,mouseY);

stroke(15,15,21,mouseY);
strokeWeight(5);
line(220,1,200,mouseY);
stroke(64,30,14,mouseX);
strokeWeight(7);
line(270,1,250,mouseX);
stroke(64,30,14,mouseX);
strokeWeight(7);
line(170,1,150,mouseX);
stroke(255,26,30,mouseY);
strokeWeight(9);
line(140,1,120,mouseY);

stroke(15,15,21,mouseY);
strokeWeight(5);
line(280,mouseY,280,900); 
stroke(64,30,14,mouseX);
strokeWeight(7);
line(320,mouseX,320,900);
stroke(15,15,21,mouseY);
strokeWeight(5);
line(280,mouseY,300,900);
stroke(mouseX,54,30,mouseX);
strokeWeight(10);
line(320,mouseX,340,900);
stroke(15,15,21,mouseY);
strokeWeight(5);
line(280,mouseY,280,900); 
stroke(188,54,30,mouseX);
strokeWeight(7);
line(320,mouseX,320,900);
stroke(15,15,21,mouseY);
strokeWeight(5);
line(280,mouseY,300,900);
stroke(64,30,14,mouseX);
strokeWeight(7);
line(320,mouseX,340,900);

stroke(15,15,21,mouseY);
strokeWeight(5);
line(210,mouseY,180,900);
stroke(64,30,14,mouseX);
strokeWeight(7);
line(380,mouseX,360,900);


stroke(64,30,14,mouseX);
strokeWeight(7);
line(300,mouseX,300,800);

stroke(64,30,14,mouseX);
strokeWeight(7);
line(400,mouseX,400,750);

stroke(64,30,14,mouseX);
strokeWeight(7);
line(440,mouseX,440,680);

stroke(64,30,14,mouseY);
strokeWeight(7);
line(460,mouseY,460,600);

stroke(64,30,14,mouseX);
strokeWeight(7);
line(475,mouseX,475,580);


stroke(64,30,14,mouseX);
strokeWeight(7);
line(512,mouseX,515,544);


stroke(64,30,14,mouseY);
strokeWeight(7);
line(960,mouseY,960,900);



stroke(64,30,60,150);
strokeWeight(6);
line(900,mouseX,900,750);
}



