
Blinking Impostor
Arduino LED Morse
int led = 13;

void setup() {                
  pinMode(led, OUTPUT);     
}

void loop() {
  digitalWrite(led, HIGH);  // I . .
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);               
  digitalWrite(led, HIGH);   
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
  digitalWrite(led, HIGH);  // M _ _
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);               
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   // P . _ _ .
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);      
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
  digitalWrite(led, HIGH);   // O _ _ _
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);  // S . . . 
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
  digitalWrite(led, HIGH);   
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
  digitalWrite(led, HIGH);   
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
  digitalWrite(led, HIGH);   // T _
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   // O _ _ _
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   // R . _ .
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
  digitalWrite(led, HIGH);   
  delay(500);               
  digitalWrite(led, LOW);    
  delay(200);  
  digitalWrite(led, HIGH);   
  delay(200);               
  digitalWrite(led, LOW);    
  delay(200);   
}


