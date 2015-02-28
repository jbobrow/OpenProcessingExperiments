

size(250, 250); 
background(56,206,202,2); 
stroke(255);
smooth(); //basic background

for(int i = 1/2; i < 250; i += 3) {
   for(int x=0;x<=width;x+=40){
    fill(210,30,220,11); //purple
    stroke(225,x+55,i);
    strokeWeight(1);
      bezier(250, 10*i, 10+i,i*10, 9+x, 100, 0, 200+x);
}

}


