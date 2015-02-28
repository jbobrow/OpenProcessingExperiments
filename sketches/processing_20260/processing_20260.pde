
void setup () {
  size(400,400);
  background(255);

}

float baseSquare= 50;
float rhombus=200;
float field= 200;
float metal=1;
float greenSquares= 20;
float division= 10;

void draw(){
}

void keyPressed (){
  if (key == 'a'){
    field ++;
    Glass ();
  }
  
  if (key == 'b'){
   field --;
  Glass();
  } 
  
  if (key == 'c'){
    baseSquare ++;
    Glass ();
  }
    
   if (key == 'd'){
      baseSquare --;
      Glass ();
    }
    
  
     if (key == 'e'){
       metal ++;
       Glass();
     }
     
   
     if (key == '1') {
    greenSquares +=20;
    Glass();
  }


     
      if (key =='f'){
    division +=15;
    Glass();
  }

      
    
    
}
  
  void Glass () {
    background (255);
    fill (255);
    rectMode (CENTER);
    rect (width/2, height/2,70, 330);
    
  rect(width/2,175,40,field);
  noFill ();
  
  fill (252,224,3,95);
  rect(width/2,330,baseSquare,baseSquare);
  
  line (width/2,35,width/2,365);
  strokeWeight(metal);
  
 
  for (float x = 120; x< 370; x += greenSquares){
   fill(22,157,48,80);
  rect(width/2,x,20,10);}

 for (float y = 150; y< 300; y += division){
   noFill();
  rect (width/2,y,60,40);
}

  
    fill(191,157,44,90);
    beginShape();
    vertex(width/2,60);
    vertex(width/2,110);
    vertex(170,90);
    vertex(170,40);
    vertex(width/2,60);
    endShape();
    
    fill(191,157,44,90);
    beginShape();
    vertex(width/2,60);
    vertex(width/2,110);
    vertex(230,90);
    vertex(230,40);
    vertex(width/2,60);
    endShape();


  
  

  
  

 
   
 
  
  }


