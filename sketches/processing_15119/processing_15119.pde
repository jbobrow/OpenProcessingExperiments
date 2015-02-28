
void setup() {
size(200,200);
}

void draw()  {
for(int a=0; a<200; a=a+3) {
     line(100-a/3,a,100+a/3,a);
 }
}               
