
size (250,250);

background (255);

smooth ();

for (int a=10; a<120; a+=20){
  line (125, a, a+130, 125);
  line (125, a+130, a, 125);
  line (125, -a+120, a, 125);
  line (125, 250-a, a+130, 125);
}  

