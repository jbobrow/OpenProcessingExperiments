
int s= 20;

void setup (){
  size (500,500);
  background (255);
 smooth (); 
}
  
  
void draw (){
  
  if (mousePressed){
    
for (int x = 10; x<width/2+10;x+=15){
  
  for (int y = 10; y<height/2;y+=10){
  fill (random(10),random(255),random(100));
ellipse (x, y, s, s); 
}
}

for (int a = width/2; a<width;a+=10){
  
  for (int b = 0; b<height/2;b+=10){
  fill (random(255),random(100),random(100));
  rect (a,b,s,s);    
  }
}
  for (int c = 0; c<width/2;c+=10){
  
  for (int d = 250; d<height;d+=10){
  fill (random(255),random(100),random(100));
  rect (c,d,s,s);    
  }
  
}
for (int e = width/2; e<width;e+=15){
  
  for (int f = height/2; f<height;f+=10){
  fill (random(10),random(255),random(100));
ellipse (e, f, s, s); 
}
}

}
}                                           
