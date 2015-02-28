
void setup(){
size (500,300);
background (0);
stroke (128,128,128);
for (int i = 0; i < 1000; i = i+3) {
  line(i, 100, i, 200);
}
}
