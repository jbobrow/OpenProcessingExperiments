
int i = 1;
int j;
int counter = 0;
int sum = 0;
int counter2 = 0;

void setup() {
}
void draw() {
background(255,255,0);
print("hi",10,10);
    for (int j=2; j<999; j=j+2) { //rings/layers size
        while (counter <= 4) {
            i = i + j;
            sum = sum + i;
            counter++;
            }
         if (counter > 4) {
             counter = 0;
             break;
         }
         counter2++;
         if(counter2 % 10000 == 0) {
          println(sum);
          }
     }
     println("Done");
     noLoop();
}
