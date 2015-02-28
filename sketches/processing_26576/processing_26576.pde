

//BURNER by Tian Wang z3330180//

/*
Instructions:
-Move mouse to push humans around the screen
-Hold any mouse button to cook
-Press space to reset and reseed screen
*/

Human[] humans = new Human[800]; 
//humans array declaration
//Human[x] where x = number of humans to be spawned on screen

void setup(){
  size(640, 480);
  
  for (int i = 0; i<humans.length; i++){
    humans[i] = new Human(random(0, width+50), random(0, height), random(1,2));//hX, hY, hXSpeed
  }/*new human loop for humans array max length, "i" increases 
   every frame until it hits max humans array length*/

  //smooth(); //turned off because it lags the game
  
} //END OF SETUP() FUNCTION

void draw(){
 background(80);
 for (int i = 0; i<humans.length; i++){
   humans[i].update();
   humans[i].display();
 } 
 /*each human will play the update and display function 
 within the array of humans. Reference to 'Arrays of Objects' section of 'Getting Started with Processing'*/
 
 if (keyPressed){
   if ((key==' ')) //when spacebar is pressed
   {
     setup(); //restarts the program, reseeds the humans
   }
 }
} //END OF DRAW() FUNCTION

class Human{
  
  //colour vars
  float redCol; //red colour value for skinCol
  float greenCol; //green colour value for skinCol
  float blueCol; //blue colour value for skinCol
  color skinCol; //human skin colour
  
  //location vars
  float hX; //x coordinate of human
  float hY; //y coordinate of human
  float hXSpeed; //x speed variable
  float hYSpeed; //y speed variable
  
  //mouse vars
  int pushDist; 
  float pushSpeed; 
  int cookDist;
  float cookStrength; 
  /*cookStrength is a multiplyer 
  (e.g 2 = 2x the original cooking power)*/
  
  Human(float temphX, float temphY, float temphXSpeed){
    
    /*temp vars used to pass in values from external. 
    Refer to pg133 of 'Getting Started with Processing' textbook */
    hX = temphX; 
    hY = temphY;
    hXSpeed = temphXSpeed;
    
    //colours
    redCol = 255;
    greenCol = 182;
    blueCol = 167;
    skinCol = color(redCol, greenCol, blueCol);
    
    //mouse
    pushDist = 40;
    pushSpeed = 5;
    cookDist = 50;
    cookStrength = 4; 
   
  }
  
  void update(){
    
   float hYSpeed = random(-1, 1); //random vertical jittering
   
   hX += hXSpeed; //initial x speed
   hY += hYSpeed; //initialy y speed
 
   if (mouseX > hX - pushDist && mouseX < hX && mouseY<hY + pushDist && mouseY>hY-pushDist && mousePressed == false){
     //println("pushing");
     hX += pushSpeed;
   } //push left horizontal segment
   
   if (mouseX > hX && mouseX < hX +pushDist && mouseY<hY+pushDist && mouseY>hY-pushDist && mousePressed == false){
     // println("pushing");
     hX -= pushSpeed; 
   } //push right horizontal segment
   
   if (mouseX > hX - pushDist && mouseX < hX +pushDist && mouseY<hY && mouseY>hY-pushDist && mousePressed == false){
     //println("pushing");
     hY += pushSpeed; 
   } //push lower vertical segment
   
   if (mouseX > hX - pushDist && mouseX < hX +pushDist && mouseY<hY+pushDist && mouseY>hY && mousePressed == false){
     //println("pushing");
     hY -= pushSpeed; 
   } //push upper vertical segment
   
   if (mouseX > hX - cookDist && mouseX < hX +cookDist && mouseY<hY+cookDist && mouseY>hY-cookDist && mousePressed == true){
     //println("SHAKING");
     
     hXSpeed -= map(redCol, 255, 0, 0, 0.07); 
     /*the longer you cook them, the slower and weaker they become, 
     relative to the red colour value of their bodies*/
 
     hX += random(-7, 7); //vibrate horizontally
     hY += random(-7, 7); //vibrate vertically
     redCol -= 1.025 * cookStrength; //col change
     greenCol -= 2.275 * cookStrength;//col change
     blueCol -= 2.0875 * cookStrength;//col change
     skinCol = color(redCol, greenCol, blueCol); //update new skinCol
     
     //humans[800] += 10;
     //humans[801]=new Human(random(0, width+50), random(0, height), random(1,2));
     //humans[801].update();
     //humans[801].display();
     //ABOVE: just some experimenting to try and understand arrays more. please ignore. 
  }
   
   
   
   if (hXSpeed < 0){
     hXSpeed = 0;
   } //set minimum speed of human to 0 so they won't move backwards
   
   if (redCol <0){
     redCol =0;
   } //set minimum redcol to 0 for better optimisation
   
   /*if (redCol <= 100){
     hXSpeed = 0;
   }
   
   if (redCol < 255 && redCol > 200){
     hXSpeed = random(2, 3);
   }
   
   if (redCol <= 200 && redCol >100){
     hXSpeed = random(0.5, 1);
   } */
   //ABOVE: conditions no longer needed after implementing redCol mapping for hXSpeed
   
   if (hX - 20 > width){
     hX = -20;
   } //teleports human back to beginning x of screen after its body exceeds width max
 
   if (hY + 10> height){
     hY -= 1;
   } //vertical border boundaries
   
   if (hY - 10 < 0){
     hY += 1;
   } //vertical border boundaries
 }
 
  void display (){
    pushMatrix();
    
    //scale(hScale);
    //rotate(hRotate);
    //ABOVE: unused
    
    //body
    fill(skinCol);
    ellipse(hX, hY, 30, 40);
    
    //head
    fill(skinCol);
    ellipse(hX, hY - 25, 20, 20);
    
    //face
    ellipse(hX + 5, hY - 25, 2, 2); //right eye
    ellipse(hX - 5, hY - 25, 2, 2); //left eye
    
    //arms
    line(hX + 14, hY - 10, hX + 25, hY - 15); //right arm
    line(hX - 14, hY - 10, hX - 25, hY - 15); //left arm
    
    //legs
    line(hX + 7, hY + 20, hX + 15, hY +40);//right leg
    line(hX - 7, hY + 20, hX - 15, hY +40);//left leg
    
    popMatrix();
  }
}//END OF HUMAN CLASS


