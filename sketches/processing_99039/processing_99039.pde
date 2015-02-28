
color cafe  = color (204, 102, 0);
color verde =  color (0, 255, 0);
float theta;
void setup(){
  size(900,800);
}

void draw(){
  background(0);
  frameRate(30);
  //stroke(255);
  stroke(204, 102, 0);// cafe
  translate(width/2,height);
  strokeWeight(5);
  line(0,0,0,-200);
  translate(0,-200);
  // aquí comienza la diversión:
  strokeWeight(1);
  stroke(0, 255, 0);
  //branch(120);
  randomSeed(0);
 rama2(150); 

}

void rama2(float h){
  stroke( lerpColor(cafe ,verde, 0.4) );
  h *= .7999999;
  if( h > 2) {
// rama derecha f(n -2)
    pushMatrix();
   float ang = random(30,75);
    theta = radians(noise(100,50,100) * ang  );
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    //branch(h);
    rama1(h);
    popMatrix();
   
    pushMatrix();
//    randomSeed(0);
    ang = random(30,75);
    theta = radians(noise(50,75,79) * ang);
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    //branch(h);
    rama2(h);
    popMatrix();
  }
   
  //2rama(h);
  //rama1(h);

}

void rama1(float h){
  h*= .79999;
  if( h > 2 ){
    // rama izquierda f(n - 1) 
    pushMatrix();

    float ang = random(30,75);
    theta = radians(noise(71,60,50)*ang);
    //theta = radians(45);
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    rama2(h);
    popMatrix();
  }
}










int fibo (int n){
   int []A = new int[120];
    if( n == 0) {
      return 0;
    }
    else if (n ==1) {
      return 1;
    }
    //else return fibo(n-1) + fibo(n-2); //funcion recursiva
    else {
      A[0] = 0;
      A[0] = 1;
      for(int i = 2; i<n ; i++){
        A[i] = A[i - 1] + A[i-2];
      }//fin for
      return A[n];
    }//fin del caso recursivo

}

