

int posX;
int posY;

int posZ;

int X;
int Y;

int incX;
int incY;

int incXX;
int incYY;





//--------------

void setup (){
     
     size(500,500);
     background(239, 240, 44);
     
     posX = 200;
     posY = 200;
          
     X = 300;
     Y = 100;

    incX = 1;
    incY = 1;
    incXX = 1;
    incYY = 1;
    
  


}

// -------------

void draw (){
  

  noStroke();
  fill(20,242,170,0);
  rect (0,0, width, height);


    fill (13, 160, 255);
    ellipse (posX, posY, 50, 50);
    
    fill (240, 160, 255);
    ellipse (X, Y, 100, 100);
    
    stroke (239, 240, 44);
    line(posX, posY, mouseX, mouseY);
    line(X, Y, mouseX, mouseY);
    
    

    posX = posX + incX;   
    posY = posY + incY;
    X = X + incXX;
    Y = Y + incYY;
    

    
    if(posX < 0){
       incX = incX * -1;}
    
    
    if(posX > width){
     incX = incX * -1;  
    }
    
     if(posY < 0){
       incY = incY * -1;}
    
    
    if(posY > height){
     incY = incY * -1;  
    }
    
    
    //--------
    
    
     if(X < 0){
       incXX = incXX * -1;}
    
    
    if(X > width){
     incXX = incXX * -1;  
    }
    
     if(Y < 0){
       incYY = incYY * -1;}
    
    
    if(Y > height){
     incYY = incYY * -1;  
    }
    
    
    
    println(posX);
 
 
 
  


}


