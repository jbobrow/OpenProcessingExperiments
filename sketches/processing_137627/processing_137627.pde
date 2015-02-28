
size (600, 500);
background (#5C7595);

noStroke();


for(int y=0; y<= height; y+= 40){
  for(int x=0; x<= width; x+= 40){
    fill (#FFDB21);
    ellipse(x,y,20,20);}
  


int i = 60;
while ( i <= 900) {
  println("i = " + i);
  rect(i, i, 5, 5);
  int j = 0;
  while ( j <= 600 ) {
    noStroke();
    fill(i, 130, 100);
    ellipse(j, i, 5, 5);  
  
  
  
  j=j+10;
}
  i = i + 2;
}


}



