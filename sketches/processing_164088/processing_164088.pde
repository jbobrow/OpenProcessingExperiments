
//Declaración 

int [] Edad={19,20,20,19,21,20};
int [] Talla={167,174,169,150,160,164};
float [] Peso={52,75.8,75,45,80,65.8};
float [] PI=new float[6];
float [] DP=new float[6];


//ús de for + declaración de i en el interior

for(int i=0; i<6;i++)
{
  PI[i]=Talla[i]-100+(Edad[i]/10)*0.9;
  DP[i]= abs(PI[i]-Peso[i]);
  
  println("Para la edad de "+Edad[i]+ " años y la altura de "+Talla[i]+" cm, tu peso ideal es de "+PI[i]+" kg.");
  
  if (Peso[i]>PI[i]) {
    println("Tienes  que adelgazar "+DP[i]+" Kg.");}
    
  else {
    if (Peso[i] == PI[i]) {
      println("¡tu peso es ideal!");}
      else{ 
        println("Tienes que ganar "+DP[i]+" Kg.");}
       }
}

