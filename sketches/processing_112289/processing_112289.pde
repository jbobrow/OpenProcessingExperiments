
size(800,800);
background (210,109,120,40);
smooth();

for (int x = 20; x <=900;x+=20){
  for(int y = 20; y <= x; y +=20){
    strokeWeight(6);
    stroke(random(255), random(255),random(255),80);
    line(0,y-20,width,y-20);
    
  }
}

for (int x = 20; x<=900;x+=20){
  for(int y = 20;y <=x;y+=20){
    strokeWeight(12);
    stroke(random(255), random(255),random(255),40);
    line(x-20,y-20,x-20,height);
  }
}

for(int x=20; x<=900;x+=40){
  for(int y = 20;y <=900;y+=40){
    fill( random(255), random(255),random(255),60);
    stroke(124);
    strokeWeight(2);
    rect(x-25,y-25,10,10);
  }
}



