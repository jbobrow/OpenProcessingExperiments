


                
                //Objects

void setup(){
  SomeClass someInstance = new SomeClass(5);
  SomeClass someOtherInstance = new SomeClass();
  println(someInstance.someVar);
  println(someOtherInstance.someVar);
  
  someInstance.addToSomeVar(24);
  someInstance.addToSomeVar(88);
  someOtherInstance.addToSomeVar(-40);
  
  println(someInstance.someVar);
  println(someOtherInstance.someVar);
  
  someOtherInstance = new SomeClass();
  println(someInstance.differenceOfClasses(someOtherInstance));
}


class SomeClass{ 
  int someVar;

  SomeClass(){
  someVar=42;
  }

  SomeClass(int someIntArg){
    someVar=someIntArg;
  }
  
  void addToSomeVar (int numToAdd){
    someVar += numToAdd;
  }
  
  int differenceOfClasses(SomeClass otherObject){
    return someVar-otherObject.someVar;
  }
  
}
