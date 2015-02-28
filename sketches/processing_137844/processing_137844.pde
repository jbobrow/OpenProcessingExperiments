
size (600,600);
background (0);

int a = 0;
int b = -30;


while (a<=600) {
  int j = 0;
    while ( j <= 600 ) {  
     ellipse (j,a,55,55);     
      j = j + 100;
    }
a = a + 100;
}

while (b<=570) {
ellipse (270,b,40,40);
ellipse (330,b,40,40);
b = b + 100;
}




