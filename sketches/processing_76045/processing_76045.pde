
int led = 13; //led pin

int button1 = 6; //button pin
int button2 = 8;
int button3 = 10;

int val1 = 0; //we will store a vlaue here
int val2 = 0;
int val3 = 0;

//We need a 10K Ω resistor(brown,black,orange,gold) for the button
//We need a 220 Ω resistor(red,red,brown,gold) for the LED


void setup(){
  Serial.begin(9600); //open the serial port

  pinMode(led, OUTPUT); //set led pin to output

  pinMode(button1, INPUT); //set button pin to input
  pinMode(button2, INPUT);
  pinMode(button3, INPUT);
}


void loop(){
  val1 = digitalRead(button1); //get value from the button (0 or 1)
  val2 = digitalRead(button2);
  val3 = digitalRead(button3);

  if(val1==0){
    digitalWrite(led,HIGH);
    delay(250);
  }
  else{
    digitalWrite(led,LOW);
  }

  if(val2 ==0){
    digitalWrite(led, HIGH);
    delay(50);
  }
  else{
    digitalWrite(led, LOW);

  }

  if(val3==0){
    digitalWrite(led, HIGH);
    delay(5);
  }
  else{
    digitalWrite(led, LOW);
  }

  if(val1==0 && val2==0){
    digitalWrite(led, HIGH);
    delay(5);
    digitalWrite(led, LOW);
    delay(5);
    digitalWrite(led, HIGH);
    delay(5);
    digitalWrite(led, LOW);
    delay(5);
    digitalWrite(led, HIGH);
    delay(5);
    digitalWrite(led, LOW);
    delay(5);
  }
  else{
    digitalWrite(led, LOW);
  }

  Serial.print("B 1 : ");
  Serial.print(val1); //print to the serial monitor, just to see
  Serial.println();
  Serial.print("B 2 : ");
  Serial.println(val2);
  Serial.println();
  Serial.print("B 3 : ");
  Serial.println(val3);
  Serial.println();

  delay(500);
}
