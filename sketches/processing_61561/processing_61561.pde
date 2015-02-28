
int totalCrystals = 2;
float [] xposition = new float [totalCrystals];
float [] yposition = new float [totalCrystals];
float xa  = 250;
float ya  = 200;
float xb  = 200;
float yb  = 300;
float xc  = 250;
float yc  = 450;
float xd  = 300;
float yd  = 300;
float crystalWidth;
float crystalHeight;
float crystalArea;
float crystalCenter;
float crystalOverall;
float shake = 5;
int rocks = 20;
float rockSize;
float [] XrockPosition = new float [rocks];
float [] YrockPosition = new float [rocks];
float [] rockMovement = new float [rocks];
PVector location;
PVector velocity;
float move = 0;
float click = 0;
float crystalColour = 0;
int xRepeat = 25;
int yRepeat = 100;

void setup(){
  size(500,500,P2D);
  background(255);
  location = new PVector(crystalCenter,crystalCenter+200);
  velocity = new PVector(0,0);
  for(int i = 0; i < rocks; i++){
  XrockPosition[i] = random(180,320); // position of rocks in terms of x i.e. width over center crystal
  YrockPosition[i] = random(300,490); // position of rocks in terms of y i.e. where they start.
  }
  
}

void draw(){
  background(255);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);//adds in fading trail when BKg in setup
  smooth();

  location.add(velocity);//MAKES MOTION.
  fill(crystalColour);
  crystal();// MAKES CRYSTAL THERE FROM THE BEGINNING

//CENTRAL CRYSTAL RISING UP

   if(move>15){//makes crystal rise up
    
   velocity.y = -0.5;//speed of rising crystal 
   //pushMatrix();
      //translate(random(-shake,shake),0);
      //crystal();
      //translate(-10,0);
      //popMatrix();
      //move = move+0.1;
      
      //crystalColour = crystalColour+0.3;
      
      //if (move<150){
        //shake = shake +0.01;
      //}
  }
  
  
  //ROCKS AROUND CENTRAL CRYSTAL//
  
  if(location.y < 150){ // this is when the rocks appear on screen - i.e. when the center crystal gets to certian point on screen rocks appear.
 
    for(int i = 0; i< rocks; i++){
    fill(0);
  ellipse(XrockPosition[i],YrockPosition[i],5,5);//this is actual code of the rocks - without, no rocks appear. 
  YrockPosition[i] = YrockPosition[i] + 0.9;// this makes the rocks move, i.e makes them fall. if not here rocks static - makes dynamic 
  println(YrockPosition[i]);
    
    }
    if(click == 10){//this is toggle for the rocks to follow the mouse once clicked. 
      for (int mouse = 0; mouse < rocks; mouse++)
      YrockPosition[mouse] = YrockPosition[mouse] + (mouseY - YrockPosition[mouse])/10;//THE ACTUAL FOLLOWING OF THE MOUSE - THIS GIVES THE DELAYED FOLLOW EFFECT
     
       for (int i = 0; i < rocks; i++){// THIS IS MAKING THE ROCKS FLUCTATE WHILE FOLLOWING THE MOUSE - GIVES ROCKS LIFE OF OWN. 
         ellipse(XrockPosition[i],YrockPosition[i],5,5);
         //XrockPosition[i]=XrockPosition[i]+1*sin(rockMovement[i]);
         YrockPosition[i]= YrockPosition[i]+2* sin(rockMovement[i]); //YrockPosition[i]+2*sin(rockMovement[i]);
        rockMovement[i]=rockMovement[i]+random(-PI/10.0, PI/100.0);//
   }
   // }
  }
  
  
  if (location.y <-100){
   velocity.y = 0;
  
 
 }
 


if(location.y <= -100.5){
 
  translate(-50, 400);
  crystal();


println (location.y);
}


//for (int i = 0; i < width/xRepeat; i++) {//loop 1 repeats pattern in the x direction.
    //for (int j = 0; j < height/yRepeat; j++) {//loop 2 repeats the entire rows vertically.
      //pushMatrix();//saves untransformed co-ordinates
      //translate(xRepeat*i, random(400,500)*j);// translates the entire coordinate system (is what causes the same thing to be drawn in different places).
      //noLoop();
      //rotate(random(0.5));
      //crystal();
      //popMatrix();//reverts to the saved co-ordinate system that we created using pushMatrix()
    //}
  }
  

}
void mouseMoved(){
  
  if((mouseX > 180) && (mouseY > 250)){
  
    
      pushMatrix();
      translate(random(-5,5),0);
      crystal();
      translate(-10,0);
      popMatrix();
   move=move+0.1;
   //println(move);
  }
 
}

void mouseClicked(){
  
  if(click == 0){
  click = 10;
  }else{
    click=0;
    
  
}
}


void mouseDragged(){
  
 
  }


void crystal(){
  
  
  crystalHeight = (yc - ya);
  crystalWidth = (xd - xb);
  crystalArea = (0.5*100*100)+(0.5*100*50);
  crystalCenter = ((xd + xb)/2) - ya;
  quad(xa+location.x,ya+location.y,  xb+location.x,yb+location.y,  xc+location.x,yc+location.y,  xd+location.x,yd+location.y);
  
  
}


