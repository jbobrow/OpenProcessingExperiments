

PImage[] myImage;    // PImage is used to store an image in memory
float scaleOfImage;  // current scale of the image
PImage bgImage;      // display window image
int selectedImageNum;

int scanLine;  // vertical position

float m;

void setup(){
  size(800,600);
  textSize(25);
  
  //allocate a new array with space for 4 images
  myImage = new PImage[4];
  myImage[0] = loadImage("computadorachica.jpg");
  myImage[1] = loadImage("malecondelsaladoguayaquil.jpg");
  myImage[2] = loadImage("barrioportete.jpg");
  myImage[3] = loadImage("laguna.jpg");
  
  bgImage = createImage(width, height, RGB);
  
  scaleOfImage = 0.5;
  m=random(0,3);
  selectedImageNum=int(m);
}

void draw(){
  background(bgImage);
  
  pushMatrix();
  imageMode(CENTER);
  image(myImage[selectedImageNum], width/2, height/2);
  popMatrix();
  
  switch(selectedImageNum){
    case 0: text("I'm at home",0,height-10);
    break;
    case 1: text("I live in Guayaquil",0,height-10);
    break;
    case 2: text("I grew up at Portete's neighborhood",0,height-10);
    break;
    case 3: text("I hope to see Quilotoa's Lagoon",0,height-10);
    break;
  }
  
  
// increment scan line position every second frame 
  if (frameCount % 2 == 0) { 
    scanLine ++; 
  } 

  if (scanLine > height) { 
    scanLine = 0; 
  } 

  
// draw circles over where the "scanner" is currently reading pixel values 
  for (int i=0; i<20; i++) { 
    stroke(255, 0, 255); 
    noFill(); 
    ellipse(0 + 17 + i*35, scanLine, 5, 5 ); 
    
    stroke(0,255,255);
    rect(scanLine,0 + 17 + i*35,10,10);
  } 

  
}


void keyPressed(){
  if (key=='r'){
    //"I'm at home";
    selectedImageNum = 0;
  }  
  else if (key=='l'){
    //"I live in Guayaquil";
    selectedImageNum = 1;
  }
  else if (key=='g'){
    //"I grew up at Portete's neighborhood";
    selectedImageNum = 2;
  }
  else if (key=='i'){
    //"I hope to know Quilotoa's Lagoon";
    selectedImageNum = 3;
  }
  
}
  


