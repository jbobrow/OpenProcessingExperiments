
int MicPin = 0;          // pin that the mic is attached to

int redPin = 4;          // pins that the cathodes of LED are attached to  
int greenPin = 3;
int bluePin = 2;
int pinkPin = 7;
int yellowPin = 10;
int purplePin = 11;
int whitePin = 13;

int MicValue = 0;        // the Microphone value

void setup() {
Serial.begin(9600);  //for test the input value initialize serial
  pinMode(redPin, OUTPUT);
  pinMode(greenPin, OUTPUT);
  pinMode(bluePin, OUTPUT);
  pinMode(pinkPin, OUTPUT);
  pinMode(yellowPin, OUTPUT);
  pinMode(purplePin, OUTPUT);
  pinMode(whitePin, OUTPUT);

  analogWrite(redPin, 255);       //turn off all LEDs
  analogWrite(greenPin, 255);
  analogWrite(bluePin, 255);
  analogWrite(pinkPin, 255);
  analogWrite(yellowPin, 255);
  analogWrite(purplePin, 255);
  analogWrite(whitePin, 255);
}

void loop() {

  MicValue = analogRead(MicPin);  //read the value of the microphone

Serial.println(MicValue);     //for test the input value

  if (MicValue > 550) {     //adjust this value to the desired sensitivity
    analogWrite(bluePin,0); //lights up blue
    delay(15);              //small delay for quick response at low noise levels
    }
 
  if (MicValue > 800) {       //adjust this value to the desired sensitivity
    analogWrite(bluePin,255); //lights up green and turn off blue
    analogWrite(greenPin, 0);
    delay(60);               //mid delay for response at mid noise levels
    }
 
  if (MicValue > 600) {        //adjust this value to the desired sensitivity
    analogWrite(greenPin,255); //lights up red and turn off green
    analogWrite(redPin, 0);
    delay(140);                //high delay for response at high noise levels
    }
    
  if (MicValue > 700) {        //adjust this value to the desired sensitivity
    analogWrite(redPin,255);
    analogWrite(pinkPin, 0);
    delay(30);                //high delay for response at high noise levels
    }
    
  if (MicValue > 650) {        //adjust this value to the desired sensitivity
    analogWrite(pinkPin,255);
    analogWrite(yellowPin, 0);
    delay(140);                //high delay for response at high noise levels
    }
    
  if (MicValue > 925) {        //adjust this value to the desired sensitivity
    analogWrite(yellowPin,255);
    analogWrite(purplePin, 0);
    delay(500);                //high delay for response at high noise levels
    }
    
  if (MicValue > 1020) {        //adjust this value to the desired sensitivity
    analogWrite(purplePin,255);
    analogWrite(whitePin, 0);
    delay(90);                //high delay for response at high noise levels
    }    
    
analogWrite(greenPin, 255);    //Turn off all LEDs
analogWrite(redPin, 255);
analogWrite(bluePin,255);  
analogWrite(pinkPin,255);
analogWrite(yellowPin,255);
analogWrite(purplePin,255);
analogWrite(whitePin,255);
}
