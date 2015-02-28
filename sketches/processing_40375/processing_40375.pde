
int playing =0;

void setup(){
  size(800,800);
  smooth();
  noStroke();
  
}

/*

noLoop();
will stop your program


if(x%20==0 "&& y%20==0"){   <---that'll also check the y
  fill(255);
  ellipse(x,y,5,5);
} else{
  fill(0);
  ellipse(x,y,5,5);

this would color every row that 20 goes into evenly white
and if not true ("else") they will be black

*/

void draw(){
  background(210);
  
    //bg circles
  for(int x=0; x<width; x+=30){
    for(int y=0; y<height; y+=30){
      fill(100);
      float ellSize = (map(mouseY,0,height,1,40));
      ellipse((x+15),y,ellSize,ellSize);
    }
  }
  
  //white squares
    for(int x=0; x<width; x+=60){
    for(int y=0; y<height; y+=60){
      fill(255);
      rect(x,y,30,30);
    }
  }
  
  //bigcorner circles
  for(int x=0; x<width; x+=30){
    for(int y=0; y<height; y+=30){
      fill(150);
      float ellSize = (map(mouseX,0,width,1,15));
      ellipse(x,y,ellSize,ellSize);
    }
  }
  
    //smallcorner circles!
  for(int x=0; x<width; x+=30){
    for(int y=0; y<height; y+=30){
      fill(0);
      float ellSize = (map(mouseX,(width/2),width,1,10));
      ellipse(x,y,ellSize,ellSize);
    }
  }
  
  //grey squares
    for(int x=0; x<width; x+=60){
    for(int y=0; y<height; y+=60){
      fill(100);
      rect((x+10),(y+10),10,10);
    }
  }
  
    //light grey squares
    for(int x=30; x<width; x+=60){
    for(int y=30; y<height; y+=60){
      fill(240);
      
      rect((x+10),(y+10),10,10);
    }
  }
}




void mousePressed(){
  noLoop();
}

void mouseReleased(){
  loop();
}



/*
void mouseClicked(){
  if(playing==0){ //== means it's a question
    noLoop();
    playing=1;
  } else{
   (playing==1);
    loop();
    playing=0;
  }
}
*/

