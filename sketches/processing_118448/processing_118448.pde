
int eSize = 3;
  
size(510, 510);
background(255);
 
  
 strokeWeight(1); 
 for(int x = 0; x <=width; x ++) {   
  stroke(x, 255, x, x);  
  line(255, 255, x, 0);
   
     stroke(x, 160, 255, x); 
  line(x, 255, 510, 510);
   
     stroke(0, x, 255, x); 
  line(255, x, 510, 510);
   
    stroke(180, 40, 255, x);   
  line(255, 255, 0, x);
   
    stroke(x, 120, 255, x);  
  line(255, 510, x, 255);
   
   stroke(200, 100, 255, x);  
  line(510, 255, 255, x);
   
   stroke(255, 255, x, 510); 
  line(x, 255, 255, 0);
   
     stroke(180, x, 255, 30); 
  line(0, 255, 255, x);
  }

noFill();
for(int i = 100; i >= 0; i--){
stroke(255, 255, i, 100);
ellipse(width/4, height/4,2*i,2*i);

stroke(255, 255, i, 100);
ellipse(3*width/4, 3*height/4,2*i,2*i);

stroke(i, 255, 255, 100);
ellipse(3*width/4, height/4,2*i,2*i);

stroke(i, 255, 255, 100);
ellipse(width/4, 3*height/4,2*i,2*i);

stroke(i, 255, 255, 100);
ellipse(width/4, 3*height/4,2*i,2*i);

stroke(255, i, 255, 100);
ellipse(width/2,height/2,2*i,2*i);

stroke(91, 189, i, 100);
ellipse(0,height/2,2*i,2*i);

stroke(91, 189, i, 100);
ellipse(510,height/2,2*i,2*i);

stroke(i, 88, 165, 100);
ellipse(width/2,0,2*i,2*i);

stroke(i, 88, 165, 100);
ellipse(width/2,510,2*i,2*i);





}



