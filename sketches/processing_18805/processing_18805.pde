
size(250, 250); 
background(0,20,40,20); 
stroke(225);
noFill();
smooth(); 

for(int x=0;x<=30;x+=35){
   for(int i = 1/2; i <250; i += 4.5) {
    //stroke(random(i,x));
     stroke(x,40,x+i);
    strokeWeight(random(0.5,3));
  
  bezier(250,i-10, 100,x*5,6+ x,10+i,i-x+10, 250);
}
}

