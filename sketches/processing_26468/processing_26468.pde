
void setup() {
  float temp = tempConverter(70);
  println(temp);
}

float tempConverter(float farenheit) { 
  float celsius = (farenheit - 32) * (5.0/9.0);
  return celsius;
} 

