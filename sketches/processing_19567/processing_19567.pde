
size(250, 250); 
background(80); 

noFill();
smooth(); 
stroke(#ff5db5);
strokeWeight(0.6);
for(int i=0; i < height; i+=7) {
  bezier(0, 250-i, 121, 50, 225, 270, 250, i);
}

stroke(#ff84c7,70);
strokeWeight(2);
for(int j=0; j< height; j+=12){
  line(0,250-j, 160,150);
  line(250-j,0,160,150);
  line(250,250-j,160,150);
  line(250-j,255,160,150);  
}

noFill();
stroke(#b190d8);
strokeWeight(0.8);
for(int c=0; c<90; c+=1) {
   ellipse (random(140,180), random(130,170), 3, 2); //middle small
}
stroke(#b190d8,210);
strokeWeight(1.5);
for(int d=0; d<20; d+=1){
  ellipse(random(100,200),random(60,130),6,6); //top small
  ellipse(random(50,180),random(170,220),6,6); //buttom small ones
}
stroke(#b190d8,200);
strokeWeight(3);
for(int e=0; e<11;e+=1){
  ellipse(random(50,250),random(0,61),12,12); //top big
  ellipse(random(0,250),random(220,250),12,12);  //buttom big ones
  
  }

