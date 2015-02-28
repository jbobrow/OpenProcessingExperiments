
size ( 800, 600 ); 
background (89,108,255);




for(int i=5; i<800; i+= 61) {
  for(int j=5; j<800; j+=61){
strokeWeight(2);
    stroke ( 246, 255, 0);
line (i, 600,j, 0);
  }
}


for(int i=5; i<800; i+= 30) {
  for(int j=5; j<800; j+=30){
strokeWeight(2);
stroke (51 , 0, 237, 30);
line (0,i, 800,j);
  }
}


for(int i=5; i<900; i+= 90) {
  for(int j=5; j<900; j+=90){
strokeWeight(6);
    stroke (670 , 0, 100, 130);
line (j, 400,i, 900);
  }
}
for(int i=5; i<900; i+= 90) {
  for(int j=5; j<900; j+=90){
strokeWeight(10);
    stroke (670 , 0, 100, 130);
line (j, -300,i, 150);
  }
}


for(int i=5; i<800; i+= 830) {
  for(int j=5; j<800; j+=830){
strokeWeight(3);
    stroke (170 , 0, 100, 130);
line (i, 360,j, 100);
  }
}



