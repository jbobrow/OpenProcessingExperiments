
class Trig_Bank{
  FloatDict Sin,Cos,Tan;
  Trig_Bank(){
    Sin = new FloatDict();
    Cos = new FloatDict();
    Tan = new FloatDict();
    for(float i = 0; i < TWO_PI; i+= PI/180){
      Sin.set(Float.toString(i),sin(i));
      Cos.set(Float.toString(i),cos(i));
      Tan.set(Float.toString(i),constrain(tan(i),-50,50));
    }    
  }
  float getSin(float theta){
    return Sin.get(Float.toString(theta));
  }
  float getCos(float theta){
    return Cos.get(Float.toString(theta));
  }
  float getTan(float theta){
    return Tan.get(Float.toString(theta));
  }
}

