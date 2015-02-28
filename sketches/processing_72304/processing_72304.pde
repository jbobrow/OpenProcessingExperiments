


void setup(){
  size(600,400);
  smooth();
}

void draw (){
  background(255);
  for(int x=0; x < 600; x+=10){
    for(int y=0; y<600; y+=60){
      if(mouseX > x && mouseX < x*10 && mouseY > y && mouseY < y+90){

        fill (456, 10,478);
        if(mouseX>50 && mouseX<100 && mouseY>50 && mouseY<100){
      }else{
        //noFill();
      }

    

      rect (x,y,100,100);

      rect(100,100,50,50);
      rect(200,100,50,50);
      rect(300,100,50,50);
      rect(400,100,50,50);
      rect(500,100,50,50);
    
      fill(100,291,28);
      ellipse(600,500,200,200);
      
      if(mousePressed);{
        rect(width/2,height/2,20,20);

    }
    }}}}


