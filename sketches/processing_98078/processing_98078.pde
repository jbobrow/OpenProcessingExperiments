
void setup(){
  size(200,550);
  

}
void draw(){
  background(255);
    for(int i=height+500; i>0; i-=50){
   float c=map(i,0,height+500,100,255);
   fill(c);
   rect(85,i/2-15,50,20);
    fill(0);
   text(i/10-55,100,i/2); 
  }
  float cel=map(mouseY,0,height,-50,50);
  text(celcius(cel),150,100);
  text(cel,10,100);
  //println(tempConverter(cel));
}

float celcius(float celtemp){
 float f=celtemp*9/5+32;
 return f; 
}

float farenheit(float ftemp){
 float c=(ftemp-32)*5/9;
 return c; 
}
