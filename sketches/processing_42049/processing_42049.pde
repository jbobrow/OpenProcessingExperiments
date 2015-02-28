
int spacing = 60;
int spacing2 = 60;

void setup(){
  size (400,400);
  background (0);
  smooth();
  }


void draw(){
   stroke(255);
   smooth();
  
  
  //draw stars  
  for(int x=5; x<=400; x=x + spacing2){
    for (int y=5; y<=200; y=y + spacing2){
     point(x,y);
      
    }  
  }
  
  //draw stars 
  for(int x=35; x<=width; x=x + spacing){
    for( int y=35; y<=height; y=y+spacing){
      point(x,y);
    }
  }
  
    //draw the atmosfere
   for(int i = 0; i < 250; i = i +20){
      noStroke();
      fill(0,0,i,9);
      rect(0,200, width,i);
}

  
  //clouds
  fill(255,225,149);
  ellipse(300,300,20,20);
  ellipse(290,305,10,10);
  ellipse(310,305,10,10);
   
  fill(250,246,167);
  ellipse(250,250,20,20);
  ellipse(240,255,10,10);
  ellipse(260,255,10,10);
  //moon
  fill(240);
  ellipse(100,100,30,30);
  
  //satellite
  fill(40);
  ellipse(290,50,40,30);
  stroke(230);
  line(260,50,320,50);
  
  //sun
  noStroke();
  fill(250,179,36);   
  ellipse(120,330,30,30);
}

