
size(250, 250); 
background(0); 
stroke(225);
noFill();
smooth(); 
strokeWeight(1);
for(int x=0;x<=130;x+=40){
   for(int i = 1/2; i <250; i += 4.5) {
    stroke(x-i,200,i+100);
    
  
  bezier(250,i-10, 100,x*5,6+ x,10+i,i-x+10, 250);
}

}

