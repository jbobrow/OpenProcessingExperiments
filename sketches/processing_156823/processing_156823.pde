
//define variables
// cc = the n-term of fibonacci serie
int cc=19;
int num1 = 0;
int num2 = 1;
int num3 ;
//a simple 1 row array to save the fibonacci numbers
int[] fibonacci = new int[20];

void setup(){
  size(600,600);
  noStroke();
  frameRate(10);
  //we fill up the array
  for( int i=0;i<=19;i++){
   num3 = num2 + num1;
   num1 = num2;
   num2 = num3;
   fibonacci[i]=num3;
  }
  
}
void draw(){
    //we move the coordinates center
    translate(300,300);  
    if(cc >=0){
    fill(random(255),random(255),random(255));
    ellipse(0,0,fibonacci[cc],fibonacci[cc]);
    cc--;
    }
    
}
  
