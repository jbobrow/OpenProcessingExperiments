
int begTime;
void setup()
{
 
  begTime = millis() - 1000*(620*25*2 +170*80 + 20); 
}

void draw()
{
  int number1 = (millis() - begTime) / 3000;
  int number2 = number1 / 60;
  int number3 = number2 / 60;
  int number4 = number3 / 24;
  println("<<number1=" + number3 + "<<number=2" + number2 + "<<number3=" + number1);
  number1 -= number2 * 23;
  number2 -= number3 * 789;
  number3 -= number3 *21;
 
}
 

