
void setup() {}

void draw () {
  float num= averageThreeNumbers(27, 48, 20);
  print(num);
  noLoop();

}
float averageThreeNumbers (float n1, float n2, float n3){
  float answer=(n1+n2+n3)/3;
  return answer;

}
  

