
Circle[] circles;  
PImage letterK;


int n = 10;
float angle = 0;
float rad = 0;
float[] xTop = new float [n];
float [] xBottom = new float [n];
//Object shape1;


void setup(){
  size(600,600);
  background(0,162,78);
  smooth();
  angle = 0;
  circles = new Circle[1000];
  for(int i=0; i< circles.length; i++){
    circles[i] = new Circle(random(width), random(height), i);
    
  letterK = loadImage("Letter_K.gif");

  // shape1 = new Object(10,20);
  }
  

}

void draw(){
    for(int i = 0; i < circles.length; i++){
  circles[i].moveC();
  circles[i].collision();
  circles[i].display();
  }
  
  pushMatrix();
    noStroke();
    translate(-300,-300);
    fill(255,255,255, 2);
    rect(300,300,600,600);
  popMatrix();
  
  pushMatrix();
    translate(300,300);
    rotate(radians(frameCount));
    myShape(0,0);
  popMatrix();
  
  if (mousePressed){
    pushMatrix();
    translate(300,300);
    rotate(radians(frameCount/2));
    largeShape(0,0);
   popMatrix();
   }

//TOP button
  noStroke();
  fill(247,0,124,90);
  rect(0,0,600,21);
    if(mouseX > 0 && mouseX < 600 && mouseY > 0 && mouseY < 21){
            if(mousePressed){
                   colorMode(RGB,100);
            } else { 
                   colorMode(HSB,255);
                    }
            } else { 
                   colorMode(RGB,255);
                    }
               
               
//RIGHT button
  noStroke();
  fill(163,35,125,90);
  rect(579,0,21,600);
    if(mouseX > 579 && mouseX < 600 && mouseY > 0 && mouseY < 600){
            if(mousePressed){
                float x = 200*cos(radians(angle));
                float y = 200*sin(radians(angle));
                ellipse(x+width/2,y+height/2,20,20);
                angle--;
              
                  } else { 
                    float x = 150*cos(radians(angle));
                    float y = 149*sin(radians(angle));
                    ellipse(x+width/2,y+height/2,20,20);
                    angle++;
                }
               }
               
               
//BOTTOM button
  noStroke();
  fill(83,38,112,90);
  rect(0,579,600,21);
    if(mouseX > 0 && mouseX < 600 && mouseY > 579 && mouseY < 600){
            if(mousePressed){
              //elements borrowed form "Manual Arrays" Linda tutorial
              stroke(245,235,19);
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,600);
                  xBottom[i] = random(0,600);
                  line (xTop[i], 0, xBottom[i],800);
              }  
                  } else { 
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,600);
                  xBottom[i] = random(0,600);
                  line (xTop[i], 0, xBottom[i],800);
                  
           //Frieze Pattern initials                
             for(int j = 0; j < 9; j++){
             pushMatrix();
             translate(j*210,578);
                 imageFlip(letterK,100,0,"v");
                 image(letterK,0,0);
             popMatrix();
          }              
                }
              }
              } else { 
                 fill(0, 80, 188);
                 ellipse(30,660,25,40);
               }

//LEFT button
  noStroke();
  fill(3,80,159,90);
  rect(0,0,21,600);
    if(mouseX > 0 && mouseX < 21 && mouseY > 0 && mouseY < 600){
            if(mousePressed){
              stroke(21,0,208);
              for(int i = 0; i < 8; i++){
                     
                   fill(3,80,random(255),90);
                   float x = rad*cos(radians(angle)); // This
                   float y = rad*sin(radians(angle)); // is the
                     angle+=137.5;                    // spiral
                     ellipse(x+300,y+300,50,50);      // ...how do I make it start over 
                     rad+=.5;                         // from the center at some point?
              }
                  } else { 
                   // display(0,0);// how do I make the circles collision happen only on mouse hover or click?
                      fill(21,0,208);
                      ellipse(30,660,25,40);       
                }
              } else {           
                 fill(0, 80, 188);
                 ellipse(30,660,25,40);
               }

//if(mouseReleased){
//
//
//
//}


//  bike1.moveB(); //move first
//  bike1.display();//display second


}

//
   void myShape(int x, int y){
   stroke(0,114,162);
   fill(0,162,78,70);
      beginShape();
      vertex(0,0);
      vertex(63,121);
      vertex(-31,93);
      vertex(-126,116);
      vertex(-69,42);
      vertex(-111,-40);
      vertex(0,0);
      endShape();
}


void smallShape(int x, int y){
   stroke(255);
      beginShape();
      vertex(0,0);
      vertex(-72,-26);
      vertex(-44,27);
      vertex(-82,75);
      vertex(-20,60);
      vertex(40,79);
      vertex(0,0);
      endShape();
}  
      

void largeShape(int x, int y){
   //  stroke(0, 120, random(255));
    stroke(random(255), 0, 120);
    fill(0,0,0,1);
      beginShape();
      vertex(0,0);
      vertex(-235,86);
      vertex(-148,87);
      vertex(-167,241);
      vertex(-68, 193);
      vertex(129,252);
      vertex(0,0);
      endShape();
}


///////////
class Circle{  //Bike is a made up name (bike shall be capitalized)
  float x,y,speedx,speedy;
  int id;
//constructor
  Circle(float _x, float _y, int _id){   
    x = _x;
    y = _y;
    id = _id;
    speedx = random(-1,1); //this makes the circles move randomly
    speedy = random(-1,1); //around the screen
//    speedx = 1; //these make the circles move together in an
//    speedy = 1; //army diagonally from top left to bottom right
  }
  //methods
  void moveC(){ //moveB is a made up name
    x+=speedx;
    y+=speedy;
  }
  
  void collision(){
    noFill();
    for(int i = 0; i < circles.length; i++){
      if(id !=i){
        if(dist(x,y,circles[i].x,circles[i].y) < 16){
          fill(0, random(255),random(255),2);
          //fill(0,118,109,2);
        }
      }
    }
  }
  
  void display(){  //display is a made up name
  
  //ellipse(x,y,35,35);
 // stroke(random(255), random,(255), random(255));
 noStroke();
 rect(x,y,15,15);
}
}







//// when I try to run this it said its lacking "}" but I can't figure out where//
    //class Object{
    //  int x,y,speedx,speedy;
    //  Object(int _x, int _y){  
    //    x = _x;
    //    y = _y;
    //    speedx = 1;
    //    speedy = 1;
    //}
    // void moveB(){
    //    x+=speedx;
    //    y+=speedy;
    // }
    // 
    //  void display(){ 
    //  
    //  ellipse(x,y,x,y);
    //  }                            
                                //void mousePressed(){
                                //    pushMatrix();
                                //      translate(300,300);
                                //      rotate(radians(frameCount));
                                //      largeShape(0,0);
                                //    popMatrix();
                                
                                //}
                                
                                
                                
                                
//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){

 //records original pixel config so it can set it back at the end
 imageName.loadPixels();
 int ogImage[] = new int[imageName.width*imageName.height];
 for(int i = 0; i < imageName.width*imageName.height; i++){
   ogImage[i] = imageName.pixels[i];
 }
 imageName.updatePixels();

 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }

   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }

 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}







