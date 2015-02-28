

size (250,250);
background (255);
smooth();

for(int x = 10; x < 125; x+=20){
  line (125,x,125-x,125);
  line (125,x,125+x,125);
  line (125,250-x,125+x,125);
  line (125,250-x,125-x,125);
   
}
