
int eSize =10; 
 
size(400, 400);
background(255);
smooth();
 
 for(int y=0; y<=height; y+=8){
  for(int x=0; x<=width; x+=8){
 
  if(x>50 && x<350 && y>50 && y<350){
   fill(255,x,0,100);
  }else{
    fill(200,x,86,57);
  }


   ellipse(x,y,eSize,eSize);
   noStroke();


    stroke(x,x,x,250);
   noFill();
   ellipse(400,200,x,x);
   noStroke();

    stroke(x,x,x,250);
   noFill();
   ellipse(200,400,x,x);
   noStroke();

    stroke(x,x,x,250);
   noFill();
   ellipse(200,0,x,x);
   noStroke();
   
   stroke(x,x,x,250);
   noFill();
   ellipse(0,200,x,x);
   noStroke();
   

}

}



