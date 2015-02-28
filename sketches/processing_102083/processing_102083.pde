
// Q7
float[] tops; 
void setup(){
  size(400,300);
  tops = new float[20]; 
  for(int i=0;i<tops.length ;i++){
    tops[i] = random(height); 
  }
}
void draw(){
 background(255);
 stroke(0);
 fill(127);
 for(int i=0;i<tops.length;i++){
   rect(20*i+2, tops[i] ,16,height); 
 }
}
