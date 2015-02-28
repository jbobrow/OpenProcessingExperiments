
int k;
int num = 200;

size (480, 500);
smooth ();
strokeWeight (1);
k=40; 
for (int i = 0; i < num*3; i++) {
  line (i, k, i + 30, 1);
  k+=10;
}

