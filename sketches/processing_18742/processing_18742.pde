
size(250, 250);
background(0);
smooth();
 
 
stroke(255, 130);
for(int x = 0; x <= width; x += 30){
  for(int y = 0; y <= height; y += 30){
    line(x, y, width, height);
  }
}
 
//for(int i = 0; i <= 250; i += 4){
  //stroke(255);
  //line(i, i, i*2, 240);
//}


