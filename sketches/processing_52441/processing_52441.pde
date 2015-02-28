


void setup (){
  size (600,600);
  smooth();
  

 
}

void draw (){
  background (33,45,0,20);
  
  fill(67);
      pushMatrix ();
  for (int i=0; i<width; i+=10){

    //noFill ();
    strokeWeight (5);
    rect (i,300,800,500);
  }
    popMatrix ();
    
  
  for (int i=0; i<width; i++){
    strokeWeight (.5);
    stroke (0);
    line (width/2,height/2, i*50+20,i*4);
    stroke(204, 102, 0);
  
    line (width/2,height/2, i*2,i*10);
    line (width/100,height/2, i*2,i*10);
    line(width/4,height/2, i*7,i*3);
    line(width/20,height/2, i*20,i*3);
    line(width/30+49,height/7, i*20,i*3);
    line(width/3,height/20, i*2,i*3);
    line(width/5,height/20, i*2,i*3);
    line(width/8,height/20, i*2,i*3);
  
     fill(67,3,55);

  
  }
  
 for (int r = 0; r<height/2-130; r++){
  noStroke ();


 }
  
  
  
  
}

