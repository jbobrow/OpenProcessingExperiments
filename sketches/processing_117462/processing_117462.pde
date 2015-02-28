
int[] hours=new int[13];
float[] sleepingHours={
  0, 1, 0, 3, 8, 7, 33, 21, 9, 6, 3, 1, 2 
}; 
void setup() {
  size(400, 200);
  for (int i=0; i<sleepingHours.length;i++){
    hours[i]=0+i;
  }
}
void draw() {
  background(255);
  for(int i=0; i<sleepingHours.length; i++){
    rect(10+(i*30), 60, 15, sleepingHours[i]);
    fill(0);
    text(hours[i], 10+(i*30),30);
  }
}
