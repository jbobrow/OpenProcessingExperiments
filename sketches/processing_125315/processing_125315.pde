
int greenyX;
int greenyY;
 
int richting; 
int teller = 0; 

boolean test = true;
 
void setup(){
  size(500,500);
  greenyX = 250;
  greenyY = 250;
  richting = 10;
}
 
void draw(){
  background(255,255,255);
  for(float w = width;w > 0;w = w-=20){
    stroke(0);
    fill(142,11,42);
    ellipse(width/2,height/2,w,w);
  }
  
  
  /*head*/
  stroke(0);
  if(test == true){
    fill(30,155,188);
  }
  
  if(test == false){
    fill(131,227,245);
  }
  ellipseMode(CENTER);
  ellipse(greenyX,greenyY,140,150);
  /*eyes*/
  fill(255);
  ellipse(greenyX,greenyY-30,45, 60);
  fill(0);
  ellipse(greenyX,greenyY-20,30,40);
  /*mouth*/
  fill(0);
  ellipse(greenyX,greenyY+40,20,30);
  /*body*/
  if(test == true){
    fill(30,155,188);
  }
  if(test == false){
    fill(131,227,245);
  }
  ellipse(greenyX-25,greenyY+60,50,60);
  if(test == true){
    fill(30,155,188);
  }
  if(test == false){
    fill(131,227,245);
  }
  ellipse(greenyX+25,greenyY+60,50,60);
 
 
  /*up and down*/
  greenyY = greenyY +richting;
   
  if(greenyY > 500 || greenyY < 0){
    richting= -richting;
    teller = teller + 1;
  }
  /*left and right*/
  greenyX = mouseX;
   
  /*repeat*/
  if(greenyY==-30) {
    greenyY=530;
  }
  
  if(teller ==10){
    teller = 0;
    test = !test;
  }
  
  println(greenyX);
  println(teller);
  println(test);
}

