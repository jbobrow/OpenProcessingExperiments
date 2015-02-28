
//Naomi Rauch
//February 20, 2014 
//CS 118
//Process Blog: Interaction


//Define Global Variables
float x = 300; //put variable for x-coordinate for center of face
float y = 200; //put variable for y-coordinate for center of face
float fx1 = 300; //starting x coordinate for ball
float fy1 = 300; //starting y coordinate for ball
float speed = 10.0; //speed of ball animation
PFont font; //for font in text box pg 85 in text

void setup(){
  size(600,600);
  background(0);
  font = loadFont("ArialNarrow-Italic-48.vlw"); //uploaded font!
  textFont(font);
  stroke (1);
  smooth();
  frameRate(30);
}

void draw(){
  background(0);
  textSize(18);
  text("1.Move face to center!", 20, 20,600,100); //write directions for interaction on screen
  text("2. Use mouse to make the face follow the Yellow Ball!", 20, 40,500,100);
  text("3. *Right Click* and *Left Click*", 20, 60,500,100);
  text("4. Press the down arrow key.", 20, 80,500,100);
  
  x = mouseX;//set coordinates of middle of face to mouse position
  y = mouseY;

      float mx = map(mouseX,0,width,-width*.1,width*.1);//makes face details move on x axis to look like head turns
      float emx = map(mouseX,0,width,-width*.11,width*.11);//makes eyeballs turn on x axis to "look"
      float my = map(mouseY,0,height,-height*.06,height*.06);//makes face details move of y axis
      float emy = map(mouseY,0,width,-width*.07,width*.07);//makes eyeballs turn on y axis
       
       //yellow ball
       fill(255,255,0);
       if (fx1>= width/2 && fx1 <=width-20 && y>=height/2){ //diagonal to bottom
          ellipse(fx1,fy1,20,20); //fly shape
          fx1+=speed;
          fy1+=speed; 
       } else if (fx1>= width-20 && fy1>=20){//up right side
           ellipse(fx1,fy1,20,20); //fly shape
           fy1 -= speed;    
       } else if (fy1 <= 50 ){
           ellipse(fx1,fy1,20,20); //fly shape
           fx1 -= speed;
       }
        
    //draws face
      fill(239,228,176);
      ellipse(x,y,200,200); //head
      fill(0);
      ellipse(x+mx,y+my,25,25); //nose
      fill(255);
      ellipse((x+mx-25),y+my-50,20,20); //right eye
      ellipse((x+mx+25),y+my-50,20,20); //left eye
      fill(0);
      ellipse((x+emx-25),y+emy-50,12,12); //right eyeball
      ellipse((x+emx+25),y+emy-50,12,12); //left eyeball
      noFill();
      arc(x+mx,y+my,125,125,radians(60), radians(120)); //mouth
      fill(239,228,176);
      if (x+mx-100 >= 150){ //makes right ear disappear as head is turned
   
      arc((x+mx-100),y+my,20,20,radians(60), radians(300)); //right ear
      }
      if (x+mx+100 <= 440){
      arc((x+mx+100),y+my,20,20,radians(240), radians(460)); //left ear
      }
      
      //draws right wink if right button pressed
      if (mouseButton == RIGHT) { 
      fill(239,228,176);
      ellipse(x,y,200,200); //head
      fill(0);
      ellipse(x+mx,y+my,25,25); //nose
      fill(255);
      ellipse((x+mx-25),y+my-50,20,2); //right eye
      ellipse((x+mx+25),y+my-50,20,20); //left eye
      fill(0);
      ellipse((x+emx-25),y+emy-50,12,1); //right eyeball
      ellipse((x+emx+25),y+emy-50,12,12); //left eyeball
      noFill();
      arc(x+mx,y+my,125,125,radians(60), radians(120)); //mouth
      fill(239,228,176);
      if (x+mx-100 >= 150){ //makes right ear disappear as head is turned
   
      arc((x+mx-100),y+my,20,20,radians(60), radians(300)); //right ear
      }
      if (x+mx+100 <= 440){
      arc((x+mx+100),y+my,20,20,radians(240), radians(460)); //left ear
      }
  
      }
      //draws left wink if left button pressed
      if (mouseButton == LEFT) { 
      fill(239,228,176);
      ellipse(x,y,200,200); //head
      fill(0);
      ellipse(x+mx,y+my,25,25); //nose
      fill(255);
      ellipse((x+mx-25),y+my-50,20,20); //right eye
      ellipse((x+mx+25),y+my-50,20,2); //left eye
      fill(0);
      ellipse((x+emx-25),y+emy-50,12,12); //right eyeball
      ellipse((x+emx+25),y+emy-50,12,1); //left eyeball
      noFill();
      arc(x+mx,y+my,125,125,radians(60), radians(120)); //mouth
      fill(239,228,176);
      if (x+mx-100 >= 150){ //makes right ear disappear as head is turned
   
      arc((x+mx-100),y+my,20,20,radians(60), radians(300)); //right ear
      }
      if (x+mx+100 <= 440){
      arc((x+mx+100),y+my,20,20,radians(240), radians(460)); //left ear
      }
  
      }
      
      //draws "O" face if down arrow pressed
      if (keyPressed && (key == CODED)) { 
        if (keyCode==DOWN){
      fill(239,228,176);
      ellipse(x,y,200,200); //head
      fill(0);
      ellipse(x+mx,y+my,25,25); //nose
      fill(255);
      ellipse((x+mx-25),y+my-50,20,20); //right eye
      ellipse((x+mx+25),y+my-50,20,20); //left eye
      fill(0);
      ellipse((x+emx-25),y+emy-50,12,12); //right eyeball
      ellipse((x+emx+25),y+emy-50,12,12); //left eyeball
      fill(0);
      ellipse(x+mx,y+50+my,40,50); //mouth
      fill(239,228,176);
      if (x+mx-100 >= 150){ //makes right ear disappear as head is turned
   
      arc((x+mx-100),y+my,20,20,radians(60), radians(300)); //right ear
      }
      if (x+mx+100 <= 440){
      arc((x+mx+100),y+my,20,20,radians(240), radians(460)); //left ear
      }
        }
      }
      
   
    
        
      
  
  
  //draw happy face
  /*
  noFill();
  ellipse(x,y,200,200); //head
  ellipse(x,y,25,25); //nose
  fill(255);
  ellipse(x-25,y-50,20,20); //right eye
  ellipse(x+25,y-50,20,20); //left eye
  fill(0);
  ellipse(x-25,y-50,12,12); //right eyeball
  ellipse(x+25,y-50,12,12); //left eyeball
  noFill();
  arc(x,y,125,125,radians(50), radians(130)); //mouth
  fill(255);
  arc(x-100,y,20,20,radians(60), radians(300)); //right ear
  arc(x+100,y,20,20,radians(240), radians(460)); //left ear
  */
 
  


}


