

void setup(){
  size(300, 150);
  println(binary(2011, 11));  //year
  println(binary(12, 4));  //month
  println(binary(31, 5));  //date
  
  println(binary(12, 4));//hour 0~23
  println(binary(60, 6));//min 0~59
  println(binary(60, 6));//sec 0~59
    
  noStroke();
  fill(0, 200, 0);
}

String hourBinary;
String minuteBinary;
String secBinary;

int k = 0;
void draw(){
  fill(0,0,0,25);
  rect(0, 0, width, height);
  
  hourBinary = binary(hour(), 4);
  minuteBinary = binary(minute(), 6);
  secBinary = binary(second(), 6);
  
  k = 0;
  for(int i = 0; i < 4; i++){
    if(int(hourBinary.charAt(i)) == 49){
      fill(0, 200, 0);
      rect(100 + k * 50, 0, 50, 50); 
    }else{
      fill(0, 200, 0, 5);
      rect(100 + k * 50, 0, 50, 50); 
    }
    k++;
  }
  
  k = 0;
  for(int i = 0; i < 6; i++){
    if(int(minuteBinary.charAt(i)) == 49){
      fill(0, 200, 0);
      rect(k * 50, 50, 50, 50); 
    }else{
      fill(0, 200, 0, 5);
      rect(k * 50, 50, 50, 50); 
    }
    k++;
  }
  
  k = 0;
  for(int i = 0; i < 6; i++){
    if(int(secBinary.charAt(i)) == 49){
      fill(0, 200, 0);
      rect(k * 50, 100, 50, 50); 
    }else{
      fill(0, 200, 0, 5);
      rect(k * 50, 100, 50, 50); 
    }
    k++;
  }
  
}

