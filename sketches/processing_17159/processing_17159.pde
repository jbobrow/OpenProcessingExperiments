
class Time{
  int saveT;
  int totalT;
  
  Time(int total){
    totalT = total;
  }
  
  void start(){
    saveT = millis();
  }
  
  boolean finish(){
    int pastT = millis()-saveT;
    if(pastT>totalT){
      return true;
    }else{
      return false;
    }
  }
}
  
  

