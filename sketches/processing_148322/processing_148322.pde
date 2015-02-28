
Green greensquares;

Blue bluesquares;

DarkBlue darkbluesquares;

Red redsquares;

int counter = 0;


void setup(){
  
  
  background(255);
  size(400,400);
  background(255);
  smooth();

greensquares = new Green(random(width),-100);
bluesquares=new Blue(random(width),-100);
darkbluesquares=new DarkBlue(random(width),-100);
redsquares=new Red (random(width),-100);

}
void draw(){
background(255);

println(counter);

greensquares.update();


greensquares.display(); 

  
if(counter == 2){           //when the counter is set to 1
  bluesquares.update();     //start updating the NEXT class (tempsquares in this case)
  bluesquares.display();
}


if(counter == 3){           //when the counter is set to 1
  darkbluesquares.update();     //start updating the NEXT class (tempsquares in this case)
  darkbluesquares.display();
}

  if(counter == 4){           //when the counter is set to 1
  redsquares.update();     //start updating the NEXT class (tempsquares in this case)
  redsquares.display();

  
 }

}

class Blue{
  
float xpos;
float ypos;
float sizx;
float sizy;

  Blue(float x, float y){
    xpos = x;
    ypos = y;
    sizx = 25;
    sizy = 25;
  }


void update(){
  
if(ypos >= (height-(sizx*2))){          //if ypos is greater than the height, minus it's length
ypos = height-(sizx*2);                 //THEN keep it there
counter = 3;                            //set counter to 2
}else{                                  //otherwise,
  ypos+=1;                              //it moves downward
  if(keyPressed && (key==CODED)){       //and checks for arrow key presses
  if(keyCode == LEFT){    
    xpos--;    
  }
  if(keyCode == RIGHT){    
    xpos++;    
  } 


}
}
}

void display(){
  
 
//blue blocks 

fill(0,0,255);
   
rect(xpos,ypos,sizx,sizy);

rect(xpos+sizx,ypos,sizx,sizy);

rect(xpos,ypos+sizy,sizx,sizy);

rect(xpos+(sizx),ypos+(sizy),sizx,sizy);


}



}

class DarkBlue{
  
float xpos;
float ypos;
float sizx;
float sizy;

  DarkBlue(float x, float y){
    xpos = x;
    ypos = y;
    sizx = 25;
    sizy = 25;
  }


void update(){
  
if(ypos >= (height-(sizx*5))){          //if ypos is greater than the height, minus it's length
ypos = height-(sizx*5);                 //THEN keep it there
counter = 4;                            //set counter to 2
}else{                                  //otherwise,
  ypos+=1;                              //it moves downward
  if(keyPressed && (key==CODED)){       //and checks for arrow key presses
  if(keyCode == LEFT){    
    xpos--;    
  }
  if(keyCode == RIGHT){    
    xpos++;    
  } 


  }
}
}


void display(){
  
 
//green blocks 

fill(0,200,200);
   
rect(xpos,ypos,sizx,sizy);

rect(xpos,ypos+sizy,sizx,sizy);

rect(xpos,ypos+(sizy*2),sizx,sizy);

rect(xpos,ypos+(sizy*3),sizx,sizy);

rect(xpos,ypos+(sizy*4),sizx,sizy);
}



}

class Green{
  
float xpos;
float ypos;
float sizx;
float sizy;

  Green(float x, float y){
    xpos = x;
    ypos = y;
    sizx = 25;
    sizy = 25;
  }


void update(){
  
  if(ypos >= (height-(sizx*4))){          //if ypos is greater than the height, minus it's length
ypos = height-(sizx*4);                 //THEN keep it there
counter = 2;                            //set counter to 2
}else{                                  //otherwise,
  ypos+=1;                              //it moves downward
  if(keyPressed && (key==CODED)){       //and checks for arrow key presses
  if(keyCode == LEFT){    
    xpos--;    
  }
  if(keyCode == RIGHT){    
    xpos++;    
  } 
}
  
}




}


void display(){
  
 
//green blocks 

fill(0,200,50);
   
rect(xpos,ypos,sizx,sizy);

rect(xpos+sizx,ypos,sizx,sizy);

rect(xpos+(sizx*2),ypos,sizx,sizy);

rect(xpos,ypos+sizy,sizx,sizy);

rect(xpos,ypos+(sizy*2),sizx,sizy);

rect(xpos,ypos+(sizy*3),sizx,sizy);
}



}



class Red{
  
float xpos;
float ypos;
float sizx;
float sizy;

  Red(float x, float y){
    xpos = x;
    ypos = y;
    sizx = 25;
    sizy = 25;
  }


void update(){
  
if(ypos >= (height-(sizx*1))){          //if ypos is greater than the height, minus it's length
ypos = height-(sizx*1);                 //THEN keep it there
counter = 5;                            //set counter to 2
}else{                                  //otherwise,
  ypos+=1;                              //it moves downward
  if(keyPressed && (key==CODED)){       //and checks for arrow key presses
  if(keyCode == LEFT){    
    xpos--;    
  }
  if(keyCode == RIGHT){    
    xpos++;    
  } 


}
}
}


void display(){
  
 
//red blocks 

fill(255,0,0);
   
rect(xpos,ypos,sizx,sizy);

rect(xpos+sizx,ypos,sizx,sizy);

rect(xpos+(sizx*2),ypos,sizx,sizy);

rect(xpos+(sizx*3),ypos,sizx,sizy);

rect(xpos+(sizx*4),ypos,sizx,sizy);


}



}



