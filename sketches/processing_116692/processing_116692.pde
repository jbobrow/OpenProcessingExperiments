
Walker[] myWalker;

void setup(){
  size(1280,720);
  smooth();
  frameRate(10);
  
     myWalker = new Walker[80];
  for (int j=0 ; j <80 ; j++){ 

     myWalker[j] = new Walker( color (random(255)), int(random(0,width)) ,int(random(0,width)) );
  }
  
  
}


void draw(){
  
   for (int j=0 ; j <80 ; j++){ 
    myWalker[j].walk();
   }

  
}




class Walker{
  
  color c;
  int x;
  int y;
  
  Walker(color tempC,int tempX,int tempY){
    c = tempC;
    x = tempX;
    y = tempY;
    
  }
  
  void walk(){
    fill(c);
    noStroke();
  //  for(int i=0; i < 200 ; i++){
    rect(x,y,1,1);
    
    //Random Walk Function :
//    x += random(-1,1);
//    y += random(-1,1);

    int r = int(random(0,4));
    if (r == 0){
      x++;}
      
    else if (r == 1){
     x-- ;
    }
    else if (r == 2){
     y++ ;
    }
    else {
     y-- ; 
    }
    
    
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);    
    
  //  }
  }
  
  
  
}
