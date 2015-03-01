
#include <Chrono.h>

Chrono monClignotement;
Chrono message;

boolean etatClignotement = false;

int led = 3;
int boutton = 12;

void setup()
{
  Serial.begin(57600);
  pinMode(led,OUTPUT);
  pinMode(boutton, INPUT);
}


void loop()
{
  int potentiometre = analogRead(0);
  int valeurPhoto = analogRead(1);
  int valeurBoutton = digitalRead(boutton);
  int clignotement = map(potentiometre, 0,1023,100,500);

  if (message.metro(100))
  {
    Serial.print("potentiometre ");
    Serial.print(potentiometre);
    Serial.println();
    Serial.print("boutton ");
    Serial.print(valeurBoutton);
    Serial.println();  
    Serial.print("photo ");
    Serial.print(valeurPhoto);
    Serial.println();  
  }

  if ( monClignotement.metro(clignotement)) {
    if (etatClignotement == false)
    {
      etatClignotement = true;
    } 
    else if (etatClignotement == true)
    {
      etatClignotement = false;
    }
  } 
  if (etatClignotement == false)
  {
    digitalWrite(led,HIGH);
  }
  else if (etatClignotement == true)
  {
    digitalWrite(led,LOW);
  }
}








