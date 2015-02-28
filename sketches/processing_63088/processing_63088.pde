
size(600,600);
smooth();
noFill();
stroke(0,0,0,55);
strokeWeight(.5);
background(255);

for(int z =50; z<600;z = z+20){
  for(int y = 50; y < 600; y =y + 20){
rect(width/z,height/y,y,z);
  }
}

for(int z =20; z<600;z = z+40){
  for(int y = 20; y < 600; y =y + 40){
rect(width/z,height/y,y,z);
  }
}

