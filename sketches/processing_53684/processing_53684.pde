
float x = 0.0; //x value, can change

void setup(){
  size(500,500); //canvas size
  background(0); //initial background colour
  rectMode(CORNERS); //draw rectangular shapes from corners
  noStroke(); //no border around shapes
}

void draw(){
  frameRate(70); //speed of the squares growing
  background(167,170,33); //background color
  
  fill(37,63,126); //blue
  rect(x+250,250-x,250,250); //top right, growing out from center
  
  fill(37,63,126); //blue
  rect(250-x,x+250,250,250); //bottom left, growing out from center
  
  fill(130,50,80); //mauve
  rect(0,500,x*0.5,500-x*0.5); //growing out from bottom left corner 
  
  fill(130,50,80); //mauve
  rect(500,0,500-x*0.5,x*0.5); //growing out from top right corner
  
  
  
  fill(130,50,80); //mauve
  rect(250,250,200+x,200+x); //bottom right, growing out from center
  
  fill(167,170,33); //green
  rect(250,250,180+x,180+x); //bottom right, growing out from center
  
  fill(130,50,80); //mauve
  rect(250,250,175+x,175+x); //bottom right, growing out from center
  
  fill(167,170,33); //green
  rect(250,250,100+x,100+x); //bottom right, growing out from center
  
  
 
  fill(130,50,80); //mauve
  rect(300-x,300-x,250,250); //top left, growing out from center
  
  fill(167,170,33); //green
  rect(320-x,320-x,250,250); //top left, growing out from center
 
  fill(130,50,80); //mauve
  rect(325-x,325-x,250,250); //top left, growing out from center
 
  fill(167,170,33); //green
  rect(400-x,400-x,250,250); //top left, growing out from center
  
  

  fill(111,10,50); //red
  rect((x*0.9)+250,250-(x*0.9),250,250); //top right

  fill(37,63,126); //blue
  rect((x*0.7)+250,250-(x*0.7),250,250); //top right
  
  fill(111,10,50); //red
  rect((x*0.6)+250,250-(x*0.6),250,250); //top right

  fill(111,10,50); //red
  rect(250-x*0.9,x*0.9+250,250,250); //bottom left
  
  fill(37,63,126); //blue
  rect(250-x*0.7,x*0.7+250,250,250); //bottom left
  
  if(x>250){ //if position is more than 250
    x=0.0;   //set it to 0
  }else{
  x+=4;
  }
  

}

                
                
