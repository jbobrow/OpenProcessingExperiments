
int popX,popY,popDiam=150;
int shootspeed = 0;

void setup(){
  size(500,500);
  background(0);
  //noFill();
  
  
}

void draw(){
  background(0);
  fill(0,255,0);
  stroke(0,255,0);
  popX=(mouseX-250);
  //popY=mouseY;
 
 //making the ship shoot

if (keyPressed == true){
  rect(mouseX-8,(shootspeed),2,350);
 
}


stroke(255);
fill(255);
//stars
rect(10,10,1,1);
rect(14,92,1,1);
rect(490,55,1,1);
rect(75,490,1,1);
rect(250,400,1,1);
rect(75,75,1,1);
rect(400,100,1,1);
rect(439,422,1,1);
rect(445,250,1,1);
rect(380,430,1,1);
rect(122,275,1,1);
  
 // rect(popX,400,100,100);
 fill(255);
 stroke(255);
  rect(popX+240,240,6,30); //nose
  rect(popX+233,270,20,60);  //big nose
  rect(popX+223,330,40,70);  //body
  rect(popX+203,360,80,20);  //wing
  rect(popX+193,370,100,10);  //wing
  rect(popX+183,380,120,10);  //wing
  rect(popX+240,400,6,15);  //tail
  
  //cannons
rect(popX+203,330,6,30);
  //left cannon
rect(popX+277,330,6,30);
  //right cannon
rect(popX+183,350,6,30);
  //left lower cannon
rect(popX+297,350,6,30);
  //lower right cannon    
  fill(255,10,10);
  stroke(255,10,10);
    
    rect(popX+277,310,6,20);
    rect(popX+203,310,6,20);
      //r and l cannon tip
    
    rect(popX+183,330,6,20);
    rect(popX+297,330,6,20);
      //r and l lower cannon tip

//boosters
rect(popX+223,391,10,20);  //left
rect(popX+253,391,10,20);  //right
rect(popX+228,386,5,5);
rect(popX+253,386,5,5);

//window
rect(popX+239,350,8,15);  //middle
rect(popX+231,357,8,15);  //left
rect(popX+247,357,8,15);  //right

fill(50,50,230);  //blue
stroke(50,50,230);

rect(popX+203,360,6,9); //top left blue
rect(popX+277,360,6,9); //top right blue

rect(popX+193,370,6,9); //lower left blue
rect(popX+287,370,6,9); //lower right blue




}






