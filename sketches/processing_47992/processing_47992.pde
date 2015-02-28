
public class quaternion{
 float a,b,c,d;
 quaternion(float a, float b, float c, float d){
  this.a=a;
  this.b=b;
  this.c=c;
  this.d=d;
 }
 public quaternion add(quaternion q2){
  return new quaternion(a+q2.a,b+q2.b,c+q2.c,d+q2.d);
 }
 public quaternion prod(quaternion q2){
  float A=a*q2.a-b*q2.b-c*q2.c-d*q2.d;
  float B=a*q2.b+b*q2.a+c*q2.d-d*q2.c;
  float C=a*q2.c-b*q2.d+c*q2.a+d*q2.b;
  float D=a*q2.d+b*q2.c-c*q2.b+d*q2.a;
  return new quaternion(A,B,C,D);
 }
 float[][] orthogonalMatrix(){
  return new float[][]{
   {pow(a,2)+pow(b,2)-pow(c,2)-pow(d,2), 2*b*c-2*a*d, 2*b*d+2*a*c},
   {2*b*c+2*a*d,pow(a,2)-pow(b,2)+pow(c,2)-pow(d,2),2*c*d-2*a*b},
   {2*b*d-2*a*c, 2*c*d+2*a*b, pow(a,2)-pow(b,2)-pow(c,2)+-pow(d,2)}
  };
 }
}

