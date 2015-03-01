
PFont font;
void setup(){
  size(800,800);
  noStroke();
  background(200);
  font=loadFont("8bit.vlw");
}

void draw (){
  
  textFont(font);
  textAlign(CENTER,CENTER);
  fill(255);
  text("Fancy Shit",580,750);
  
  
  
  float time = millis()*0.001;
  float a=cos(time);
  float b=sin(time);
  float amplitude = sin(time)*160;
  
  
  

  
  float posX = cos( time ) * amplitude + width/2;
  float posY = sin( time ) * amplitude + height/2;
  
  if (mousePressed){
    fill(0,0,0,0);
  }
  else{
    fill(random(255),random(255),random(255));
  }
//   quad( mouseX, posY,
//             posX, mouseY,
//             a, posY,
//             posX, b
//          ); 
//   rotate(PI/3);
//   quad(     mouseX/2, posY,
//             posX, mouseY/.6,
//             a, posY/5,
//             posX, b
//          ); 

//                    int offset = 500;
//                    for(int x=1;x<10;x++){
//                      for(int y=1;y<10;y++){
//                        rectMode(CENTER);
//                    //    fill(200);
//                    //    strokeWeight(0);
//                    //    rect(offset,offset,120,120);
//                        
//                        fill(255);
//                        rect(offset+x*20,offset+y*20,20,20);
//                        
//                        fill(200);
//                          rect(offset+(x-1)*20,offset+(y-1)*20,20,20);
//                        
//                                            
//                      }
//                    }


float x = random(50);
  float y = random(50);
  if (second() % 2 == 0){
stroke(0,0,0,0);

fill(200);
    strokeWeight(0); 
rect(760,50,100,100);
fill(255);
    strokeWeight(0);    
    rect(760,50,x,y);
  }


rectMode(CENTER);
strokeWeight(20);
fill(0,0,0,0);
stroke(255,0,0);
rect(width/2,height/2,width,height);
if (mousePressed){
    background(200); //The worm
  }      
strokeWeight(5);  
 fill(random(255),random(255),random(255));
stroke(random(255),random(255),random(255));
curve(mouseX/2, posY, posX, mouseX, mouseY, posX, mouseY/.6, posY);
//code is awsome
}


