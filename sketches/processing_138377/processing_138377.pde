
//Color 1 - Color by Numbers
//Exercise #2,3
/*3. Redraw your composition from exercise 1 using hexadecimal 
color values.*/




int k = 1;

void setup (){
size (400,400);

colorMode(HSB);
for (int i = 0; i < 400; i++) {
stroke(#3333CC*i*0.5);
line(0, i, i, 400);
}

colorMode(HSB);
for (int j = 0; j < 400; j+=8) {
stroke(#3333CC*j*0.5);
line(j, 0, 400, j);
}
}

void draw (){
colorMode(HSB);
k = k+1;

fill (#1235CC * k);
ellipse(200, 200, k, k);

if (k > 250) {
  k = 100;
}

}



