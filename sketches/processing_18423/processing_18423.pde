

size (250,250);
background (0);

smooth();
noFill();

stroke (#E37C95, 140);
strokeWeight(2);
for(int i=20; i<400; i+=10){
bezier (0,i+0,i+40,20,110,i+230,250,69);
}

stroke (#5A0B1F, 110);
strokeWeight (1);
for(int i=0; i<500; i+=10){
bezier (0,i+0,i+30,20,110,i+90,210,-50);
}

stroke (255,170);
strokeWeight (1);
for(int i=0; i<220; i+=10){
bezier (0,i+18,i+10,0,10,i+20,300,200);
}


