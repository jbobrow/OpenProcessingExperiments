
import processing.serial.*;
import cc.arduino.*;

Arduino arduino;
int[] Leds = {6,8,10,12};
int[] Numero1={0,0,0,1};
int[] Numero2={0,0,1,0};
int[] Numero3={0,0,1,1};
int[] Numero4={0,1,0,0};
int[] Numero5={0,1,0,1};
int[] Numero6={0,1,1,0};
int[] Numero7={0,1,1,1};
int[] Numero8={1,0,0,0};
int i, n=0, d=3000, a=125; //contador, numero, delay, alto de los circulos

void setup()
{
  //println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  for(i=0 ; i<=3 ; i++){
    arduino.pinMode(Leds[i], Arduino.OUTPUT);
  }
  size(500, 300);
  textSize(64);
  textAlign(CENTER);
  strokeWeight(8);
}

void draw()
{
  background(#FFFFFF);

if(n==1){
  for(i=0 ; i<=3 ; i++){
    if(Numero1[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==2){
  for(i=0 ; i<=3 ; i++){
    if(Numero2[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==3){
  for(i=0 ; i<=3 ; i++){
    if(Numero3[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==4){
  for(i=0 ; i<=3 ; i++){
    if(Numero4[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==5){
  for(i=0 ; i<=3 ; i++){
    if(Numero5[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==6){
  for(i=0 ; i<=3 ; i++){
    if(Numero6[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==7){
  for(i=0 ; i<=3 ; i++){
    if(Numero7[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  //////////////////////////////////////////////////////////
if(n==8){
  for(i=0 ; i<=3 ; i++){
    if(Numero8[i]==0){
      arduino.digitalWrite(Leds[i], Arduino.LOW);
    }
    else{
      arduino.digitalWrite(Leds[i], Arduino.HIGH);
    }
  }
  delay(d);
}
  /////////////////////////////////////////////////////////
  //Apagar los leds
  for(i=0 ; i<=3 ; i++){
    arduino.digitalWrite(Leds[i], Arduino.LOW);
    //arduino.pinMode(Leds[i], Arduino.OUTPUT);
  }
  
  //4 Circulos en blanco
  fill(#FFFFFF);
  for(i=100 ; i<=400 ; i=i+100){
    ellipse(i, a, 90, 90);
  }
  delay(1500);
  n=n+1;
  if(n>8){
    n=1;
  }
  
  fill(0);
  text(n, width/2, 250);
  
  switch(n){
    case 1:
    fill(0);//Negro
    ellipse(400, a, 90, 90);
    break;
    
    case 2: 
    fill(#00FF01);//Verde
    ellipse(300, a, 90, 90);
    break;
    
    case 3: 
    fill(#00FF01);//Verde
    ellipse(300, a, 90, 90);
    fill(0);
    ellipse(400, a, 90, 90);
    break;
    
    case 4: 
    fill(#FF0307);//Rojo
    ellipse(200, a, 90, 90);
    break;
    
    case 5: 
    fill(#FF0307);//Rojo
    ellipse(200, a, 90, 90);
    fill(0);//Negro
    ellipse(400, a, 90, 90);
    break;
    
    case 6: 
    fill(#FF0307);//Rojo
    ellipse(200, a, 90, 90);
    fill(#00FF01);//Verde
    ellipse(300, a, 90, 90);
    break;
    
    case 7: 
    fill(#FF0307);//Rojo
    ellipse(200, a, 90, 90);
    fill(#00FF01);//Verde
    ellipse(300, a, 90, 90);
    fill(0);
    ellipse(400, a, 90, 90);
    break;
    
    case 8: 
    fill(#000EFF);
    ellipse(100, a, 90, 90);
    break;
  }
}
