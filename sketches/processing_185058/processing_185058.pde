
void setup(){
    println(cylinderVolume(3.0, 6.0));
    println(cylinderVolume(6.0, 3.0));
    println(cylinderVolume(12.0, 1.0));
    println(cylinderVolume(3.0, 0.04));

}


void draw(){
  
}

float cylinderVolume(float cylHeight, float cylRadius){
  return 3.14 * cylRadius * cylRadius * cylHeight;
}




