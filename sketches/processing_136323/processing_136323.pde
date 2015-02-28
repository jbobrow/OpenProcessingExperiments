
int cubeSize = 1;


void setup(){
  size(600,600);
  background(#FF0000);
  noStroke();
  frameRate(10);
}

void draw(){
  
  if (mousePressed == true){
    
      if (cubeSize == 1){
   //small top
  fill(#99FFFF);
  quad(mouseX,mouseY, //bottom
       mouseX-50,mouseY-25, // left
       mouseX+0,mouseY-50, // top
       mouseX+50,mouseY-25); // right
  //small left
  fill(#3399FF);
  quad(mouseX+0,mouseY+50, //bottom right
       mouseX+-50,mouseY+25, //bottom left
       mouseX-50,mouseY-25, // top left
       mouseX,mouseY); // top left
  //small right
  fill(#3333CC);
  quad(mouseX+50,mouseY+25, //bottom right
       mouseX+0,mouseY+50, // bottom left
       mouseX,mouseY, // top left
       mouseX+50,mouseY-25); // top right
        }//cubeSize =1
    
 //medium left
 if (cubeSize == 2){
     fill(#FFCC33);
  quad(mouseX+0,mouseY+100, //bottom right
       mouseX+-100,mouseY+50, //bottom left
       mouseX-100,mouseY-50, // top left
       mouseX,mouseY); // top left
  //medium right
  fill(#FF9900);
  quad(mouseX+100,mouseY+50, //bottom right
       mouseX+0,mouseY+100, // bottom left
       mouseX,mouseY, // top left
       mouseX+100,mouseY-50); // top right
  //medium top
  fill(#FFFF66);
  quad(mouseX,mouseY, //bottom
       mouseX-100,mouseY-50, // left
       mouseX+0,mouseY-100, // top
       mouseX+100,mouseY-50); // right
     } //cubeSize = 2
     
      if (cubeSize == 3){
     fill(#ff3399);
     //big left
  quad(mouseX+0,mouseY+150, //bottom right
       mouseX-150,mouseY+75, //bottom left
       mouseX-150,mouseY-75, // top left
       mouseX,mouseY); // top left
  //big right
  fill(#ff0000);
  quad(mouseX+150,mouseY+75, //bottom right
       mouseX+0,mouseY+150, // bottom left
       mouseX,mouseY, // top left
       mouseX+150,mouseY-75); // top right
  //big top
  fill(#ff99ff);
  quad(mouseX,mouseY, //bottom
       mouseX-150,mouseY-75, // left
       mouseX+0,mouseY-150, // top
       mouseX+150,mouseY-75); // right
     } //cubeSize = 3
     
     
    } //mouse pressed
    
    
    if (mouseY>525){ //button bar
  
  
      if (mouseX<225){//orange
    cubeSize=3;
   }//orange
  
    if (mouseX<150){//orange
    cubeSize=2;
   }//orange
      
     if(mouseX<75){//blue
     cubeSize=1;
     }//blue
   
    }//button bar
    
  fill(#4d4d4d); // bar
  rect(0,525, 600,75); // bar
    
  fill(#3399FF); // blue
  rect(25, 550, 25, 25); //blue
    
  fill(#FFCC33);// orange
  rect(100, 550, 25, 25);// orange
  
  fill(#ff3399); // red
  rect(175, 550, 25, 25);//red
    
} //draw


