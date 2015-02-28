
size(400,400);
colorMode(HSB, 100);
background(0);
noStroke();

translate(width/2, height/2);
for(int r1=0; r1<360; r1+=30){

pushMatrix();
rotate(radians(r1));
translate(100,0);

float h = random(100);

for(int r2=0; r2<360; r2+=30){
  pushMatrix();
  rotate(radians(r2));
  translate(50,0);
  
  for(int i=1; i<=5; i++){
    fill(h, i*20, 99,80);
    int sz = 60-i*10;
    rect(0,0,sz,sz);
  }
  
  popMatrix();
  
}

popMatrix();

}

