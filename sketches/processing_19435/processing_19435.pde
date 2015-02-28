
float y = 0;
float speed = 1.0;




void setup(){ 
  size(250,250); 
  smooth(); 
  
  
}
void draw(){
  fill (0,20);
  PFont font;
  font = loadFont("Serif-48.vlw");
textFont(font);

  text("M9M2G7",random(50),random(y)); //will move randomly
     
   

  y += speed; //will go down by 1.0
  if(y>260){ //when they reach 260
    y = + speed; //they will start at 0
    
   
  
  

  }
}


