
size(600,600);
smooth();
noFill();
stroke(250,0,0,255);
strokeWeight(.2);
background(230);

for(int z = 5; z<700;z = z+50){
  for(int y = 10; y < 700; y =y + 50){
  quad(z,y,y+20,z+20,z-50,y-50,z+20,y+30);
  }
}

