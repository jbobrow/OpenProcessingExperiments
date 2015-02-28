
size(1000,1000);
background(255);
  
for(int i = 0; i <=1000; i += 100) {
  for(int j = 0; j <=1000; j +=100) {
    strokeWeight(3);
    stroke(111,224,43);
    line(250,i,j,250);}}
    
for(int i = 0; i <=1000; i += 100) {
  for(int j = 0; j <=1000; j +=100) {
    strokeWeight(3);
    stroke(111,224,43);
    line(750,i,j,250);}}
    
for(int i = 0; i <=1000; i += 100) {
  for(int j = 0; j <=1000; j +=100) {
    strokeWeight(3);
    stroke(111,224,43);
    line(250,i,j,750);}}
        
for(int i = 0; i <=1000; i += 100) {
  for(int j = 0; j <=1000; j +=100) {
    strokeWeight(3);
    stroke(111,224,43);
    line(750,i,j,750);}}

    
    
for(int c = 0; c <= 1000; c +=125) {
  for(int d = 0; d <=1000; d += 125) {
    noStroke();
    fill(42,9,62,4);
    ellipse(250,250,d+20,c+20);}}
    
for(int c = 0; c <= 1000; c +=125) {
  for(int d = 0; d <=1000; d += 125) {
    noStroke();
    fill(42,9,62,4);
    ellipse(750,250,d+20,c+20);}}
    
for(int c = 0; c <= 1000; c +=125) {
  for(int d = 0; d <=1000; d += 125) {
    noStroke();
    fill(42,9,62,4);
    ellipse(250,750,d+20,c+20);}}
    
    for(int c = 0; c <= 1000; c +=125) {
  for(int d = 0; d <=1000; d += 125) {
    noStroke();
    fill(42,9,62,4);
    ellipse(750,750,d+20,c+20);}}
