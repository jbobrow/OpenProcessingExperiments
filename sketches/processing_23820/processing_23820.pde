


float x = 100; //itinial x position
float y = 0; //initial y position

float speed = 1;//speed of square
float gravity = 0.1;

void setup(){
  size(200,500);
  background(173,255,254);//sky
  smooth();
  
}

void draw(){
  
  //draw rectangle
  background(173,255,254);//sky
 
  rectMode(CENTER);
  

   fill(148,244,151);
  rect(x,y-y,5,y+y);//tail
   noStroke();
   
   //head of chameleon
   fill(250,y,250);//lighter colour
     ellipse(x-58,y-3,20,20);//scales
     fill(150,y,150);
  ellipse(x-58,y,20,20);
  ellipse(x-63,y+5,13,11);//mouth
  
 
  
  //body of chameleon
  fill(250,y,250);//lighter colour
  ellipse(x-25,y-5,50,30);
   fill(150,y,150);
  ellipse(x-25,y,50,30);
  
  //legs
  
  rect(x-10,y+10,3,20);
    rect(x-45,y+10,3,20);

    
    //eyes of chameleon
  fill(0);
  ellipse(x-60,y,5,5);
    
    fill(196,154,125);
  rect(150,0,200,10);//branch
  
  if( (mouseX<100)&&(mouseY<100) ){ //either true or false
    
    fill(0,255,0);//green
    rect(50,460,3,20);
    
    fill(255,0,0);//red
    
    ellipse(50,480,40,40);//apple
    

  
  
  y = y+speed;
  println(y);
  
  speed = speed + gravity -0.5;
  
 //if the square reaches the bottom of the screen
 //reverse
 if(y>height){
   
   speed = speed * -1;
 }
 //if the square reaches the top
 //reverse
 if( y<0){
   speed = speed *-1;
 }
}

}


