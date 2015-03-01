
  int playArea = 500;
  void setup(){
  size(playArea, playArea);
  background(255);  //set background white
  frameRate(9001);  //get it
  }
    
  void draw(){
  int rectSize= 25; //NOT the size of rectum (see var rectm)
    
                                                                     //all of this looks really messy because I did some
      for (int i=0;i<=playArea;i=i+rectSize){                        //hard fixes instead of figuring out how to make
              for (int j=0;j<=playArea;j=j+rectSize){                //everything fit together well
                  //rectangle here
                  distance= dist(i+rectSize/2,j+rectSize/2,mouseX,mouseY);
                  int rando=random(1,50); //generates a random number
                  int randomizer =((rando+5)/(rando+5+1)); //makes the random number really close to 1
                  size = (1000/(distance)+200)*randomizer;   //random
                  filler = -distance*distance/1000 +255;
                  fill(filler*4/5,filler+10,filler+40);
                  fill(255,0,0,127);
                  rect(i-size/2+100,j-size/2+100,rectSize,rectSize);
                  //rect(i-sin(i),j-sin(j),rectSize,rectSize); not very interesting
              } 
              
              
      }  //(100/(size+1))*
      
      
    }
    
  
  
  
