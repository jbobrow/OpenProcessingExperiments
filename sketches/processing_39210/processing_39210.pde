
// creat a functioin that returns a value
float rNum = 0.0;

void setup(){
helloWorld();
rNum = numbers();
println(rNum);
}
 
void helloWorld(){ 
 println("hello world");
 println ("hi person"); 
}

float numbers(){
  float number = random(100);
  return number;
}
