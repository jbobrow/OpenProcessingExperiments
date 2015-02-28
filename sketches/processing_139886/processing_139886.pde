
//processing monster program written by Norma Garcia
//when the mouse is clicked the background changes
//when the mouse is dragged across the canvas the eyes and mouth move slightly
int x=0;
void setup() {
size(600,400); //sets size of window
}
void draw() {
  if(mousePressed)
  background(random(255),random(255),random(255)); //assigns a random background color when the mouse is pressed
  else 
  background(18,71,113); //sets background color
  monster(); //calls the monster
  
}
void monster() {
  int monsterSize = 100; //defines the variable that controls the size of the monster

 //monster arms
 fill(64,255,155);
 rect(width/2+45,height/2,22,4);
 rect(width/2-70,height/2,20,4);
 rect(width/4-5,height/3-20,22,4);
 rect(width/4+120,height/3+100,20,4);

//monster tail
 strokeWeight(2); //line thickness
 fill(240,200,126);
 triangle(190,80,60,5,20,10);

//monster body
  fill(64,255,155); //monster color
  ellipse(width/2.8,height/3.7,monsterSize,monsterSize);
  ellipse(width/2.3,height/3,monsterSize,monsterSize);
  ellipse(width/2,height/2.4,monsterSize,monsterSize);
  ellipse(width/2,height/2,monsterSize,monsterSize);
  
 //monster eyes
 fill(0);
  if (mouseX>width/2) { //changes eye size
    ellipse(width/2-20,height/2,12,12);
    ellipse(width/2+20,height/2,12,12);
  }
  else {
    ellipse(width/2-20,height/2,10,10);
    ellipse(width/2+20,height/2,10,10);
 

}

//monster mouth
fill(255,106,64);
  if (mouseX>height/3) {
   ellipse(width/2,height/2+35,20,25);//changes size of mouth
  }
  else {
    ellipse(width/2,height/2+35,15,25);
  }
//monster horns
  fill(217,127,252);
  strokeWeight(1);
  ellipse(width/2-25,height/2-50,8,25);
  ellipse(width/2+25,height/2-50,8,25);
}

  


