
size(300, 300);
background(200);
smooth();

for( int a = 10; a<120; a+= 20){

  line(125, a, 125-a, 125);
  line(125, a, a+125, 125);
  line(125, 250-a, 125-a, 125);
  line(125, 250-a, 125+a, 125);
}    

