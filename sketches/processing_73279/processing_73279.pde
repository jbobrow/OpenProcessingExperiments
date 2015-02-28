
boolean displayOn = false;




void setup(){
  size(800, 800);
  noFill();
  smooth();
  stroke(.1);
   


    }




  void draw(){
   println(mouseX);
   println(mouseY);
   if(mouseX > 1 && mouseX < 800&& mouseY > 800 && mouseY<1);{

    fill(255,255,255,0);
      

  if(displayOn){

    if(mouseX > 1 && mouseX < 800&& mouseY > 800 && mouseY<1 && mousePressed ){
      if(mousePressed){
        if(displayOn){
        displayOn = false;
        }else if (!displayOn){
          displayOn = true;
        }
      }
    }
  }
     

  
  stroke(0);
  for(int i = 20; i < 800; i++){
   ellipse(width/2, height/2, i*5, i*4);
  }
  stroke(0);
  for(int i = 1000; i < 880; i++){
   ellipse(width/2, height/2, i*6, i*8);
  }
  stroke(0);
  for(int i = 5; i < 800; i++){
   ellipse(width/2, height/2, i*2, i*10);
  }
  
  
    }
  }
