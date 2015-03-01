
  i = 1;
   angle = 0; 

  }


void draw(){
 translate(width/2,height/2);


 rotate(angle);
 i += 1;
 angle += PI/50;
 strokeWeight(4);
stroke(random(1,255), random(1,255),random(1,255));
 point(i,0);   
  
}
