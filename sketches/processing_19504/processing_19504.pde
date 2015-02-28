
size(250, 250); 
 background(220,90,80,1);
stroke(255);
noFill();
smooth(); 
strokeWeight(1);
for(int x=0;x<=130;x+=40){
   for(int i = 1/2; i < 100; i += 10) {
     stroke(i,i+1);
  ellipse(250,80,90-(i/2.0),i);
  ellipse(1,180,90-(i/2.0),i);// two sides

  stroke(i+100,i-100,i+i,10);
  strokeWeight(1.5);
  ellipse(80+i,i-3,i/1.1+2,i+90);
  ellipse(250-(80+i),(250-i+3),i/1.1+2,i+90);//middle red
 // strokeWeight(1);
  stroke(255,209,23,10);
    ellipse(125,x,x*0.5,x*1.2);
     ellipse(125,(250-x),x*0.5,x*1.2);//middle yellow 
       ellipse(125,125,x*0.5,x*1.2);

  
  
   }
}

