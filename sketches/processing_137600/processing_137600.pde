
void setup(){

size(800,800);
background(255,255,255);
}

void draw (){

int i =500;

while( i > 0) {
  stroke(3);
  fill(255,255,255);
    ellipse(width/2, height/2, i-5, i-10);    
  
i = i -20;
      fill(255,255,255,19);


     ellipse(width/2, height/2, i-5, i-10);    
     ellipse(width/2, height/2, i+5, i+10);
     ellipse(width/2, height/2, i+2, i+4);
  fill(0,0,0,30);
     ellipse(width/2, height/2, i-2, i-4);

}

while ( i < 0){
 stroke(0.4);
   fill (0,0,0,0);
  i = i -20;
     ellipse(width/2, height/2, i, i);    
     ellipse(width/2, height/2, i+60, i+10);
}


}

  


