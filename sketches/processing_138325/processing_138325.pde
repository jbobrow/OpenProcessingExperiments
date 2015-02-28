
int cubeSize = 1;
int cubeColor = 1;
int colorLeft = color (255, 204, 51);
int colorRight = color (255, 153, 0);
int colorTop = color (255, 255, 102);
int colorBar = color (77, 77, 77);
int colorBack = color(100,100,100);
int colorWhite = color (255, 255, 255);
int colorGrey = color (100,100,100);
int colorOrange = color (250, 204, 41);
int colorBlue = color (51, 153, 255);
int colorRed = color (255,51,153);
int colorNone = color (255,255,255,0);
int left1 = -width/24;
int right1 = width/12;
int left2 = -width/24;
int right2 = width/12;

void setup(){
  size(750,750);
  background(77,77,77);
  noStroke();
  frameRate(30);
  color(RGB);
}

void draw(){
  
  if (mousePressed == true){
    
 //cube
     
  //left
  fill(colorLeft);
  quad(mouseX,mouseY+right2, //bottom right
       mouseX+left2,mouseY+right1, //bottom left
       mouseX+left2,mouseY+left1, // top left
       mouseX,mouseY); // top left
       
  //right
  fill(colorRight);
  quad(mouseX+right2,mouseY+right1, //bottom right
       mouseX,mouseY+right2, // bottom left
       mouseX,mouseY, // top left
       mouseX+right2,mouseY+left1); // top right
       
  //top
  fill(colorTop);
  quad(mouseX,mouseY, //bottom
       mouseX+left2,mouseY+left1, // left
       mouseX, mouseY+left2, // top
       mouseX+right2,mouseY+left1); // right
       
    if (cubeSize == 1){
      left1 = -width/24;
      left2 = -width/12;
      right1 = width/24;
      right2 = width/12;
      
     } //cubeSize = 1
     
    if (cubeSize == 2){
      left1 = -50;
      left2 = -100;
      right1 = 50;
      right2 = 100;
     } //cubeSize = 2
     
    if (cubeSize == 3){
      left1 = -75;
      left2 = -150;
      right1 = 75;
      right2 = 150;
     } //cubeSize = 3
     
     if(cubeColor == 1){
   colorLeft = color(255, 204, 51);
   colorRight = color(255, 153, 0);
   colorTop = color(255, 255, 102);
     }
     
     if(cubeColor == 2){
   colorLeft = color(51, 153, 255);
   colorRight = color(51, 51, 204);
   colorTop = color(153, 255, 255);
     }
         
     if(cubeColor == 3){
   colorLeft = color(255, 51, 153);
   colorRight = color(255, 0, 0);
   colorTop = color(255, 153, 255);
     }
     
  } // mouse pressed

    if (mouseX>0 && mouseY>0 && mousePressed == false){//save
    frameRate(30);
   }//save

    if (mouseY>675){ //button bar
    
    colorLeft = colorNone;
    colorRight = colorNone;
    colorTop = colorNone;
    
    if (mouseX>600 && mousePressed == true){//save
    frameRate(1);
    fill(colorBar);
    rect(0,675,750,75);
    saveDrawing();
   }//save

    if (mouseX<525 && mouseX>450 && mousePressed == true){//red
    cubeColor=3;
   }//red
  
    if (mouseX<450 && mouseX>375 && mousePressed == true){//blue
    cubeColor=2;
   }//blue
      
     if(mouseX<375 && mouseX>300 && mousePressed == true){//orange
     cubeColor=1;
     }//orange
  
      if (mouseX<300 && mouseX>225 && mousePressed == true){//large
    cubeSize=3;
   }//large
   
    if (mouseX<225 && mouseX>150 && mousePressed == true){//medium
    cubeSize=2;
   }//medium
      
     if(mouseX<150 && mouseX>75 && mousePressed == true){//small
     cubeSize=1;
     }//small
   
    }//button bar
    
  fill(colorBar); // bar
  rect(0,675, 750,75); // bar
    
    fill(colorBar);
    rect(0,0,75,750);
    rect(0,0,750,75);
    rect(675,0,75,750);
    
if(cubeSize == 1){
  fill(colorGrey); // small
  rect(90, 690, 50, 50); //small
  fill(colorWhite); // small
  rect(110, 710, 10, 10); //small
}else{
  fill(colorWhite); // small
  rect(110, 710, 10, 10); //small
}

  if(cubeSize == 2){
  fill(colorGrey);// medium
  rect(160, 690, 50, 50);// medium
  fill(colorWhite);// medium
  rect(177, 707, 15, 15);// medium
  }else{  
  fill(colorWhite);// medium
  rect(177, 707, 15, 15);// medium
  }
  
  if(cubeSize == 3){
  fill(colorGrey); // large
  rect(237, 690, 50, 50);//large
  fill(colorWhite); // large
  rect(252, 705, 20, 20);//large
  }else{
  fill(colorWhite); // large
  rect(252, 707, 20, 20);//large
  }
  
  if(cubeColor == 1){
  fill(colorGrey); // large
  rect(312, 690, 50, 50); //orange
  fill(colorOrange); // orange
  rect(325, 702, 25, 25); //orange
  }else{
  fill(colorOrange); // orange
  rect(325, 702, 25, 25); //orange
  }

if(cubeColor == 2){
  fill(colorGrey);// blue
  rect(387, 690, 50, 50);// blue
  fill(colorBlue);// blue
  rect(400, 702, 25, 25);// blue
}else{
  fill(colorBlue);// blue
  rect(400, 702, 25, 25);// blue
}
  
  if(cubeColor == 3){
  fill(colorGrey); // red
  rect(462, 690, 50, 50);//red
  fill(colorRed); // red
  rect(475, 702, 25, 25);//red
  }else{
  fill(colorRed); // red
  rect(475, 702, 25, 25);//red
  }
  
  textSize(25); //save
  fill(colorWhite);
  text("save", 600, 720); 
    
    
} //draw


function saveDrawing(){
  saveFrame("images/hypercubes-###.png");
}



